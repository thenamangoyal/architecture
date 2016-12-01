.main:
	mov r0,10                       @ a
	mov r1,12                       @ b
	mov r2,-1                       @ c
	call .f                         @ f(a, b, c)
	mov r3,r5                       @ d = f(a, b, c)
	.print r3
	b .exit

.f:
	mov r4,0                        @ i = 0
	.loop: cmp r4,5
		bgt .contb
		beq .contb

		add r0,r1,r2            @ a = b - c
		sub r1,r0,r2            @ b = a - c

		sub sp,sp,20
		st ra,0[sp]
		st r0,4[sp]
		st r1,8[sp]
		st r2,12[sp]
		st r4,16[sp]
		call .g                 @ g(a, b, c)
		ld ra,0[sp]
		ld r0,4[sp]
		ld r1,8[sp]
		ld r2,12[sp]		
		ld r4,16[sp]
		add sp,sp,20

		add r2,r2,r5            @ c = c + g(a, b, c)

		add r4,r4,1
		b .loop

	.contb:
	add r5,r0,r1
	add r5,r5,r2
	ret                             @ return a + b + c

.g:
	mov r4,0
	sub sp,sp,16
	st ra,0[sp]
	st r0,4[sp]
	st r1,8[sp]
	st r2,12[sp]
	call .h                         @ h(a, b, c, 0)
	ld ra,0[sp]
	ld r0,4[sp]
	ld r1,8[sp]
	ld r2,12[sp]
	add sp,sp,16
	mov r0,r5                       @ a = h(a, b, c, 0)

	mov r4,1
	sub sp,sp,16
	st ra,0[sp]
	st r0,4[sp]
	st r1,8[sp]
	st r2,12[sp]
	call .h                         @ h(a, b, c, 1)
	ld ra,0[sp]
	ld r0,4[sp]
	ld r1,8[sp]
	ld r2,12[sp]
	add sp,sp,16
	mov r1,r5			@ b = h(a, b, c, 1)

	mov r4,2
	sub sp,sp,16
	st ra,0[sp]
	st r0,4[sp]
	st r1,8[sp]
	st r2,12[sp]
	call .h                         @ h(a, b, c, 2)
	ld ra,0[sp]
	ld r0,4[sp]
	ld r1,8[sp]
	ld r2,12[sp]
	add sp,sp,16
	mov r2,r5                       @ c = h(a, b, c, 2)

	add r5,r0,r1
	add r5,r5,r2
	ret                             @ return a + b + c

.h:
	cmp r4,0
	beq .case0
	cmp r4,1
	beq .case1
	cmp r4,2
	beq .case2
	b .conth

	.case0:
		add r5,r0,r1
		sub r5,r5,r2
		ret                     @ return a + b - c

	.case1:
		sub r5,r0,r1
		add r5,r5,r2
		ret                     @ return a - b + c

	.case2:
		add r5,r0,r1
		add r5,r5,r2
		ret                     @ return a + b + c


	.conth:
		mov r5,0
		ret                     @ return 0


.exit:
