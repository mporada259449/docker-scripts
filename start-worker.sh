#!/bin/bash
./export-secrets.sh
python3 wait-for-services.py
celery -A django_app.celery worker -l info