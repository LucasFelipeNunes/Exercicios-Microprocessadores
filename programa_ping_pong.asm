;..................CONFIGURAÇÕES E DEFINIÇÕES.....................
		#INCLUDE	<P16F877.INC>
		ORG			00h
		BSF			STATUS,RP0
		CLRF		TRISD
		BCF			STATUS,RP0

;.......................PROGRAMA PRINCIPAL.........................
		BSF			STATUS,0
INICIO	MOVLW		FEh
		MOVWF		PORTD
PING	CALL		DELAY
		RLF			PORTD,F
		BTFSC		PORTD,7
		GOTO		PING
PONG	CALL		DELAY
		RRF			PORTD,1
		BTFSC		PORTD,0
		GOTO		PONG
		GOTO		PING
;..............................ATRASO..............................
DELAY	CLRF		20h
DEL_1	CLRF		21h
		DECSZ		21h
		GOTO		$-1
		DECFSZ		20h
		GOTO		DEL_1
		RETURN

		END
