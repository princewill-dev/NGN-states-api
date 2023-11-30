FROM python:3.10.12

WORKDIR /app  

COPY . .  

RUN apt update && apt install -y python3-pip

RUN pip install -r requirements.txt

EXPOSE 8000  

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]