provider "aws" {
  region  = "${var.region}"
  profile = "${var.project_name}"
}

resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}"
  public_key = "${file("../eb.pem.pub")}"
}

resource "aws_elastic_beanstalk_application" "main" {
  name = "${var.project_name}"
}

resource "aws_ecr_repository" "backend" {
  name = "${var.project_name}/backend"
}

resource "aws_ecr_repository" "static" {
  name = "${var.project_name}/static"
}

module "env_staging" {
  source = "environment"

  region               = "${var.region}"
  project_name         = "${var.project_name}"
  environment          = "staging"
  eb_application       = "${aws_elastic_beanstalk_application.main.name}"
  eb_instance_profile  = "${aws_iam_instance_profile.main.name}"
  eb_key_pair          = "${aws_key_pair.main.key_name}"
  db_allocated_storage = 5
  db_instance_class    = "db.t2.small"
  vpc                  = "${data.aws_vpc.default.id}"
  vpc_subnets          = "${data.aws_subnet_ids.default.ids}"
}

module "env_production" {
  source = "environment"

  region               = "${var.region}"
  project_name         = "${var.project_name}"
  environment          = "production"
  eb_application       = "${aws_elastic_beanstalk_application.main.name}"
  eb_instance_profile  = "${aws_iam_instance_profile.main.name}"
  eb_key_pair          = "${aws_key_pair.main.key_name}"
  db_allocated_storage = 20
  db_instance_class    = "db.t2.small"
  vpc                  = "${data.aws_vpc.default.id}"
  vpc_subnets          = "${data.aws_subnet_ids.default.ids}"
}
