terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
    }
    # github = {
    #   source = "integrations/github"
      
    # }
  }
}
provider "aws" {
  # Configuration options
}
# provider "github" {
#   # Configuration options
#   token = "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"
# }
# data "github_repository" "myrepo" {
#   name = "fproject"
  
# }
# data "github_branch" "main" {
#   branch = "main"
# #   repository = data.github_repository.myrepo.name
# }
resource "aws_instance" "tf-car-rental" {
  ami = "ami-0f9fc25dd2506cf6d"
  instance_type = "t3a.small"
  key_name = "b107-key3"
  vpc_security_group_ids = [aws_security_group.car-rental-SG.id]
  
  tags = {
    Name = "Project Dev Server"
  }
  user_data = <<-EOF
          #! /bin/bash
          yum update -y
          yum install git -y
          amazon-linux-extras install docker -y
          systemctl start docker
          systemctl enable docker
          usermod -a -G docker ec2-user
          curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
          -o /usr/local/bin/docker-compose
          chmod +x /usr/local/bin/docker-compose
          su ec2-user
          cd /home/ec2-user
          
          git clone https://github.com/msukrualev/BlueRentalCars.git
          chown -R ec2-user:ec2-user https://github.com/msukrualev/BlueRentalCars.git
          EOF
  
}
resource "aws_security_group" "car-rental-SG" {
  name = "car-rental-SG"
  tags = {
    Name = "car-rental-SG"
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
   }
  ingress {
    from_port = 3000
    protocol = "tcp"
    to_port = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5432
    protocol = "tcp"
    to_port = 5432
    cidr_blocks = ["0.0.0.0/0"]
   }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "Dev-Server" {
  value = "http://${aws_instance.tf-car-rental.public_dns}"
}