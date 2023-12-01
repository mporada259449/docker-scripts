#!/bin/bash
./export-secrets.sh
celery -A django_app.celery worker -l info