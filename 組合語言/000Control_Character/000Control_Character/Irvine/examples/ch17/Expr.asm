TITLE FPU Expression Evaluation              (Expr.asm)

; Implementation of the following expression:
;     (6.0 * 2.0) + (4.5 * 3.2)
; FPU instructions used.
; Last update: 06/01/2006

INCLUDE Irvine32.inc	; 32-bit Protected mode program.

.data
array      REAL4 6.0, 2.0, 4.5, 3.2
dotProduct REAL4 ?

.code
main PROC
	finit			; initialize FPU
	
	fld	array		; push 6.0 onto the stack
	fmul	array+4		; ST(0) = 6.0 * 2.0
	call	ShowFPUStack
	
	fld	array+8		; push 4.5 onto the stack
	fmul	array+12		; ST(0) = 4.5 * 3.2
	call	ShowFPUStack
	
	fadd	 			; ST(0) = ST(0) + ST(1)
	call	ShowFPUStack
	fstp	dotProduct  	; pop stack into memory operand

	exit
main ENDP
END main