source "amazon-ebs" "mongodb" {
  ami_name        = "mongodb-${var.mongo_version}-${local.timestamp}"
  ami_description = "MongoDB ${var.mongo_version} Host Image"
  instance_type   = "${var.instance_type}"

  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-ebs"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["amazon"]
    most_recent = true
  }

  vpc_id = var.vpc_id

  subnet_filter {
    filters = {
      "tag:Name": "public-us-east-1"
    }
    most_free = true
  }

  ssh_username = "ec2-user"
  ssh_wait_timeout = "10m"

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    OS_Version    = "Linux2"
    Base_AMI_Name = "{{ .SourceAMIName }}"
  }
  run_tags = {
    OS_Version    = "Linux2"
    Base_AMI_Name = "{{ .SourceAMIName }}"
  }

  region = "us-east-1"
}