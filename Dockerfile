# Use specific Python version
FROM python:3.8-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 

# Set working directory
WORKDIR /app 

RUN apt-get update \
  && apt-get install -y postgresql-client gcc python3-dev 

# Copy the current directory contents into the container at /app
COPY . /app

COPY ./manage.py /app/manage.py

COPY ./requirements.txt /app/requirements.txt

# Install dependencies 
RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r /app/requirements.txt

# Collect static files
RUN python /app/manage.py collectstatic --noinput

ENV POSTGRES_DB=server_002
ENV POSTGRES_USER=server_002
ENV POSTGRES_PASSWORD=server_002
ENV POSTGRES_HOST=postgres

ENV SECRET_KEY = 'django-insecure-zdjbo02g9pu)87h+c_o1fu_(yp()@cb9tu(cf1*ob-x^-u&pi-'

# Expose ports
EXPOSE 80 5432 8000

# Start app server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "NaijaProject.wsgi"]
