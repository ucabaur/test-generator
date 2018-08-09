# First stage: collect static files in base image
FROM testwill/base AS python

ENV LOG_PATH /var/log/testwill/django.log
ENV SECRET_KEY itdoesntreallymatter

RUN mkdir -p /var/log/testwill
RUN touch $LOG_PATH

RUN python ./manage.py collectstatic


# Second stage: static files server
FROM nginx:1.15

# Custom config
RUN rm /etc/nginx/conf.d/default.conf
COPY ./static/nginx.conf /etc/nginx/conf.d/testwill.conf

COPY --from=python /code/static /static
