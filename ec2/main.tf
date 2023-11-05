resource "aws_instance" "basic-instance" {
  ami = "ami-0a1f6cc8163bdcc75"
  # ami           = data.aws_ami.amazon_linux.id # id del data consultado
  instance_type = var.instance_type # tipo de instancia 

  tags = {
    Name = "kc-terraform-ec2-carlos" # tag de la intancia  
  }

}