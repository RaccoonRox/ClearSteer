# Driver State Detection App

## Overview

This project utilizes the YOLO (You Only Look Once) model and OpenVINO to detect driver states and develop an application that guides drivers based on their current state. The application is built using Flutter for the front end and leverages Python for backend processing.

## Features

- Real-time driver state detection (awake, distracted, drowsy, head drop, phone usage, smoking, yawning).
- Alerts and guidance for drivers based on detected states.
- Developed using Flutter and integrated with OpenVINO for efficient model inference.

## Technologies Used

- **YOLO**: For object detection and driver state recognition.
- **OpenVINO**: For optimizing and deploying the YOLO model.
- **Flutter**: For building the cross-platform mobile application.
- **Python**: For model inference.

## Installation

### Prerequisites

Make sure you have the following installed on your system:

- Flutter SDK
- Python 3.x
- OpenVINO Toolkit

### Setting Up the Flutter Environment

1. Clone the repository:
    ```bash
    git clone https://github.com/RaccoonRox/ClearSteer.git
    cd ClearSteer
    ```

2. Install the required Flutter packages:
    ```bash
    flutter pub get
    ```

### Running the Flutter App

To run the Flutter app, use the following command:
```bash
flutter run
```
## Setting Up the Python Environment

1. Navigate to the Python backend directory (if applicable):
    ```bash
    cd path/to/python/backend
    ```

2. Install the required Python packages:
    ```bash
    pip install -r requirements.txt
    ```

### Running the Python Backend

To run the Python backend, use:
```bash
python driverstate.py
```
