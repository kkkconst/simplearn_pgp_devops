provider "aws" {
  access_key = "ASIAX7HMF2FXL2FCCVOY"
  secret_key = "Hn+MkDbOgHaldo7BOMFyTdW2csvgXErPsYY5WL81"
  token = "FwoGZXIvYXdzEAMaDKYcgOetAiF7qev9OSK5AWozRPlYPCOmzwYPvhACek/e6obAdchOZta5MwUsvdIo+KWAgS9YyoE08XgUzE4RcH+d2NzvKagWlaLGrpcDGxAPV99hXAWNTBK86asZ5wiSFj07xya1IbfEOXcVmdUeBcQZzEW0mb6THaMnfNsu/K9hPPgmHGQa1lW99gf41lCU70fiRazePu0D6cHqmtdRMtGBBUbpmtZr2dxxNwyK/SuI3OTAiMKkCY2kvsjPu/J1LkVwKZ8wMIe6KLnGsqQGMi3bZoIg2MdiW5hrkC+jENlfqpOFmcqwWV2TOuXuSooI2qm+JTufJxgmYvHMHL0="
  region = "us-east-1"
}


resource "aws_instance" "my_Ubuntu" {
  ami           = "ami-0261755bbcb8c4a84" //image
  instance_type = "t2.micro"
  key_name = "my_aws_acc_keys"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  user_data              = file("user_data.sh")

  tags = {
    Name    = "Test_ubuntu_Server"
    Owner   = "kkksonst"
    Project = "AWS Lessons"
  }
}

resource "aws_eip" "kb" {
  instance = aws_instance.my_Ubuntu.id
  domain   = "vpc"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_SSH"
  description = "Allow SSH inbound traffic"
  #vpc_id      = aws_vpc.vpc_demo.id

  ingress {
    # SSH Port 22 allowed from any IP
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # SSH Port 80 allowed from any IP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # SSH Port 80 allowed from any IP
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
