# Subsrotinas 
# implementa��o das subrotinas para le e imprimir strings e inteiros
# Autores: Caio Vitor Souza Fernandes, Lucas Ferreira Guedes, Roberto Eller Paiva e Thais Alves Silva
# Data: 08/12/2022
# Vers�o 1.0 � Vers�o inicial

.text
#rotina para ler uma string digitada pelo usu�rio 
leString:
	li $v0, 8		#c�digo 8: opera��o de leitura de strings 
	syscall
	jr $ra
	
#rotina para imprimir uma string para o usu�rio
imprimeString: 
	addi $v0, $zero, 4 	# c�digo 4: opera��o de escrita de strings 
	syscall
	jr $ra
	
#rotina para ler um inteiro informado pelo usu�rio
leInteiro:
	li $v0, 5		# c�digo 5: opera��o de leitura de inteiros
	syscall
	jr $ra
	
#rotina para imprimir um inteiro para o usu�rio	
imprimeInteiro:
	li $v0, 1 		# c�digo 1: opera��o de escrita de inteiros
	syscall
	jr $ra
