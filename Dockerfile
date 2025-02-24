# Use an official lightweight Python image.
FROM python:3.9-slim

# Set environment variables to prevent Python from writing pyc files and buffering stdout/stderr.
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container.
WORKDIR /app

# Copy and install Python dependencies.
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the entire project into the container.
COPY . /app/

# Expose the port that Dokploy provides (using the $PORT environment variable).
EXPOSE 8000

# Start the application using gunicorn.
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:$PORT"]
