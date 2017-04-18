extrn menu:near
extrn input:near
extrn binu:near
extrn bins:near
extrn decu:near
extrn decs:near
extrn hexu:near
extrn hexs:near

sseg 	segment para stack 'stack'
						db	300h 	dup(?)	
sseg 	ends

dseg 	segment para public 'data'
			x			dw	5
			func	dw	8 		dup(?)
dseg 	ends

cseg	segment para public 'code'
			assume ds:dseg, cs:cseg, ss:sseg

main	proc far
			push ds
			mov ax, 0
			push ax

			mov ax, dseg
			mov ds, ax

			mov word ptr func[0], offset menu
			mov word ptr func[2], offset input
			mov word ptr func[4], offset binu
			mov word ptr func[6], offset bins
			mov word ptr func[8], offset decu
			mov word ptr func[10], offset decs
			mov word ptr func[12], offset hexu
			mov word ptr func[14], offset hexs

			call func[0]

	lmain_menu:
			mov ah, 2
			mov dl, '>'
			int 21h
			mov dl, ' '
			int 21h

			mov ah, 1
			int 21h

			mov ah, 0
			sub al, '0'
			mov si, ax

			mov ah, 2
			mov dl, 10
			int 21h
			mov dl, 13
			int 21h

			cmp si, 8
			je lmain_exit
			ja lmain_menu
			cmp si, 0
			jb lmain_menu

			cmp si, 2
			jb lmain_call

			push x

	lmain_call:
			shl si, 1
			call func[si]
			shr si, 1

			cmp si, 1
			jne lmain_menu

			mov x, ax

			jmp lmain_menu

	lmain_exit:
			ret
main	endp

print	proc
			mov ah, 9
			int 21h
			ret
print endp	

cseg 	ends
			end 	main