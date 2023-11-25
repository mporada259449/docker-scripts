FROM python@sha256:729a76e129b717cf784b40a65938aeb7e025259b1b35e7c8c2ff6c3419d1245c

RUN useradd -ms /bin/bash celery
RUN usermod -aG celery celery

COPY  --chown=celery:celery ./django_app/ /celery/django_app

WORKDIR /celery/django_app
RUN pip install -r requirements.txt

USER celery:celery
CMD ["celery", "-A", "django_app.celery", "worker", "-l", "info"]
