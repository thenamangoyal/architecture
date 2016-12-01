.main: mov r0,5
mov r1,0

.loop: cmp r1,r0
bgt .rf
mul r2,r1,r1
cmp r2,r0
beq .rt
bgt .rf
add r1,r1,1
b .loop

.rf: mov r0,0
b .exit

.rt: mov r0,1
b .exit

.exit:
.print r0