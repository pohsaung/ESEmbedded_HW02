.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	mov	r0,#100
	mov	r1,#200
	mov	r2,#300
	//
	push	{r0,r1,r2}
	pop	{r3,r4,r5} 
	b	.
