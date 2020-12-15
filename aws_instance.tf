provider aws {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "pbackend"
    key    = "remote.tfstate"
    region = "us-east-1"
  }
}

/*

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  //owners = ["099720109477"] # Canonical
  owners = ["amazon"]
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

resource "aws_eip" "lb" {
  vpc      = true
}


output "eip" {
  value = aws_eip.lb.public_ip
}


resource "aws_s3_bucket" "mys3" {
  bucket = "helloedureka"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}
*/

resource "aws_instance" "myec2" {
   //ami = data.aws_ami.ubuntu.id
   ami = "ami-0be3f0371736d5394"
   instance_type = var.inst_type
   //count = 1
}


output "ins_type" {
  value = aws_instance.myec2.instance_type
  //value = aws_instance.myec2[0].instance_type
}

/*
module "my_git" {
  source = "github.com/pbeniwal/calculator?ref=master"
}
/*
resource "aws_eip_association" "eip_association"{
  instance_id = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "my_sec_group" {
  name = "my-group"

  ingress {
    description = "inbound"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }
}
*/
