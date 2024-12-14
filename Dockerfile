# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application script and templates folder
COPY app.py .
COPY templates ./templates

# Expose the port Flask will run on
EXPOSE 5000

# Set the default command to run your Flask app
CMD ["python", "app.py"]