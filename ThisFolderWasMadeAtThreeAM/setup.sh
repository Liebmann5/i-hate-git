#!/bin/bash

# Check for a command that runs Python 3
for CMD in python3 python py; do
    $CMD -c "import sys; sys.exit(sys.version_info < (3,))" &>/dev/null
    if [ $? -eq 0 ]; then
        PYTHON_CMD=$CMD
        break
    fi
done

if [ -z "$PYTHON_CMD" ]; then
    echo "This script requires Python 3, but it's not installed."
    exit 1
fi

# Create a virtual environment
$PYTHON_CMD -m venv ../virtual_environments_smell_like_updog

# Activate the virtual environment
source virtual_environments_smell_like_updog/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run your Python script
python Legit/JobSearchWorkflow.py

# Deactivate the virtual environment
deactivate