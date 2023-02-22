# Use an official TensorFlow GPU image as a parent image
FROM tensorflow/tensorflow:latest-gpu

# Set the working directory to /app
WORKDIR /app

# Install the mathematics_dataset library
RUN pip install mathematics_dataset

# Copy the training data to the working directory
COPY training_data.tar.gz /app

# Extract the training data
RUN tar -xvzf training_data.tar.gz

# Copy the training script to the working directory
COPY train.py /app

# Run the command to start training the model
CMD ["python", "train.py"]
