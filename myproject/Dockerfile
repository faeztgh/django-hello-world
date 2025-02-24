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

# Make the entrypoint script executable.
RUN chmod +x /app/entrypoint.sh

# Expose the port that Dokploy will assign (using the $PORT environment variable).
EXPOSE 8000

# Run the entrypoint script.
CMD ["/app/entrypoint.sh"]
