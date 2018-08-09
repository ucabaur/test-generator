cd /code

# Migrate
python ./manage.py migrate --noinput

# Create cache table
python ./manage.py createcachetable

gunicorn --bind 0.0.0.0:80 --chdir /code --workers 2 --access-logfile /var/log/testwill/gunicorn-access.log --error-logfile /var/log/testwill/gunicorn-error.log testwill.wsgi:application
