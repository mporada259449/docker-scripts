#!/bin/bash
export DJANGO_SUPERUSER_USERNAME="root"
export DJANGO_SUPERUSER_EMAIL="259449@student.pwr.edu.pl"
export DJANGO_SUPERUSER_PASSWORD=$(cat /run/secrets/DJANGO_SUPERUSER_PASSWORD)

./export-secrets.sh
python3 wait-for-services.py 

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py createsuperuser --no-input

python3 manage.py runserver 0.0.0.0:8000
