#!/bin/bash 
# aluno: Artur
# Data : 08/07/2018
																																																																																																																																																																																																																					
[ $UID -ne '0' ] && { echo "Necessario root"; exit 1;}
while : ; do

Um() {
		Usuario=$( dialog --stdout --inputbox "Digite o nome do Usuario" 0 0)

		if [ $Usuario == 0 ]
			then
				dialog --infobox "É root" 0 0
				sleep 2
			else	
				dialog --stdout --infobox "Nao é root" 0 0
				sleep 2
		fi
}

dois() {
		
		dialog --title "Exibindo diretorio" --fselect / 0 0
		sleep 3

}

tres() {
		
		diretorio=$( dialog --stdout --inputbox "Digite o diretorio a ser criado" 0 0)
		mkdir $diretorio
		sleep 2
}

quatro() {
		diretorio=$( dialog --stdout --inputbox "Digite o diretorio a ser deletado" 0 0)
		rm -r $diretorio
		sleep 2
}

cinco(){
	
		diretorio=$( dialog --stdout --inputbox "Digite o caminho a ser criado" 0 0)
		nome=$( dialog --stdout --inputbox "Entre com o nome do arquivo" 0 0)
		dialog --msgbox "$(ln -s $diretorio $nome)" 0 0		
		
}


seis() {

		arq=$( dialog --stdout --inputbox "Digite o nome do arquivo:" 0 0)
		linhas=$( dialog --stdout --inputbox "Digite o numero de linhas que deseja exibir:" 0 0)

			dialog --prgbox "tail -$linhas $arq" 50 100
			

}

sete() {
		arq=$( dialog --stdout --inputbox "Digite o nome do arquivo:" 0 0)
		linhas=$( dialog --stdout --inputbox "Digite o numero de linhas que deseja exibir:" 0 0)

			dialog --prgbox "head -$linhas $arq" 50 100
}

oito() {
		diretorio=$( dialog --stdout --inputbox "Digite arquivo a ser encontrado:" 0 0)

		dialog --prgbox "find $diretorio" 50 100

		sleep 2
}

nove() {
		
		comando=$( dialog --stdout --inputbox "Digite comando a ser visto:" 0 0)
		dialog --prgbox "which $comando" 50 100
		sleep 2
}

dez() {
		comando=$( dialog --stdout --inputbox "Digite comando a ser visto:" 0 0)
		dialog --prgbox "$comando --help" 50 100
		sleep 2

}

onze() {


		user=$( dialog --stdout --inputbox "Digite o nome do novo usuario:" 0 0)
		arq=$( dialog --stdout --inputbox "Digite o nome do arquivo:" 0 0)

		
		chown $nome $arq
		sleep 2
}

doze() {



		arq=$( dialog --stdout --inputbox "Digite o nome do arquivo:" 0 0)
		dialog --prgbox "Linhas:" "wc -l $arq" 50 100
		dialog --prgbox "Palavras:" "wc -w $arq" 50 100
		dialog --prgbox "Carcaters" "wc -c $arq" 50 100
		
		
		sleep 2
}

treze() {
	dialog --prgbox "Usuario:" users 50 100
	usuario=$( dialog --stdout --inputbox "Digite o nome do usuario:" 0 0)
	diretorio1=$( dialog --stdout --inputbox "Digite o nome do arquivo onde esta:" 0 0)
	arq1=$( dialog --stdout --inputbox "Digite o nome do arquivo:" 0 0)
	diretorio2=$( dialog --stdout --inputbox "Digite do diretorio que sera copiado:" 0 0)
	
	cp -r /home/$usuario/$diretorio1/$arq1 /home/$usuario/$diretorio2/

	sleep 2
}

quatorze() {
	dialog --prgbox "Usuario:" users 50 100
	usuario=$( dialog --stdout --inputbox "Digite o nome do usuario:" 0 0)
	diretorio1=$( dialog --stdout --inputbox "Digite o nome do arquivo onde esta:" 0 0)
	arq1=$( dialog --stdout --inputbox "Digite o nome do arquivo:" 0 0)
	diretorio2=$( dialog --stdout --inputbox "Digite do diretorio que sera movido:" 0 0)
	
	mv  /home/$usuario/$diretorio1/$arq1 /home/$usuario/$diretorio2/

	sleep 2
		sleep 2
}

quinze(){
	senha=$( dialog --stdout --inputbox "a senha do usuario:" 0 0)
		$senha sudo -i 
	part=$( dialog --stdout --inputbox "Digite a particao que deseja montar:" 0 0)
	part2=$( dialog --stdout --inputbox "Onde deseja montar:" 0 0)
	
	mount /dev/$part /$part2
	dialog --prgbox "lsblk" 50 100

}

deseseis(){
	
	senha=$( dialog --stdout --inputbox "a senha do usuario:" 0 0)
		$senha sudo -i 
	part=$( dialog --stdout --inputbox "Digite a particao que deseja desmontar:" 0 0)
	
	
	umount /$part 
	dialog --prgbox "lsblk" 50 100


}

dezesete() {

		arq=$( dialog --stdout --inputbox "Digite o nome do arquivo que seja alterado a data" 0 0)
		data=$(dialog --date-format %y%m%d%H%M --stdout --calendar " Escolha uma data" 0 0)
			
		touch -t  "$data" $arq
		sleep 2
}

dezoito(){
		dialog --prgbox "lsblk" 50 100

		sleep 2
}																																																																																																																																																																																																																																																																																																								


dezenove(){


	part=$( dialog --stdout --inputbox "Digite o nome da particao" 0 0)
	e2fsck /dev/$part 

	

}




opcao=$( dialog --stdout --menu "################### Gerenciador de Usuario - Aluno: Artur #################" 0 0 0 \
		1 'Localização Do usuario'\
		2 'Listar arquivos de Documentos'\
		3 'Criar um diretorio'\
		4 'Excluir um diretorio'\
		5 'Criar um atalho'\
		6 'Listar as ultimas linhas de um arquivo'\
		7 'Listar as primeiras linhas de um arquivo'\
		8 'Buscar o arquivo pelo nome'\
		9 'Mostrar localizacao do comando'\
		10 'Mostrar a funcao do comando'\
		11 'mudar a posse do usuario de um arquivo'\
		12 'Contar numero de caracteres, palavras e linhas de um arquivo'\
		13 'Copiar um arquivo para outro diretorio'\
		14 'Mover um arquivo para outro diretorio'\
		15 'Montar uma particao'\
		16 'Desmontar o diretorio anterior'\
		17 'Mudar a data de alteracao'\
		18 'Exibe as tabelas de pariçoes'\
		19 'Testas consistencia logica' \
		20 'Sair')
		


case $opcao in
	1) Um ;;
	2) dois ;;
	3) tres ;;
	4) quatro ;;
	5) cinco ;;
	6) seis ;;
	7) sete ;;
	8) oito ;;
	9) nove ;;
	10) dez ;;
	11) onze ;;
	12) doze ;;
	13) treze ;;
	14) quatorze ;;
	15) quinze ;;
	16) deseseis ;;
	17) dezesete ;;
	18) dezoito ;;
	19) dezenove ;;
 	20) break ;;
	*) dialog --infobox 'Opção Invalida' 0 0;;
esac

done

