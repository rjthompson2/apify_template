FROM python:3.12

# Set the working directory in the container
WORKDIR /

# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


# Copy the requirements file into the container at /
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

# Expose the port your application listens on (if applicable)
EXPOSE 8000

# Define environment variables (optional)
ENV NAME Apify

# Run the application
CMD ["python", "/main.py"]
