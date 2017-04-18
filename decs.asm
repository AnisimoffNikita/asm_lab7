extrn decu:near
public decs

cseg	segment para public 'code'
			assume cs:cseg
decs	proc
			push bp
			mov bp, sp

			mov bx, [bp+4]

			shl bx, 1
			jnc decs_bx_fix
			sar bx, 1
			neg bx

			mov ah, 2
			mov dl, '-'
			int 21h
			jmp decs_decu_call

	decs_bx_fix:
			sar bx, 1

	decs_decu_call:
			push bx
			call decu

			mov sp, bp
			pop bp

			ret 2
decs	endp

cseg 	ends
			end