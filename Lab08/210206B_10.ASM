; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================
;My index no:- 210206B
Start:
	MOV	AL,FA	; 1111 1010
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,FB	; 1111 1011
	OUT	02	; Send the data in AL to Port 02
	
	MOV	AL,FD	; 1111 1101
	OUT	02	; Send the data in AL to Port 02
	
	END
; ======================================================