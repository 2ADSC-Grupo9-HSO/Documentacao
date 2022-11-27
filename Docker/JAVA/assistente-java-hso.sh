#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Instalando o Java...;"
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o Java instalado!"
		sleep 2
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você realmente deseja instalar o Java? (Y/n)"		
	read inst
	if [ \"$inst\" == \"Y\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Instalando..."
			sleep 2
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Adicionando o repositório..."
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando pacotes. Quase lá..."
			sleep 2
			sudo apt update -y
			clear
			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado."
					sleep 1
					sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y
					clear
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Java instalado com sucesso!"
					sleep 1
				fi
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima!"
		sleep 1
	fi
fi

echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Instalando aplicação Java..."

sleep 2

git clone https://github.com/2ADSC-Grupo9-HSO/Aplicacao-Java.git

sleep 2

git clone https://github.com/2ADSC-Grupo9-HSO/jar-para-vm.git

echo "Aplicação instalada!"

sudo docker build -t image_java_hso .
sudo docker run image_java_hso

sleep 2

cd jar-para-vm/
sudo chmod 777 login-1.0-jar-with-dependencies.jar
java -jar login-1.0-jar-with-dependencies.jar
