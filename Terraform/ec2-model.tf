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
}