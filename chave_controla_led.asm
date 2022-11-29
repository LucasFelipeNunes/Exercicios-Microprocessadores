INIT CONF 	#INCLUDE 	<P16F877.INC>	; Determina o modelo de microprocessador (PIC) utilizado
		ORG 		00h 		; Determina o início da compilação
		BSF 		STATUS, RP0 	; Navega para o Banco 1 (para determinar o estado dos TRIS)
		BSF 		TRIS C, 4 	; Mostra que o TRIS do bit 4 do port C é entrada (no caso, um switch)
		BCF 		TRIS D, 3	; Mostra que o TRIS do bit 3 do port D é saída (no caso, um LED)
		BSF		TRIS D, 4	; Mostra que o TRIS do bit 4 do port D é entrada (no caso, um sensor)
		BCF 		STATUS, RP0 	; Volta para o banco 0 (para acessar o valor dos ports em si e começar o programa)