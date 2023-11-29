#!/bin/bash
./export-secret.sh
celery -A django_app.celery worker -l info