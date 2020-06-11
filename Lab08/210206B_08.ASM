; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.
Start:

	MOV AL,84	; Copy 10000100 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
        MOV	BL,A	; A long delay.
        CALL	30	; Call the procedure at address [30]

        MOV AL,48	; Copy 01001000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
        MOV	BL,1	; A short delay.
        CALL	30	; Call the procedure at address [30]

        MOV AL,30	; Copy 00110000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
        MOV	BL,5	; A middle delay.
        CALL	30	; Call the procedure at address [30]

	JMP Start	; Jump back to the start.
	

; ----- Time Delay Procedure Stored At Address [30] -------------
	ORG	30	; Generate machine code from address [30]

	PUSH	BL	; Save BL on the stack.
	PUSHF		; Save the CPU flags on the stack.
Rep:
	DEC	BL	; Subtract one from BL.
	JNZ	REP	; Jump back to Rep if BL was not Zero.

	POPF		; Restore the CPU flags from the stack.
	POP	BL	; Restore BL from the stack.

	RET		; Return from the procedure.
; ---------------------------------------------------------------
	END
; ---------------------------------------------------------------
	
; ===== Program Ends ==========================================


