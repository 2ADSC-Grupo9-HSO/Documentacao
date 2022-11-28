#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11

echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Instalando o Docker...;"
sleep 2

docker --version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o Docker instalado!"
		sleep 2

		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Instalando banco de dados..."
		sleep 2

		sudo systemctl start docker
		sudo systemctl enable docker
		sudo docker pull mysql:8.0.3

		sudo docker build -t image_mysql_hso .
    	sudo docker run image_mysql_hso
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você realmente deseja instalar o Docker? (Y/n)"
		sleep 2		
	read resp
	if [ \"$resp\" == \"Y\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Instalando Docker e banco de dados..."
			sleep 2

			sudo apt update -y
			sudo apt install docker.io -y
			sudo systemctl start docker
			sudo systemctl enable docker
			sudo docker pull mysql:8.0.3

            sudo docker build -t image_mysql_hso .
            sudo docker run image_mysql_hso

			echo "Instalação do Docker e criação das tabelas de banco de dados concluídas!"
			sleep 1
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Docker por enquanto, até a próxima!"
		sleep 1
	fi
fi