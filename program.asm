# implementação de um programa para ler e imprimir valores e também para o cálculo de equação 
# Autores: Caio Vitor Souza Fernandes, Lucas Ferreira Guedes, Roberto Eller Paiva e Thais Alves Silva
# Data: 14/12/2022
# Versão 1.0 – Versão inicial
.text 
main:
	#Ler e imprimir o nome dos integrantes do grupo && Ler e imprimir a matricula dos integrantes do grupo
	jal leNomes
	#Ler os valores das variaveis independentes e dos seus coeficientes para o calculo da equacao
	jal leVariaveis
	#Calcula e imprime o resultado da equacao f(x,y,z) = 11ax^3 - 3by^2 + 7cz^3 - 2dz^2 a partir dos valores lidos
	jal calculo
	#Encerra o programa
	li $v0, 10
	syscall 
#Inclui o arquivo com as subrotinas	
.data
msg0: .asciiz "Para a equacao f(x,y,z) = 11ax^3 - 3by^2 + 7cz^3 - 2dz^2 \nDigite o valor de x: "
msg1: .asciiz "Agora digite o valor de y: "
msg2: .asciiz "Agora digite o valor de z: "
msg3: .asciiz "Agora digite o valor de a: "
msg4: .asciiz "Agora digite o valor de b: "
msg5: .asciiz "Agora digite o valor de c: "
msg6: .asciiz "Por fim, digite o valor de d: "
membros: .asciiz "Digite seu Nome e sua Matricula: "
fim: .asciiz "Fim do programa"
nome: .space 25			#tamanho do texto
matricula: .space 25
quebraLinha: .asciiz "\n"
resultado: .asciiz "O resultado da equação é: "  

#Subrotinas utilizadas no main
.text
leNomes:
	li $t1,4    # numero de integrantes do grupo
 	li $t2, 1    # minha "variavel" de controle
	li $t3, 0
	beq $t3, 0, salvaRetorno 
	
while:
  	bgt $t2,$t1, Saida  # efetuo o while enquanto t2 for menor que t1
  
 	la $a0, membros      # usuario escreve seu nome e sua matricula
  	jal imprimeString  
  
 	la $a0, nome
  	la $a1, 25		# tamanho que quer ler
  	jal leString          # leio o nome
  
  	la $a0,matricula 
	la $a1,25
  	jal leString         # leio a matricula
  
  	la $a0,quebraLinha
  	jal imprimeString   # dou uma quebra de linha
  
 	la $a0, nome
  	jal imprimeString   # imprimo o nome
  
 	la $a0,matricula
  	jal imprimeString  # imprimo a matricula
 
  	addi $t2,$t2,1   # adiciono na variavel de controle
  
  	j while

salvaRetorno:
	move $s0, $ra
	addi $t3, $t3, 1
	j while
	
Saida:
	move $ra, $s0
	jr $ra

leVariaveis:
	move $t0, $ra
	#Pergunta o valor de x
	la $a0, msg0
	jal imprimeString
	jal leInteiro
	move $s0,$v0
	#Pergunta o valor de y
	la $a0, msg1
	jal imprimeString
	jal leInteiro
	move $s1,$v0
	#Pergunta o valor de z
	la $a0, msg2
	jal imprimeString
	jal leInteiro
	move $s2,$v0
	#Pergunta o valor de a
	la $a0, msg3
	jal imprimeString
	jal leInteiro
	move $s3,$v0
	#Pergunta o valor de b
	la $a0, msg4
	jal imprimeString
	jal leInteiro
	move $s4,$v0
	#Pergunta o valor de c
	la $a0, msg5
	jal imprimeString
	jal leInteiro
	move $s5,$v0
	#Pergunta o valor de d
	la $a0, msg6
	jal imprimeString
	jal leInteiro
	move $s6,$v0
	#Volta para o main
	move $ra, $t0
	jr $ra

calculo:
	move $t9, $ra
	mul $s7, $s0, $s0	# x2
	mul $s0, $s7, $s0	# x3
	mul $s7, $s0, $s3	# ax3
	li  $t1, 11
	mul $s7, $s7, $t1	# 11ax3
	
	mul $s1, $s1, $s1	# y2
	mul $s1, $s1, $s4	# by2
	li  $t1, 3
	mul $s1, $s1, $t1	# 3by2
	
	mul $s0, $s2, $s2	# z2
	mul $s2, $s0, $s2	# z3
	mul $s2, $s5, $s2	# cz3
	li  $t1, 7
	mul $s2, $s2, $t1	# 7cz3
	
	mul $s6, $s6, $s0	# dz2
	li  $t1, 2
	mul $s6, $s6, $t1	# 2dz2
	
	sub $s7, $s7, $s1	# 11ax3 - 3by2
	add $s7, $s7, $s2	# 11ax3 - 3by2 + 7cz3
	sub $s7, $s7, $s6	# 11ax3 - 3by2 + 7cz3 - 2dz2
	
	la $a0, resultado
	jal imprimeString
	
	move $a0, $s7
	jal imprimeInteiro
	move $ra, $t9
	jr $ra
.include "subrotinas.asm"
