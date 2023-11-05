resource "aws_instance" "basic-instance" {
  #ami = "ami-07a877f081af74359"
  ami           = data.aws_ami.amazon_linux.id # id del data consultado
  instance_type = "t2.micro"                   # tipo de instancia 

  tags = {
    Name = "kc-terraform-ec2-carlos" # tag de la intancia  
  }

}