provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "az" {
}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = var.aws_vpc_id
}

resource "aws_instance" "ec2" {
  count                       = var.aws_ec2_count
  ami                         = var.aws_ami_id
  instance_type               = var.aws_instance_type
  subnet_id                   = data.aws_subnet_ids.subnet_ids.ids[count.index]
  associate_public_ip_address = var.aws_ec2_public_ip
  key_name                    = var.aws_ssh_key_name
  vpc_security_group_ids      = var.aws_sg_ids
  root_block_device {
    volume_size = var.aws_root_size
  }

  tags = merge(
    var.aws_def_tags,
    {
      "Name" = "${var.aws_ec2_name}-${count.index}"
    },
  )

  lifecycle {
    ignore_changes = [
      private_ip,
      root_block_device,
    ]
  }
  user_data            = var.aws_user_data
  iam_instance_profile = var.aws_ec2_iam_profile
}

