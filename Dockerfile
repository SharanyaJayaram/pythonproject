FROM python:3.10
RUN apt-get update
RUN pip install --upgrade pip
RUN pip install django
WORKDIR /root/Basic_signup/app
COPY manage.py ./
# RUN python3 manage.py makemigrations
# RUN python3 manage.py migrate
# EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0:8000"]
