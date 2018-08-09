# First stage: build front app
FROM node:8.9 AS node
WORKDIR /code

COPY .src/frontend /code/
RUN yarn
RUN yarn build


# Second stage: build base backend
FROM python:3.7

ENV DJANGO_SETTINGS_MODULE testwill.settings.prod
ENV PYTHONPATH /code

WORKDIR /code

RUN pip install pipenv gunicorn

COPY .src/backend /code/
COPY --from=node /code/build /code/front/static/front

RUN pipenv install --system --deploy
