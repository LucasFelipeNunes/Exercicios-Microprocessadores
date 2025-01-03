			#INCLUDE	"P16F877A.INC"
			ORG			00h
TEMPO		RES			02h
			BSF			STATUS,RP0
			MOVLW		00h
			MOVWF		TRISB
			BCF			STATUS,RP0

;.....................PROGRAMA PRINCIPAL.....................
INICIO		BTFSS		PORTC,0
			GOTO		$-1
			MOVLW		03h
			MOVWF		PORTB
			
;.....................SENTIDO DE ROTAÇÃO.....................
SENTIDO		BTFSC		PORTC,1
			GOTO		DIREITA
			BTFSC		PORTC,2
			GOTO		ESQUERDA
			GOTO		SENTIDO

;........................DIREITA.............................
DIREITA		RRF			PORTB,1
			BTFSC		PORTC,0
			GOTO		INICIO
			CALL		DELAY
			GOTO		DIREITA

;.......................ESQUERDA............................
ESQUERDA	RLF			PORTB,1
			BTFSC		PORTC,0
			GOTO		INICIO
			CALL		DELAY
			GOTO		ESQUERDA

;..................SUBROTINA DE RETARDO......................
DELAY		CLRF		TEMPO
LOOP2		CLRF		TEMPO+1
LOOP1		DECFSZ		TEMPO,1
			GOTO		LOOP1
			DECFSZ		TEMPL+1,1
			GOTO		LOOP2
			RETURN

			END
