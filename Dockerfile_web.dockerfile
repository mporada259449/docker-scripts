FROM python@sha256:729a76e129b717cf784b40a65938aeb7e025259b1b35e7c8c2ff6c3419d1245c

RUN useradd -ms /bin/bash webserver
RUN usermod -aG webserver webserver

COPY  --chown=webserver:webserver  ./django_app/ /webserver/django_app
COPY --chmod=751 --chown=webserver:webserver ./scripts/start-server.sh /webserver/django_app
COPY --chmod=751 --chown=webserver:webserver ./scripts/export-secrets.sh /webserver/django_app
COPY --chown=webserver:webserver ./scripts/healthcheck_web.py /webserver/django_app
COPY --chown=webserver:webserver ./scripts/wait-for-services.py /webserver/django_app
WORKDIR /webserver/django_app

RUN pip install -r requirements.txt

USER webserver:webserver
CMD ["./start-server.sh"]