FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt /app/

# Install system dependencies including for OpenCV
RUN apt-get update && apt-get install -y \
    git cmake build-essential libssl-dev python3-dev libgl1 libglib2.0-0 \
 && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install TenSEAL
# RUN pip install --upgrade pip setuptools wheel
# RUN pip install git+https://github.com/OpenMined/TenSEAL.git@main

# Install Python dependencies
RUN pip install --prefer-binary -r requirements.txt

# Copy application code
COPY . /app/

EXPOSE 5000

CMD ["python", "app.py"]