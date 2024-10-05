import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'dart:io';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

class DetectScreen extends StatefulWidget {
  @override
  _DetectScreenState createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  Interpreter? _interpreter;
  bool _modelLoaded = false;
  String _result = '';
  Timer? _timer;
  FlutterTts _flutterTts = FlutterTts();

  // List of class labels
  final List<String> _classLabels = [
    "awake",
    "distracted",
    "drowsy",
    "head drop",
    "phone",
    "smoking",
    "yawn"
  ];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
    _flutterTts.setLanguage("en-US");
  }

  @override
  void dispose() {
    _controller.dispose();
    _interpreter?.close();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);

      _controller = CameraController(frontCamera, ResolutionPreset.high);
      _initializeControllerFuture = _controller.initialize();

      await _initializeControllerFuture;

      print("Camera initialized successfully");

      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        _captureAndDetect();
      });
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  Future<void> _loadModel() async {
    try {
      _interpreter =
          await Interpreter.fromAsset('assets/50epoch_float32.tflite');
      setState(() {
        _modelLoaded = true;
      });
      print("Model loaded successfully");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<void> _captureAndDetect() async {
    print("Capturing and detecting...");
    if (_initializeControllerFuture == null) {
      print("Camera is not initialized yet");
      return;
    }

    try {
      await _initializeControllerFuture;
      print("Camera initialized");

      final image = await _controller.takePicture();
      final imagePath = image.path;
      print("Image captured: $imagePath");

      final img.Image imageInput = await _loadImage(imagePath);
      final inputData =
          Uint8List.fromList(imageInput.getBytes()).reshape([1, 640, 640, 3]);

      final output = List.filled(1 * 11 * 8400, 0.0).reshape([1, 11, 8400]);

      if (_interpreter != null && _modelLoaded) {
        print("Running interpreter...");
        _interpreter!.run(inputData, output);

        final processedOutput = output
            .map((e) => (e as List)
                .map((e) => (e as List).map((e) => e as double).toList())
                .toList())
            .toList();

        print("Processing output...");
        final detectedClass = _processOutput(processedOutput);

        final detectedLabel = _classLabels[detectedClass];
        setState(() {
          _result = detectedLabel;
        });

        print("Detection result: $detectedLabel");
        _triggerAssistantCommand(detectedLabel); // Trigger AI assistant
      }
    } catch (e) {
      print("Error capturing or detecting image: $e");
    }
  }

  Future<img.Image> _loadImage(String imagePath) async {
    final file = File(imagePath);
    final image = img.decodeImage(file.readAsBytesSync())!;
    final resizedImage = img.copyResize(image, width: 640, height: 640);
    return resizedImage;
  }

  int _processOutput(List<List<List<double>>> output) {
    print("Processing output data...");
    final outputData = output[0];
    double maxConfidence = -double.infinity;
    int detectedClass = -1;

    for (int classId = 0; classId < outputData.length; classId++) {
      for (int i = 0; i < outputData[classId].length; i++) {
        double confidence = outputData[classId][i];
        if (confidence > maxConfidence) {
          maxConfidence = confidence;
          detectedClass = classId;
        }
      }
    }

    if (detectedClass != -1) {
      print('Detected class: ${_classLabels[detectedClass]}');
      print('Confidence: $maxConfidence');
    } else {
      print("No valid class detected.");
    }

    return detectedClass;
  }

  void _triggerAssistantCommand(String driverState) {
    String command;

    switch (driverState) {
      case 'awake':
        command = "You are fully alert. Drive safely.";
        break;
      case 'drowsy':
        command = "You appear drowsy. It's recommended to take a break.";
        break;
      case 'distracted':
        command = "Please focus on the road.";
        break;
      case 'phone':
        command = "Using the phone while driving is dangerous.";
        break;
      case 'smoking':
        command = "Smoking while driving may distract you.";
        break;
      case 'yawn':
        command = "You appear tired. Consider resting.";
        break;
      default:
        command = "Stay alert and drive safe.";
    }

    _speak(command); // Trigger the voice command
  }

  Future<void> _speak(String message) async {
    await _flutterTts.speak(message);
  }

  @override
  Widget build(BuildContext context) {
    // Map result to corresponding image paths
    Map<String, String> imageMap = {
      'awake': 'assets/awake.png',
      'distracted': 'assets/very_dis.png',
      'drowsy': 'assets/very_dis.png',
      'head drop': 'assets/very_dis.png',
      'phone': 'assets/very_dis.png',
      'smoking': 'assets/very_dis.png',
      'yawn': 'assets/very_dis.png',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Detection Screen'),
      ),
      body: Container(
        color: Color(0xFFF1D7C7), // Set background color
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              width: 150,
              height: 150,
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (imageMap.containsKey(_result))
                    Image.asset(imageMap[_result]!),
                  SizedBox(height: 20),
                  Text(
                    _result.isNotEmpty ? ' $_result' : 'Detecting...',
                    style: TextStyle(fontSize: 18),
                  ),
                  if (_result != 'awake') // Timer displayed when not "awake"
                    TimerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Timer widget displayed when not awake
class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      ' ',
      style: TextStyle(fontSize: 16, color: Colors.red),
    );
  }
}
