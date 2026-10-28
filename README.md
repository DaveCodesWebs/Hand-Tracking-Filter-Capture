# Hand Tracking Filter Capture

A real-time computer-vision project that uses your webcam and MediaPipe hand tracking to create a filter-filled portal between your hands. Move your hands apart to position and resize the portal; bring them together to switch to the next visual filter.

## Features

- Real-time webcam feed using OpenCV
- Two-hand tracking with MediaPipe
- A portal area defined by the tips of your index fingers and thumbs
- Multiple visual filters, including grid, halftone, glitch, color-map, sepia, neon-edge, pixelated, inverted, and pop-art effects
- Switch filters by bringing your hands together and then separating them
- Press `Q` to quit

> **Note:** The current code displays the live camera effect. It does not save screenshots or record video files.

## Requirements

- Python **3.10 or 3.11** recommended for compatibility with `mediapipe==0.10.14`
- A working webcam
- Camera permission for your terminal or Python/IDE
- Internet access for the initial package installation

## Setup and run

### 1. Download the project

Clone the repository:

```bash
git clone https://github.com/DaveCodesWebs/Hand-Tracking-Filter-Capture.git
cd Hand-Tracking-Filter-Capture
```

Alternatively, download the repository as a ZIP from GitHub and extract it.

### 2. Open the project folder

The Python application files are inside the `Filters` directory:

```bash
cd Filters
```

Run the following setup and run commands from this directory.

### 3. Create a virtual environment

**macOS / Linux:**

```bash
python3 -m venv .venv
source .venv/bin/activate
```

**Windows (PowerShell):**

```powershell
py -3.11 -m venv .venv
.\.venv\Scripts\Activate.ps1
```

If PowerShell blocks activation, you can use Command Prompt instead:

```bat
.venv\Scripts\activate.bat
```

### 4. Install dependencies

Upgrade pip and install the project's requirements:

```bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

The requirements install OpenCV, MediaPipe `0.10.14`, and NumPy. If installation fails, check that you are using a supported Python version (Python 3.10 or 3.11 is recommended).

### 5. Start the application

From inside the `Filters` directory, run:

```bash
python main.py
```

Allow camera access if your operating system asks. A window with the live webcam feed should open.

## How to use it

1. Make sure both hands are visible to the webcam.
2. Extend your index fingers and thumbs so the four fingertips outline the portal.
3. Move your hands apart or closer together to resize the portal.
4. Bring the hands close together to switch to the next filter. Separate them again before bringing them together for another switch.
5. Press **`Q`** while the camera window is focused to close the application.

The available filters are defined in `filters.py`. The active filter advances through the list when the closing gesture is detected.

## Troubleshooting

### The camera does not open

- Close other apps that may be using the webcam.
- Allow camera access for Terminal, your IDE, or Python in your system privacy settings.
- If your computer has multiple cameras, change `cv2.VideoCapture(0)` in `main.py` to another camera index such as `1`.

### `ModuleNotFoundError` for OpenCV, MediaPipe, or NumPy

Activate the virtual environment, make sure your terminal is in the `Filters` directory, and run:

```bash
python -m pip install -r requirements.txt
```

### MediaPipe installation fails

Use Python 3.10 or 3.11 and recreate the virtual environment with that interpreter. For example, if Python 3.11 is installed:

```bash
python3.11 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

### The filter portal does not appear

- Ensure both hands are in view at the same time.
- Improve lighting and keep your fingertips visible.
- Move your hands farther apart so the portal has enough width.
- Try moving slightly closer to the webcam.

### Quit the program

Focus the webcam window and press `Q`. If the application stops unexpectedly, check the terminal for the error message.

## Project structure

```text
Hand-Tracking-Filter-Capture/
└── Filters/
    ├── main.py             # Webcam loop and hand-tracking application
    ├── hand_tracking.py    # Hand landmark helpers
    ├── geometry.py         # Portal geometry and gesture detection
    ├── filters.py          # Visual filter effects
    └── requirements.txt    # Python dependencies
```

## Dependencies

- [OpenCV](https://opencv.org/) — webcam access and image processing
- [MediaPipe](https://ai.google.dev/edge/mediapipe/solutions/vision/hand_landmarker) — hand tracking
- [NumPy](https://numpy.org/) — numerical operations on image data

## License and attribution

If this project is based on or adapted from another repository, retain the original author's required attribution and follow that repository's license. Add the applicable license file and attribution details here before redistributing if required.
