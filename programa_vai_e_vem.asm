;..............................PROGRAMA VAI E VEM........................................
	#INCLUDE	<PIC16F877A.INC>	; Biblioteca do PIC
;..............................FUSE BITS................................................
			__CONFIG _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF
	ORG		00h
;................................DEFINIÇÕES.........................................
#DEFINE KEY 		PORTB,2
#DEFINE FDC 		PORTD,2
#DEFINE BIP 		PORTD,5
#DEFINE LEDVRD 		PORTC,6
#DEFINE LEDVRM 		PORTC,4
#DEFINE MOTOR_0 	PORTD,0
#DEFINE MOTOR_1 	PORTD,1
#DEFINE CTRL_M 		PORTD,2
;...................................CONFIGURAÇÕES..........................................
	BSF 		STATUS,RP0 		;Vai para BANCO 1
 	MOVLW 		0X00
 	MOVWF 		TRISD
	MOVWF 		TRISC
	BSF 		TRISD,2
	BSF 		TRISB,2
 	BCF 		STATUS,RP0
;............................SITUAÇÃO INICIAL DO MOTOR.....................................
SALVAR	MOVLW 		0xF9
 	MOVWF 		PORTD
 	MOVWF 		0x30
;................................PROGRAMA PRINCIPAL........................................
STOP 	BSF 		BIP
 	CALL 		DELAY
 	BCF 		BIP
 	BCF 		CTRL_M
 	BCF 		LEDVRD
 	BCF 		LEDVRM
TECLA 	BTFSC 		KEY
 	GOTO 		TECLA
;...............................RESGATA ESTADO DO MOTOR....................................
RESCUE	MOVFW 		0x30
 	MOVWF 		PORTD
 	BSF 		CTRL_M
 	BSF 		LEDVRD
 	BSF 		LEDVRM
;........................................SENSOR...........................................
SENSOR	BTFSC		FDC
	CALL		REVERT
;.........................................TECLA...........................................
	BTFSC		KEY
 	GOTO 		STOP
 	GOTO 		SENSOR
;....................................SUBROTINAS...........................................
REVERT	MOVFW 		PORTD 			;Resgata estado do MOTOR
 	XORLW 		0X03 			;Inverte estado do MOTOR
 	MOVWF 		PORTD 			;Salva Motor
SALVA 	MOVWF 		0X30 			;Salva Motor no Registro Geral
 	RETURN
DELAY 	CLRF 		0X20
	CLRF 		0X21
 	;DECFSZ 	0X21,1
	;GOTO 		$-1
 	;DECFSZ 	0X20,1
 	;GOTO 		$-4
 	RETURN
 	END