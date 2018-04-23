variable "environment_prefix" {}

provider "aws" {}

# root level route 53 resources
data "aws_route53_zone" "selected" {
  name = "ayerst.net."
}

resource "aws_route53_record" "terraform" {
  type    = "A"
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.environment_prefix}terraform"
  ttl     = "300"
  records = ["8.8.8.8"]
}
