extrn hexu:near
public hexs

cseg	segment para public 'code'
			assume cs:cseg
hexs	proc
			push bp
			mov bp, sp

			mov bx, [bp+4]

			shl bx, 1
			jnc hexs_bx_fix
			sar bx, 1
			neg bx

			mov ah, 2
			mov dl, '-'
			int 21h
			jmp hexs_hexu_call

	hexs_bx_fix:
			sar bx, 1

	hexs_hexu_call:
			push bx
			call hexu

			mov sp, bp
			pop bp

			ret 2
hexs	endp

cseg 	ends
			end