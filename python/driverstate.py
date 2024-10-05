import streamlit as st
from ultralytics import YOLO  # Import the Ultralytics YOLO model
import cv2
import numpy as np
import pyttsx3  # For text-to-speech

# Load the YOLO model
model_path = 'best_openvino_model/'  # Update this path as per your environment
model = YOLO(model_path)

# Custom class names from your metadata
class_names = {
    0: 'awake',
    1: 'distracted',
    2: 'drowsy',
    3: 'head drop',
    4: 'phone',
    5: 'smoking',
    6: 'yawn'
}

# Initialize the TTS engine
engine = pyttsx3.init()

# Function to play TTS alert
def play_alert(message):
    engine.say(message)
    engine.runAndWait()

# Function to run pose estimation
def run_pose_estimation(source):
    cap = cv2.VideoCapture(source)
    stframe = st.empty()  # Streamlit container for the video frames

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            st.warning("Failed to read from video source. Exiting...")
            break

        # Run inference using the YOLO model
        results = model(frame)

        # Loop through results and process each one
        for result in results:
            # Print the detected class name, ID, and confidence in the command line
            for box in result.boxes:
                class_id = int(box.cls.item())  # Convert tensor to int
                confidence = float(box.conf.item())  # Convert tensor to float
                class_name = class_names.get(class_id, "Unknown")  # Get class name from metadata
                print(f"Detected class: {class_name} (ID: {class_id}), Confidence: {confidence:.2f}")

                # TTS alert for specific driver states
                if class_name in ['distracted', 'drowsy', 'head drop', 'phone', 'yawn']:
                    play_alert("Hey, you are distracted, please focus on the road!")

            # Annotate frame with detected keypoints and bounding boxes
            annotated_frame = result.plot()

        # Convert the annotated frame to RGB for Streamlit display
        annotated_frame_rgb = cv2.cvtColor(annotated_frame, cv2.COLOR_BGR2RGB)

        # Display the frame using Streamlit
        stframe.image(annotated_frame_rgb, channels="RGB", use_column_width=True)

    cap.release()

# Use the webcam or video file
USE_WEBCAM = True
cam_id = 0  # Default webcam ID
video_path = ""  # Optional: path to a video file if you want to use it

source = cam_id if USE_WEBCAM else video_path

# Streamlit app
st.title('Driver State Detection')

# Button to start the pose estimation
if st.button('Start Pose Estimation'):
    run_pose_estimation(source)
