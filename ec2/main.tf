resource "tls_private_key" "kc_private_key" {
  algorithm = "RSA"
  rsa_bits  = 1024

}

resource "local_file" "kc_perm" {
  filename        = "${path.root}/kc-key-carlos.pem"
  file_permission = 400
  content         = tls_private_key.kc_private_key.private_key_pem
}

resource "aws_key_pair" "kc_public_key" {
  key_name   = "kc-key-carlos"
  public_key = tls_private_key.kc_private_key.public_key_openssh

}

resource "aws_security_group" "kc_sg" {
  name        = "KC Security Group  Carlos"
  description = "KC Security Group  Carlos"
  vpc_id      = aws_vpc.this.id


}

resource "aws_security_group_rule" "kc_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.kc_sg.id

}

resource "aws_security_group_rule" "kc_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.kc_sg.id

}

resource "aws_security_group_rule" "kc_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.kc_sg.id

}

resource "aws_instance" "basic-instance" {
  #ami = "ami-0a1f6cc8163bdcc75"
  ami                    = data.aws_ami.amazon_linux.id        # id del data consultado
  instance_type          = var.instance_type                   # tipo de instancia 
  key_name               = aws_key_pair.kc_public_key.key_name #Asociamos la key_pair o llave publica
  vpc_security_group_ids = [aws_security_group.kc_sg.id]

  tags = {
    Name = "kc-terraform-ec2-carlos" # tag de la instancia  
  }

  user_data = <<-EOT
      #!/bin/bash

      yum install -y httpd
      systemctl enable httpd
      systemctl start httpd
      echo "<h1>Hello from $(hostname -f)</h1>" > /var/www/html/index.html
    EOT  


}