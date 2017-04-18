public input

cseg	segment para public 'code'
			assume cs:cseg
input	proc
			push bp
			mov bp, sp
			sub sp, 4

			mov word ptr [bp-2], 0
			mov word ptr [bp-4], 0

			mov cx, 10

			mov ah, 1
			int 21h

			cmp al, '-'
			jne input_first

			mov word ptr [bp-2], 1
	input_next:
			mov ah, 1
			int 21h

			cmp al, 13
			je input_next_stop

		input_first:
			mov ah, 0
			sub al, '0'

			mov bx, ax

			mov ax, word ptr [bp-4]
			mul cx
			mov word ptr [bp-4], ax

			add word ptr [bp-4], bx 

			jmp input_next

	input_next_stop:

			mov ax, [bp-4]
			cmp word ptr [bp-2], 1
			jne input_exit
			neg ax
	input_exit:

			mov sp, bp
			pop bp

			ret 0
input	endp

cseg 	ends
			end