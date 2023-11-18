# Use an official Python runtime as a parent image
FROM python:3.8

# Install system dependencies
RUN apt-get update && apt-get install -y postgresql postgresql-contrib nginx

# Set environment variables for PostgreSQL
ENV POSTGRES_DB=server_001
ENV POSTGRES_USER=server_001
ENV POSTGRES_PASSWORD=server_001

# Set the working directory
WORKDIR /app

# Copy the entire project to the container
COPY . /app

#upgrade pip
RUN pip install --upgrade pip

# Install dependencies for Django
RUN pip install --no-cache-dir -r /app/django/requirements.txt

# PostgreSQL setup
RUN service postgresql start && \
    su - postgres -c "psql -c 'CREATE DATABASE server_001;'" && \
    su - postgres -c "psql -c 'CREATE USER server_001 WITH PASSWORD '\''server_001'\'';'" && \
    su - postgres -c "psql -c 'ALTER ROLE server_001 SET client_encoding TO '\''utf8'\'';'" && \
    su - postgres -c "psql -c 'ALTER ROLE server_001 SET default_transaction_isolation TO '\''read committed'\'';'" && \
    su - postgres -c "psql -c 'ALTER ROLE server_001 SET timezone TO '\''UTC'\'';'" && \
    service postgresql stop

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 80
EXPOSE 8000

# Start Django application
CMD ["python", "/app/django/manage.py", "runserver", "0.0.0.0:8000"]
