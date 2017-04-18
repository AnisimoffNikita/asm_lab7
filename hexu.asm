public hexu

dseg 	segment para public 'data'
			hex	db '0','1','2','3'
					db '4','5','6','7'
					db '8','9','A','B'
					db 'C','D','E','F'
dseg	ends

cseg	segment para public 'code'
			assume cs:cseg, ds:dseg
hexu	proc
			push bp
			mov bp, sp

			mov bx, [bp+4]
			mov cx, 4
			mov ah, 2
			mov si, 0
	hexu_zero_skip:
			shl bx, 1
			adc si, 0
			shl si, 1

			shl bx, 1
			adc si, 0
			shl si, 1

			shl bx, 1
			adc si, 0
			shl si, 1

			shl bx, 1
			adc si, 0

			test si, si
			jnz hexu_print
			mov si, 0
			loop hexu_zero_skip

			mov cx, 1
			mov ah, 2
	hexu_print:
			mov dl, hex[si]
			mov si, 0
			int 21h

			shl bx, 1
			adc si, 0
			shl si, 1

			shl bx, 1
			adc si, 0
			shl si, 1

			shl bx, 1
			adc si, 0
			shl si, 1

			shl bx, 1
			adc si, 0

			loop hexu_print

			mov dl, 10
			int 21h
			mov dl, 13
			int 21h

			mov sp, bp
			pop bp

			ret 2
hexu	endp

cseg 	ends
			end