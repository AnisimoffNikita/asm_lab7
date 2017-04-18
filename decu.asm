public decu

cseg	segment para public 'code'
			assume cs:cseg
decu	proc
			push bp
			mov bp, sp

			sub sp, 6
			push si

			mov bx, [bp+4]
			mov cx, 10
			mov si, -1

	decu_get:
			mov dx, 0
			mov ax, bx
			div cx

			mov bx, ax
			add dl, '0'
			mov byte ptr [bp+si], dl
			dec si

			test bx, bx
			jnz decu_get

			inc si
			mov ah, 2
	decu_print:
			mov dl, byte ptr [bp+si]
			int 21h
			inc si
			test si, si
			jnz decu_print

			mov dl, 10
			int 21h
			mov dl, 13
			int 21h
			
			pop si

			mov sp, bp
			pop bp

			ret 2
decu	endp

cseg 	ends
			end