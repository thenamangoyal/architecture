.main: mov r0,3                 @ N
mov r1,0x100                    @ base address A
mov r2,0x200                    @ base address B
mov r3,0x300                    @ base adddress C

.setab: mov r4,0                @ Set A and B
.oloopab: cmp r4,r0             @ Loop variable i
beq .calcc
bgt .calcc
mov r5,0

.iloopab: cmp r5,r0             @ Loop variable j
beq .contoloopab
bgt .contoloopab

mul r6,r4,r0
add r6,r6,r5
lsl r6,r6,2
add r7,r6,r1                    @ Address A[i][j] = A + (i*N+j)*4
add r8,r6,r2                    @ Address B[i][j] = B + (i*N+j)*4

add r9,r4,r5

mul r11,r4,2
mul r12,r5,3

add r10,r11,r12

st r9,0[r7]                     @ A[i][j] = i + j
st r10,0[r8]                    @ B[i][j] = 2*i + 3*j
add r5,r5,1
b .iloopab
.contoloopab: add r4,r4,1
b .oloopab


.calcc: mov r4,0                @ Calculate C
.oloopc: cmp r4,r0              @ Loop variable i
beq .cprin
bgt .cprin
mov r5,0

.iloopc: cmp r5,r0              @ Loop variable j
beq .contoloopc
bgt .contoloopc

mov r10,0                       @ Intialize temp = 0

mov r6,0
.cloopc: cmp r6,r0              @ Loop variable k
beq .contiloopc
bgt .contiloopc
mul r7,r4,r0
add r7,r7,r6
lsl r7,r7,2
add r7,r7,r1                    @ Address A[i][k] = A + (i*N+k)*4

mul r8,r6,r0
add r8,r8,r5
lsl r8,r8,2
add r8,r8,r2                    @ Address B[k][j] = B + (k*N+j)*4

ld r11,0[r7]
ld r12,0[r8]
mul r11,r11,r12

add r10,r10,r11                 @ temp = temp + A[i][k]*B[k][j]

add r6,r6,1
b .cloopc

.contiloopc:
mul r9,r4,r0
add r9,r9,r5
lsl r9,r9,2
add r9,r9,r3                    @ Address C[i][j] = C + (i*N+j)*4

st r10,0[r9]                    @ C[i][j] = temp

add r5,r5,1
b .iloopc
.contoloopc:
add r4,r4,1
b .oloopc


.cprin:                         @ Print C
mov r4,0
.oloopcprin: cmp r4,r0          @ Loop variable i
beq .exit
bgt .exit
mov r5,0
.iloopcprin: cmp r5,r0          @ Loop variable j
beq .contoloopcprin
bgt .contoloopcprin

mul r6,r4,r0
add r6,r6,r5
lsl r6,r6,2
add r6,r6,r3                    @ Address C[i][j] = C + (i*N+j)*4

ld r7,0[r6]

.print r7                       @ Printing C[i][j]

add r5,r5,1
b .iloopcprin

.contoloopcprin:
add r4,r4,1
b .oloopcprin

.exit: