
# Real-Time Object Detection and Video Streaming
![Python](https://img.shields.io/badge/Python-3.x-blue)
![Flask](https://img.shields.io/badge/Framework-Flask-green)
![OpenCV](https://img.shields.io/badge/OpenCV-4.x-red)
![YOLOv8](https://img.shields.io/badge/Model-YOLOv8-orange)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/License-MIT-lightgrey)
![Firebase](https://img.shields.io/badge/Cloud-Firebase-yellow)

## 1. Introduction

This project focuses on real-time object detection and video streaming. We utilize a deep learning model to identify and classify objects within a video feed, sending results to Firebase. The data is then displayed using a Flask-based API, while the video stream is managed through WebSockets. The system is versatile, suitable for monitoring, alert systems, or security setups.

---

## 2. How to Run It / Steps to Reproduce

### Prerequisites
1. Ensure Python 3.x is installed.
2. Install the necessary libraries:
   ```bash
   pip install -r requirements.txt
   ```
   The `requirements.txt` file should include Flask, Firebase Admin SDK, Torch, OpenCV, WebSockets, and any other dependencies.

### Set Up Firebase
1. Place your Firebase credentials JSON file in the appropriate location and update `detect.py` with the correct path:
   ```python
   cred = credentials.Certificate("path/to/your/serviceAccountKey.json")
   ```
2. This configuration enables saving detection results to Firebase.

### Project Folder Structure
```
Project_Root/
│
├── scripts/
│   ├── detect.py               # Main detection and Firebase logging script
│   ├── get_img.py              # Script for WebSocket video streaming
│   ├── main.py                 # Flask API server
│
├── static/
│   └── inference.jpg           # Image to show detections
│
└── config/
    └── serviceAccountKey.json  # Firebase credentials
```

### Steps to Run
1. **Start the Detection Script:**
   - Runs the model, logs results to Firebase, and saves detection images.
   ```bash
   python detect.py --weights <model_weights.pt> --source <input_source>
   ```

2. **Run the WebSocket Server:**
   - Open a new terminal and execute `get_img.py` to stream video frames.
   ```bash
   python get_img.py
   ```

3. **Launch the Flask Server:**
   - Start the API server with `main.py` to handle alerts and data.
   ```bash
   python main.py
   ```

### How to Access
- **WebSocket Stream:** Connect your WebSocket client to the stream (default port is 5000) for live images.
- **API Endpoints:**
  - `GET /data`: Retrieve the latest alerts.
  - `POST /alarm`: Access alarm data.

---

## 3. Features

- **Real-Time Object Detection:**
  - Utilizes a custom model for object detection in live streams, sending updates to Firebase.
  - Implements Non-Max Suppression to highlight the most relevant detections.

- **Live Streaming via WebSockets:**
  - Streams video frames in real-time to connected clients.

- **REST API with Flask:**
  - Manages alerts and status updates, enabling easy integration with other systems.

- **Cloud Storage with Firebase:**
  - Saves detection results for remote access and scalability.

---

## 4. Conclusion

This project provides an efficient setup for real-time monitoring and object detection. It is designed for seamless integration into other applications and can be scaled for diverse use cases, such as security or industrial monitoring. The combination of streaming and API features ensures flexibility and reliability for various scenarios.
