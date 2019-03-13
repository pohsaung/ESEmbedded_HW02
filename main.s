.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	mov	r0,#100
	mov	r1,#200
	mov	r2,#300
	mov	r3,#500
	mov	r4,#600
	mov	r5,#800
	//
	push	{r0,r1,r2}
	push	{r5,r4,r3}
	mov	r6,#900
	pop	{r6,r7,r8}
	pop	{r5,r4,r3}
	b	.
