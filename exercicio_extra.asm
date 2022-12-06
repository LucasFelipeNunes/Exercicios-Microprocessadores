		#INCLUDE	<P16F877A.INC>
		ORG		0X00
		BSF 		STATUS, 5
		CLRF		TRISC
		BSF		TRISB,1
		BCF 		STATUS, 5

#DEFINE		DISPLAY		PORTC
#DEFINE		CONTAR		PORTB,1

INICIO		MOVLW		0X60
		CALL		TECLA
		MOVLW		0XDA
		CALL		TECLA
		MOVLW		0XF2
		CALL		TECLA
		GOTO		INICIO
TECLA		MOVWF		DISPLAY
		BTFSS		CONTAR
		GOTO		$-1
		RETURN
		END