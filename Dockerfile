FROM python:3.10
WORKDIR /root/Basic_signup/app
RUN apt install python3-pip
RUN pip3 install MODULE
RUN pip install django 
RUN python manage.py makemigrations 
RUN python manage.py migrate
COPY requirements.txt ./
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
