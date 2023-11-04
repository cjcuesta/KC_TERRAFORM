data "aws_ami" "amazon_linux" { # de amazon ami
  most_recent = true            # la mas reciente   
  owners      = ["amazon"]

  #  Que filtre por nombre
  #   amzn2 amazon2
  #   ami   imagen
  #   hvm 
  #   *     cualquier version 
  #   x86_64 Con esta arquitectura
  #   gp2 Disco Duro

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }


}