# setting the version to 3.7
FROM python:3.7

# # Use an official TensorFlow GPU image as a parent image
# FROM tensorflow/tensorflow:latest-gpu

# Or use a specific version of TensorFlow GPU image as a parent image
FROM tensorflow/tensorflow:2.4.0-gpu

# Set the working directory to /app
WORKDIR /app

# Clone the mathematics_dataset repository
RUN git clone https://github.com/deepmind/mathematics_dataset.git

# install the requirements provided in the setup script
RUN python3 setup.py install

# Copy the training data to the working directory
COPY training_data.tar.gz /app

# Extract the training data
RUN tar -xvzf training_data.tar.gz

# Copy the training script to the working directory
COPY train.py /app

# Run the command to start training the model
CMD ["python", "train.py"]






# RUN apt-get update && \
#   apt-get install -y --no-install-recommends \
#   git \
#   && rm -rf /var/lib/apt/lists/*

# WORKDIR /app



# RUN pip install -r mathematics_dataset/requirements.txt

# CMD ["/bin/bash"]