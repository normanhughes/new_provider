Pasta para iniciar as instancias (Servidores) no provider (AWS)

# Para usar as configurações escritas executar a seguinte sequencia de comando no terminal:

# Iniciar o terraform na pasta onde está o arquivo .tf que será usado para iniciar a configuração.
terraform init

# Executar o plan para que o terraform verifique o que será adicionado ou removido na infra.
terraform plan

# Executar o que foi planejado no passo anterior na infra atual.
terraform apply 

# verificar o estadu atual do ambiente antes de alguma alteração
terraform show 
# o resultado pode ser encaminhado para outro arquivo como backup de como estava o ambiente antes das alterações.