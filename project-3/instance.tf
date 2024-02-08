# Create EC2 instance
resource "aws_instance" "web-server" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.main-public-1.id
  vpc_security_group_ids      = [aws_security_group.allow_web.id]
  associate_public_ip_address = true

  user_data = data.cloudinit_config.execute-scripts.rendered  
  key_name  = "ec2_access_key"

  tags = {
    Name = "Web server"
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"

  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name                    = "/dev/xvdh"
  volume_id                      = aws_ebs_volume.ebs-volume-1.id
  instance_id                    = aws_instance.web-server.id
  stop_instance_before_detaching = true
}
