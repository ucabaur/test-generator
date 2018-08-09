# Installation

## First setup

Go through this once when you install the project, you shouldn't need to do that again.

- start the backend:
  ```bash
  docker-compose up
  ```
- setup the development database:
  ```bash
  # Migrate
  docker-compose exec backend ./manage.py migrate
  # Create cache table
  docker-compose exec backend ./manage.py createcachetable
  # Create an admin account
  docker-compose exec backend ./manage.py createsuperuser
  ```

## Start the app

What you need to do to (re)start the project:

- start the backend:
  ```bash
  docker-compose up
  ```
- start the frontend:
  ```bash
  cd frontend
  yarn install
  yarn start
  ```

The project should now be running at [localhost:8000](http://localhost:8000).
