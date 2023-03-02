FROM python:3.10
RUN pip install --upgrade pip
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
