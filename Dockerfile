FROM ubuntu:22.04
RUN apt-get update && apt install python3-pip -y
RUN pip install Django
COPY . .
RUN python3 manage.py migrate
CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
