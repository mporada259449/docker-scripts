FROM python@sha256:827ab09571b0d22c75e97e2a569703149d39d535d4a71dc6ea6221b0c9821da9

WORKDIR /celery

COPY ./django_app/django_app/celery_worker.py /celery/django_app
COPY ./django_app/requirements.txt /celery/
COPY ./django_app/calculator/calculator.py /celery/calculator/

RUN pip install -r requirements.txt

CMD ["celery", "-A", "django_app.celery_worker", "worker", "l", "info"]


#COPY /home/dev/docker-project/django_app/django_app/celery_worker.py /celery/django_app/
#COPY /home/dev/docker-project/django_app/django_app/settings.py /celery/django_app/
#COPY /home/dev/docker-project/django_app/calculator/calculator.py /celery/calculator/
#COPY /home/dev/docker-project/django_app/.env /celery/
#COPY /home/dev/docker-project/django_app/requirements.txt /celery/
#COPY /home/dev/docker-project/django_app/ /django_app
#WORKDIR /django_app
#RUN pip install -r requirements.txt
#RUN pip install sqlalchemy
