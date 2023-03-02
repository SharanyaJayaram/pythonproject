FROM python3
WORKDIR /root/Basic_signup/app
RUN apt install python3-pip -y 
RUN pip install django 
RUN python3 manage.py makemigrations 
RUN python3 manage.py migrate
COPY requirements.txt ./
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
