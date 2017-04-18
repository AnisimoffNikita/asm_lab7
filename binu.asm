public binu

cseg	segment para public 'code'
			assume cs:cseg
binu	proc
			push bp
			mov bp, sp

			mov bx, [bp+4]
			mov cx, 16
			mov ah, 2
	binu_zero_skip:
			shl bx, 1
			jc binu_print
			loop binu_zero_skip

			mov cx, 1

	binu_print:
			mov dl, 0
			adc dl, 0
			add dl, '0'

			int 21h

			shl bx, 1
			loop binu_print

			mov dl, 10
			int 21h
			mov dl, 13
			int 21h

			mov sp, bp
			pop bp

			ret 2
binu	endp

cseg 	ends
			end