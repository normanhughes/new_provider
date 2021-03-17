# configurando o provider para aws na região de SP
provider "aws" {
    version = "~>3.0"
    region = "sa-east-1"
}
# Criando 3 maquinas ec2 usando chave ssh 
resource "aws_instance" "dev" {
    # números de maquinas
    count = 3
    # ami é a imagem que será usada no inicia a instancia
    ami = "ami-0b9517e2052e8be7a"
    # Tipo de instancia AWS que as maquinas irão iniciar
    instance_type = "t2.micro"
    # Chave SSH que está na AWS e na maquina que será aplicada nas maquinas
    key_name = "terraform-aws"
    # Tags divendo para nomear como dev+numero do index 
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = [ "sg-033516326de23ccca", "sg-f3762786" ]
}
# criar security group para acessa porta ssh (22) com nome ssh-acess
resource "aws_security_group" "ssh-acess" {
  name        = "ssh-acess"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # IPs liberados para conectar pelo ssh
    cidr_blocks = ["187.255.252.8/32"]
  }

  tags = {
    Name = "ssh"
  }
}