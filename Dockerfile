FROM python
WORKDIR /root/Basic_signup/app
RUN sudo add-apt-repository universe
RUN sudo apt-get update
RUN sudo apt-get install python3-pip
RUN pip install django 
RUN python manage.py makemigrations 
RUN python manage.py migrate
COPY requirements.txt ./
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
