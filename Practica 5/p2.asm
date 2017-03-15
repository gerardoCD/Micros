Código:
	Programa 2
	processor 16f877 
	include <p16f877.inc>
	A equ H'24'	
	org	0	;Carga al vector de RESET la dirección de inicio
	goto inicio
	org 05	 ;Dirección de inicio del programa del usuario
   
inicio: 
		clrf PORTA  ; Limpia el registro PORTA
		bsf STATUS,RP0  ; Cambiando al banco 1
		bcf STATUS,RP1
		movlw H'07'  ; Configura puertos A y E como digitales
		movwf ADCON1
		movlw H'FF'  	; Configura el puerto A como salida
		movwf TRISA
		movlw H'00'  ; Configura el puerto B como entrada
		movwf TRISB ; Regresa al banco cero
		bcf	STATUS,RP0
INFRA:
	movf PORTA,0 	;leer lo que hay en el puerto A y cargarlo en w
	movwf A  ; lo que tiene el acumulador lo movemos A
	movwf H'07' ;
	andwf A,f  ;Solo verificamos
	movfw A ; lo que tiene A lo pasamos al acumulador
	xorlw H'00'  ; compramos el 0 con lo que tiene acumulador 
	btfsc STATUS,Z  ; Preguntamos por la bandera de signo 
	call paso1  ;llamaos a la subrutina paso1 

	movf PORTA,0
	xorlw H'01'  ; compramos el 1 con lo que tiene acumulador
	btfsc STATUS,Z ; Preguntamos por la bandera de signo 
	call paso2 ;llamaos a la subrutina paso12

    movf PORTA,0
	xorlw H'02' ; compramos el 2 con lo que tiene acumulador
	btfsc STATUS,Z ; Preguntamos por la bandera de signo 
	call paso3 ;llamaos a la subrutina paso3


    movf PORTA,0
	xorlw H'04'; compramos el 4 con lo que tiene acumulador
	btfsc STATUS,Z ; Preguntamos por la bandera de signo 
	call paso4 ;;llamaos a la subrutina paso4

	goto	inicio


paso1:  ;	Estos son la selección de nuestras entradas (Sensores)
	movlw	b'00001011'  ;colocamos un 11 binario en w
	movwf	PORTB ; Lo que tiene w lo manda al puerto B
	return
paso2:
	movlw	b'11111111' colocamos un 255 binario en w
	movwf	PORTB  ; Lo que tiene w lo manda al puerto B
	return
paso3:
	movlw	b'00001110' colocamos un 14 binario en w
	movwf	PORTB ; Lo que tiene w lo manda al puerto B
	return
paso4:
	movlw	b'00000000'
	movwf	PORTB  ; Lo que tiene w lo manda al puerto B
	return

	end ; Termina el programa 






