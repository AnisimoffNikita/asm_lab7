public menu

dseg	segment para public 'data'
			mes	db 	'0: show menu',10,13
					db 	'1: input',10,13
					db	'2: print unsigned bin',10,13
					db	'3: print signed bin',10,13
					db	'4: print unsigned dec',10,13
					db	'5: print signed dec',10,13
					db	'6: print unsigned hex',10,13
					db	'7: print signed hex',10,13
					db	'8: exit',10,13
					db	'$'
dseg	ends

cseg	segment para public 'code'
			assume cs:cseg, ds:dseg
menu	proc
			push bp
			mov bp, sp

			mov dx, offset mes
			mov ah, 9
			int 21h

			mov sp, bp
			pop bp

			ret 0
menu	endp

cseg 	ends
			end