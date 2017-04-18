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
			mov dx, 4
			mov si, 0
	hexu_zero_skip:

			rol bx, 1   
			rol bx, 1   
			rol bx, 1   
			rol bx, 1                                                                                                                                   
			mov si, bx
			and si, 1111b

			test si, si
			jnz hexu_print
			loop hexu_zero_skip

			mov cx, 1
			mov ah, 2
	hexu_print:
			mov dl, hex[si]
			int 21h

			rol bx, 1   
			rol bx, 1   
			rol bx, 1   
			rol bx, 1   
			mov si, bx
			and si, 1111b

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