FROM python:3.10.8
WORKDIR /root/Basic_signup/app
RUN apt install python3-pip -y \
pip install django \
python3 manage.py makemigrations \
python3 manage.py migrate
COPY requirements.txt ./
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
