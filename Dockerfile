# Use the official Python image as a base image
FROM python:3.10.12-alpine

# Set the working directory in the container
WORKDIR /business-inventory

# Copy the requirements file first to leverage Docker caching
COPY requirements.txt /business-inventory/

# Upgrade pip and install the dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the entire project to the container
COPY . /business-inventory/

# Expose the port that Django runs on
EXPOSE 8000

# Run database migrations and start the Django server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
