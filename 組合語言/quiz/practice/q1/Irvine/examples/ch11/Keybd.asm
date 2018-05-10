TITLE Keyboard Toggle Keys             (Keybd.asm)

; This program shows how to detect the states of various
; keyboard toggle keys. Before you run the program, hold
; down a selected key.
; Last update: 06/01/2006

INCLUDE Irvine32.inc
INCLUDE Macros.inc

; GetKeyState sets bit 0 in EAX if a toggle key is 
; currently on (CapsLock, NumLock, ScrollLock).
; Sets bit 15 in EAX if another specified key is
; currently down.

.code
main PROC

	INVOKE GetKeyState, VK_NUMLOCK
	test al,1
	.IF !Zero?
	  mWrite <"The NumLock key is ON",0dh,0ah>
	.ENDIF

	INVOKE GetKeyState, VK_LSHIFT
	test al,80h
	.IF !Zero?
	  mWrite <"The Left Shift key is currently DOWN",0dh,0ah>
	.ENDIF

	exit
main ENDP
END main