;................................CONFIGURAÇÕES.............................................
INIT CONF	#INCLUDE	<PIC16F877.INC>	;Define o microprocessador utilizado
		ORG		00h		; Marca o início da compilação
		BSF 		STATUS, RP0	; Acessa o banco 1 (para alterar o valor dos TRIS)
		BSF 		TRIS B, 7	; Define o sensor infravermelho como entrada
		BCF 		TRIS D, 3	; Define o alarme como saída
		BCF		TRIS A, 5	; Define o LED como saída
		BCF		TRIS C, 7 	; Define o Bip como saída
		BCF		STATUS, RP0	; Volta para o banco 0 (para mudar o valor dos PORTs em si)
;..............................PROGRAMA PRINCIPAL.......................................
PRO. PRIN.	BCF		PORT D, 3	; Desativa o alarme (só na 1ª vez, para garantir)
INÍCIO 		BCF		PORT C, 7	; Desativa o bip (buzzer)
		BSF 		PORT A, 5 	; Acende o LED
		BTFSC 		PORT B, 7 	; Confere se o sensor detecta combustível
		GOTO 		$ - 1 		; Se não, volta a conferir
		BSF 		PORT D, 3 	; Ativa o alarme
		BCF 		PORT A, 5 	; Apaga o LED
		BTFSS 		PORT B, 7 	; Confere se o sensor não vê mais o combustível
		GOTO 		$ - 1 		; Se não, volta a conferir
		BCF 		PORT D, 3 	; Desativa o alarme
		BSF 		PORT C, 7 	; Ativa o bip (buzzer)
		CALL 		DELAY 		; Chama a subrotina DELAY (deixando o Bip ativo por um momento, para o ouvido humano perceber)
		GOTO 		INÍCIO 		; Por fim, volta às instruções iniciais
; ...................................SUBROTINA DELAY.......................................
DELAY 		CLRF 		46h 		; Inicia a subrotina, definindo dois registros gerais...
LOOP 		CLRF 		47h 		; …como 0, para serem decrementados
		DECFSZ 		47h, 1 		; Decrementa um registro e verifica se ele é zero
		GOTO 		$ - 1 		; Se não, volta a decrementar
		DECFSZ 		46h, 1 		; Decrementa outro registro e verifica se ele é zero
		GOTO 		LOOP 		; Se não, volta a decrementar o primeiro registro, até que ele volte a ser zero.
		RETURN 				; Terminado este ciclo, volta ao programa principal