# Deployment

## Continuous

Once terraform has finished provisioning your project (see [the provisioning docs](./provisioning.md)), it should have returned 6 values:

- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`: the deployment user access key
- `backend_repository_url` and `static_repository_url`: the URL of the repositories we'll send our docker images to
- `production_url`: URL of the production environment
- `staging_url`: URL of the staging environment

You can now setup continuous deployment:
- [Setup your project in CircleCI](https://circleci.com/add-projects/gh/Theodo-UK)
- In CircleCI, go to Settings > Environment Variables and add the following variables:
  - `BACKEND_REPO_URL`: the `backend_repository_url` returned by terraform
  - `STATIC_REPO_URL`: the `static_repository_url` returned by terraform
  - `AWS_ACCESS_KEY_ID`: the access key id returned by terraform
  - `AWS_SECRET_ACCESS_KEY`: the secret access key returned by terraform
- Re-build / push ... and your project should automagically be deployed! 🎉

## Manual

> Do you really need to do this? 🤔

In the following, replace `__env__` with either `staging` or `production` and `__backend_repository_url__`/`__static_repository_url__` with the urls returned by terraform.

- Build images:
  ```sh
  cd ./devops/deployment && make images
  ```
- Tag images:
  ```sh
  docker tag testwill/backend:latest __backend_repository_url__:__env__
  docker tag testwill/static:latest __static_repository_url__:__env__
  ```
- Push images:
  ```sh
  docker push __backend_repository_url__:__env__
  docker push __static_repository_url__:__env__
  ```
- Build EB archive:
  ```sh
  cd ./devops/deployment && make archive.zip env=__env__
  ```
- Re-deploy:
  ```sh
  cd ./devops/deployment && eb deploy
  ```
