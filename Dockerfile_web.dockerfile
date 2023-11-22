FROM python@sha256:827ab09571b0d22c75e97e2a569703149d39d535d4a71dc6ea6221b0c9821da9

#RUN useradd -ms /bin/bash webserver
#RUN usermod -aG webserver webserver
#USER webserver:webserver

WORKDIR /django_app
COPY ./django_app/ .

RUN pip install -r requirements.txt


CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]