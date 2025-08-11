# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies (if needed) and upgrade pip
RUN apt-get update && apt-get install -y --no-install-recommends \
    && pip install --upgrade pip \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching layers
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 80 for the application
EXPOSE 80

# Run the application
CMD ["python", "run.py"]

