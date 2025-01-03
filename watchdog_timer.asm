; WATCHDOG TIMER
    	INCLUDE		"P16F877.inc"
; Definição do endereço inicial do programa
		ORG			00h
	
		BCF			STATUS,RP1
	
		BCF			STATUS,RP0
		MOVLW		FFh
		MOVWF		PORTD
	
		BSF			STATUS,RP0
	
		MOVLW		00h
		MOVWF		TRISD
	
		MOVWF		INTCON
	
		MOVWF		TRISC
	
		MOVLW		08h
		MOVWF		OPTION_REG
	
		MOVLW		0Fh
		MOVWF		TRISB
	
		BCF			STATUS,RP0

; Terminando as inicializações, programa principal

		MOVLW		FFh
		MOVWF		PORTD

		MOVLW		10h
		MOVWF		PORTC

DE_NOVO	MOVFW		PORTB
		infinito	ANDLW			01h
		MOVWF		PORTD
		GOTO		DE_NOVO

		END
