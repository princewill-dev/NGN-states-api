# Use specific Python version
FROM python:3.8.10

# Install PostgreSQL from official repo 
RUN apt-get update && apt-get install -y wget gnupg2 lsb-release

# Add PostgreSQL's third party repository
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

# Import the repository signing key
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Update the package lists
RUN apt-get update

# Install PostgreSQL 14 and PostgreSQL client
RUN apt-get -y install postgresql-14 postgresql-client-14

# Set env vars together   
ENV POSTGRES_DB=server_001 \
    POSTGRES_USER=server_001 \
    POSTGRES_PASSWORD=server_001

# Set working directory
WORKDIR /app 

# Copy and set permissions
COPY --chown=myuser:mygroup . /app

COPY ./requirements.txt /app/requirements.txt

# Install dependencies 
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r /app/requirements.txt

# Collect static files
RUN python /app/manage.py collectstatic --noinput

# Expose ports
EXPOSE 80 5432 8000

# Start app server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myapp.wsgi"]
