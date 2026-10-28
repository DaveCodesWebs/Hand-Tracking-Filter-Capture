#!/bin/bash
set -e
cd "$(dirname "$0")"

echo
echo "=========================================="
echo "  Hand Tracking Filter Capture"
echo "=========================================="
echo
echo "This launcher sets up the project the first time, then starts it."
echo

PYTHON=""
for candidate in python3.11 python3.10; do
  if command -v "$candidate" >/dev/null 2>&1; then
    PYTHON="$candidate"
    break
  fi
done

if [ -z "$PYTHON" ] && command -v python3 >/dev/null 2>&1; then
  PYTHON="python3"
fi

if [ -z "$PYTHON" ]; then
  echo "ERROR: Python was not found."
  echo "Install Python 3.11 from https://www.python.org/downloads/ and run this launcher again."
  read -r -p "Press Return to close..."
  exit 1
fi

echo "Using $($PYTHON --version)"
if [ ! -x ".venv/bin/python" ]; then
  echo "Creating a private Python environment..."
  "$PYTHON" -m venv .venv
fi

echo "Installing or checking required packages..."
".venv/bin/python" -m pip install --upgrade pip
".venv/bin/python" -m pip install -r requirements.txt

echo
echo "Starting the application. Press Q in the camera window to quit."
echo
".venv/bin/python" main.py
