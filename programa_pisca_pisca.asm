;--------------- PISCA-PISCA -----------------
;Lucas Felipe - Julho 2020 
		#INCLUDE	<P16F877A.INC>
		ORG			0X00
		BSF			STATUS,5
		BCF			TRIS D,7
		BCF			STATUS,5
		
;------------- PROGRAMA PRINCIPAL ------------
		BCF			PORTD,7
		CALL		DELAY
		BSF			PORTD, 7
		CALL		DELAY
		GOTO		$ - 3
;-------------SUBROTINA DELAY---------------
DELAY	MOVLW		0X03
		MOVWF		0X20
		MOVWF		0X21
		DECFSZ		0X20,F
		GOTO		$ - 1
		DECFSZ		0X21, 1 		;Mesma coisa que F
		GOTO		$ - 1
		RETURN		