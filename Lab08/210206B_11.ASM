; ===== Multiply all integers from 1 to 5 ======================
	CLO		; Close unwanted windows.
	MOV AL,5	; Copy a 5 into the AL register.
	MOV BL,1 	; Copy a 1 into the BL register.

MUL:    

 
	MUL BL,AL	; MULTIPLY AL to BL. Answer goes into BL.
        DEC AL	        ; Subtract one from AL.
	JNZ MUL	        ; Jump back to MUL if AL is not 0
 


        MOV	AL,FA	; 1111 1010 -> 0
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,FB	; 1111 1011 -> 0
	OUT	02	; Send the data in AL to Port 02
	
	MOV	AL,8A	; 1000 1010 -> 7
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,FF	; 1111 1111 -> 8
	OUT	02	; Send the data in AL to Port 02
	
	END
	
; ===== Program Ends ===========================================

