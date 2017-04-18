extrn binu:near
public bins

cseg	segment para public 'code'
			assume cs:cseg
bins	proc
			push bp
			mov bp, sp

			mov bx, [bp+4]

			shl bx, 1
			jnc bins_bx_fix
			sar bx, 1
			neg bx

			mov ah, 2
			mov dl, '-'
			int 21h
			jmp bins_binu_call

	bins_bx_fix:
			sar bx, 1

	bins_binu_call:
			push bx
			call binu

			mov sp, bp
			pop bp

			ret 2
bins	endp

cseg 	ends
			end