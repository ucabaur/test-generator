output "staging_url" {
  value = "${module.env_staging.url}"
}

output "production_url" {
  value = "${module.env_production.url}"
}

output "backend_repository_url" {
  value = "${aws_ecr_repository.backend.repository_url}"
}

output "static_repository_url" {
  value = "${aws_ecr_repository.static.repository_url}"
}

output "AWS_ACCESS_KEY_ID" {
  value = "${aws_iam_access_key.deploy.id}"
}

output "AWS_SECRET_ACCESS_KEY" {
  value = "${aws_iam_access_key.deploy.secret}"
}
