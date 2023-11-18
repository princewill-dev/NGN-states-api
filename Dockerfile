# Use specific Python version
FROM python:latest

# Set working directory
WORKDIR /app 

# Copy the current directory contents into the container at /app
COPY . /app

COPY ./manage.py /app/manage.py

COPY ./requirements.txt /app/requirements.txt

# Install dependencies 
RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r /app/requirements.txt

# Collect static files
RUN python /app/manage.py collectstatic --noinput

# Expose ports
EXPOSE 80 5432 8000

# Start app server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "NaijaProject.wsgi"]
