FROM python@sha256:729a76e129b717cf784b40a65938aeb7e025259b1b35e7c8c2ff6c3419d1245c

RUN useradd -ms /bin/bash webserver
RUN usermod -aG webserver webserver

WORKDIR /home/webserver/django_app
COPY  --chown=webserver:webserver ./django_app/ .

RUN pip install -r requirements.txt

USER webserver:webserver
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]