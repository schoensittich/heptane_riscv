	.file	"matmult.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	Seed
	.section	.sbss,"aw",@nobits
	.align	2
	.type	Seed, @object
	.size	Seed, 4
Seed:
	.zero	4
	.globl	A
	.bss
	.align	2
	.type	A, @object
	.size	A, 1600
A:
	.zero	1600
	.globl	B
	.align	2
	.type	B, @object
	.size	B, 1600
B:
	.zero	1600
	.globl	Res
	.align	2
	.type	Res, @object
	.size	Res, 1600
Res:
	.zero	1600
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "matmult.c"
	.loc 1 66 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 67 3
	call	InitSeed
	.loc 1 74 3
	call	Test
	.loc 1 75 10
	li	a5,0
	.loc 1 76 1
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	1
	.globl	InitSeed
	.type	InitSeed, @function
InitSeed:
.LFB1:
	.loc 1 82 1
	.cfi_startproc
	.loc 1 87 8
	lui	a5,%hi(Seed)
	sw	zero,%lo(Seed)(a5)
	.loc 1 88 1
	nop
	ret
	.cfi_endproc
.LFE1:
	.size	InitSeed, .-InitSeed
	.align	1
	.globl	Test
	.type	Test, @function
Test:
.LFB2:
	.loc 1 95 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 101 3
	call	InitializeA
	.loc 1 102 3
	call	InitializeB
	.loc 1 109 3
	call	Multiply
	.loc 1 118 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	Test, .-Test
	.align	1
	.globl	InitializeA
	.type	InitializeA, @function
InitializeA:
.LFB3:
	.loc 1 124 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 127 19
	sw	zero,12(sp)
	.loc 1 127 3
	j	.L6
.L9:
	.loc 1 129 7
#APP
# 129 "matmult.c" 1
	1:
        .section .wcet_annot
        .long 1b
        .long 1
        .long 20
         .text
# 0 "" 2
	.loc 1 130 23
#NO_APP
	sw	zero,8(sp)
	.loc 1 130 7
	j	.L7
.L8:
	.loc 1 132 4 discriminator 3
#APP
# 132 "matmult.c" 1
	1:
        .section .wcet_annot
        .long 1b
        .long 1
        .long 20
         .text
# 0 "" 2
	.loc 1 133 32 discriminator 3
#NO_APP
	call	RandomInteger
	mv	a2,a0
	.loc 1 133 30 discriminator 3
	lui	a5,%hi(A)
	addi	a3,a5,%lo(A)
	lw	a4,12(sp)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lw	a4,8(sp)
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a2,0(a5)
	.loc 1 130 55 discriminator 3
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
.L7:
	.loc 1 130 39 discriminator 1
	lw	a4,8(sp)
	li	a5,19
	ble	a4,a5,.L8
	.loc 1 127 51 discriminator 2
	lw	a5,12(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
.L6:
	.loc 1 127 35 discriminator 1
	lw	a4,12(sp)
	li	a5,19
	ble	a4,a5,.L9
	.loc 1 136 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	InitializeA, .-InitializeA
	.align	1
	.globl	InitializeB
	.type	InitializeB, @function
InitializeB:
.LFB4:
	.loc 1 142 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 145 19
	sw	zero,12(sp)
	.loc 1 145 3
	j	.L11
.L14:
	.loc 1 147 7
#APP
# 147 "matmult.c" 1
	1:
        .section .wcet_annot
        .long 1b
        .long 1
        .long 20
         .text
# 0 "" 2
	.loc 1 148 23
#NO_APP
	sw	zero,8(sp)
	.loc 1 148 7
	j	.L12
.L13:
	.loc 1 150 4 discriminator 3
#APP
# 150 "matmult.c" 1
	1:
        .section .wcet_annot
        .long 1b
        .long 1
        .long 20
         .text
# 0 "" 2
	.loc 1 151 32 discriminator 3
#NO_APP
	call	RandomInteger
	mv	a2,a0
	.loc 1 151 30 discriminator 3
	lui	a5,%hi(B)
	addi	a3,a5,%lo(B)
	lw	a4,12(sp)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lw	a4,8(sp)
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a2,0(a5)
	.loc 1 148 55 discriminator 3
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
.L12:
	.loc 1 148 39 discriminator 1
	lw	a4,8(sp)
	li	a5,19
	ble	a4,a5,.L13
	.loc 1 145 51 discriminator 2
	lw	a5,12(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
.L11:
	.loc 1 145 35 discriminator 1
	lw	a4,12(sp)
	li	a5,19
	ble	a4,a5,.L14
	.loc 1 154 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	InitializeB, .-InitializeB
	.align	1
	.globl	RandomInteger
	.type	RandomInteger, @function
RandomInteger:
.LFB5:
	.loc 1 160 1
	.cfi_startproc
	.loc 1 161 17
	lui	a5,%hi(Seed)
	lw	a4,%lo(Seed)(a5)
	mv	a5,a4
	slli	a5,a5,5
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	.loc 1 161 24
	addi	a4,a5,81
	.loc 1 161 30
	li	a5,8192
	addi	a5,a5,-97
	rem	a4,a4,a5
	.loc 1 161 8
	lui	a5,%hi(Seed)
	sw	a4,%lo(Seed)(a5)
	.loc 1 162 10
	lui	a5,%hi(Seed)
	lw	a5,%lo(Seed)(a5)
	.loc 1 163 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE5:
	.size	RandomInteger, .-RandomInteger
	.align	1
	.globl	Multiply
	.type	Multiply, @function
Multiply:
.LFB6:
	.loc 1 185 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	s2,4(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	.cfi_offset 18, -12
	.loc 1 188 14
	li	s0,0
	.loc 1 188 3
	j	.L18
.L23:
	.loc 1 190 7
#APP
# 190 "matmult.c" 1
	1:
        .section .wcet_annot
        .long 1b
        .long 1
        .long 20
         .text
# 0 "" 2
	.loc 1 191 18
#NO_APP
	li	s1,0
	.loc 1 191 7
	j	.L19
.L22:
	.loc 1 193 4
#APP
# 193 "matmult.c" 1
	1:
        .section .wcet_annot
        .long 1b
        .long 1
        .long 20
         .text
# 0 "" 2
	.loc 1 194 22
#NO_APP
	lui	a5,%hi(Res)
	addi	a4,a5,%lo(Res)
	mv	a5,s0
	slli	a5,a5,2
	add	a5,a5,s0
	slli	a5,a5,2
	add	a5,a5,s1
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,0(a5)
	.loc 1 195 15
	li	s2,0
	.loc 1 195 4
	j	.L20
.L21:
	.loc 1 197 8 discriminator 3
#APP
# 197 "matmult.c" 1
	1:
        .section .wcet_annot
        .long 1b
        .long 1
        .long 20
         .text
# 0 "" 2
	.loc 1 198 26 discriminator 3
#NO_APP
	lui	a5,%hi(Res)
	addi	a4,a5,%lo(Res)
	mv	a5,s0
	slli	a5,a5,2
	add	a5,a5,s0
	slli	a5,a5,2
	add	a5,a5,s1
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 198 37 discriminator 3
	lui	a5,%hi(A)
	addi	a3,a5,%lo(A)
	mv	a5,s0
	slli	a5,a5,2
	add	a5,a5,s0
	slli	a5,a5,2
	add	a5,a5,s2
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a3,0(a5)
	.loc 1 198 55 discriminator 3
	lui	a5,%hi(B)
	addi	a2,a5,%lo(B)
	mv	a5,s2
	slli	a5,a5,2
	add	a5,a5,s2
	slli	a5,a5,2
	add	a5,a5,s1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	.loc 1 198 45 discriminator 3
	mul	a5,a3,a5
	.loc 1 198 26 discriminator 3
	add	a4,a4,a5
	lui	a5,%hi(Res)
	addi	a3,a5,%lo(Res)
	mv	a5,s0
	slli	a5,a5,2
	add	a5,a5,s0
	slli	a5,a5,2
	add	a5,a5,s1
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 1 195 37 discriminator 3
	addi	s2,s2,1
.L20:
	.loc 1 195 26 discriminator 1
	li	a5,19
	ble	s2,a5,.L21
	.loc 1 191 40 discriminator 2
	addi	s1,s1,1
.L19:
	.loc 1 191 29 discriminator 1
	li	a5,19
	ble	s1,a5,.L22
	.loc 1 188 36 discriminator 2
	addi	s0,s0,1
.L18:
	.loc 1 188 25 discriminator 1
	li	a5,19
	ble	s0,a5,.L23
	.loc 1 202 1
	nop
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	lw	s2,4(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	Multiply, .-Multiply
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x17f
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x5
	.4byte	.LASF14
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x6
	.4byte	.LASF15
	.byte	0x1
	.byte	0x31
	.byte	0xd
	.4byte	0x32
	.byte	0x7
	.4byte	0x4d
	.4byte	0x46
	.byte	0x3
	.4byte	0x46
	.byte	0x3
	.4byte	0x46
	.byte	0
	.byte	0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xa
	.4byte	.LASF3
	.byte	0x1
	.byte	0x33
	.byte	0x5
	.4byte	0x4d
	.byte	0x5
	.byte	0x3
	.4byte	Seed
	.byte	0x2
	.string	"A"
	.byte	0x8
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0x2
	.string	"B"
	.byte	0xb
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x2
	.string	"Res"
	.byte	0xe
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	Res
	.byte	0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0xb5
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0xd0
	.byte	0x1
	.4byte	.LASF4
	.byte	0xba
	.byte	0x10
	.4byte	0x4d
	.byte	0x1
	.byte	0x58
	.byte	0x1
	.4byte	.LASF5
	.byte	0xba
	.byte	0x17
	.4byte	0x4d
	.byte	0x1
	.byte	0x59
	.byte	0x1
	.4byte	.LASF6
	.byte	0xba
	.byte	0x1e
	.4byte	0x4d
	.byte	0x1
	.byte	0x62
	.byte	0
	.byte	0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	0x4d
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.byte	0x4
	.4byte	.LASF8
	.byte	0x8a
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x117
	.byte	0x1
	.4byte	.LASF9
	.byte	0x8f
	.byte	0x7
	.4byte	0x4d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x1
	.4byte	.LASF10
	.byte	0x8f
	.byte	0x13
	.4byte	0x4d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x4
	.4byte	.LASF11
	.byte	0x78
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x148
	.byte	0x1
	.4byte	.LASF9
	.byte	0x7d
	.byte	0x7
	.4byte	0x4d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x1
	.4byte	.LASF10
	.byte	0x7d
	.byte	0x13
	.4byte	0x4d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.4byte	.LASF17
	.byte	0x1
	.byte	0x4e
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0x41
	.byte	0x5
	.4byte	0x4d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x34
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x21
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.file 0 "/home/andre/uni/heptane_riscv/heptane-master/benchmarks/matmult" "/tmp/matmult.c"
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"OuterIndex"
.LASF2:
	.string	"unsigned int"
.LASF5:
	.string	"Inner"
.LASF3:
	.string	"Seed"
.LASF17:
	.string	"InitSeed"
.LASF15:
	.string	"matrix"
.LASF6:
	.string	"Index"
.LASF7:
	.string	"Multiply"
.LASF14:
	.string	"GNU C17 11.1.0 -mtune=rocket -march=rv32imafdc -mabi=ilp32d -march=rv32imafdc -ggdb -O0 -fomit-frame-pointer"
.LASF11:
	.string	"InitializeA"
.LASF12:
	.string	"RandomInteger"
.LASF13:
	.string	"main"
.LASF4:
	.string	"Outer"
.LASF8:
	.string	"InitializeB"
.LASF16:
	.string	"Test"
.LASF10:
	.string	"InnerIndex"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/andre/uni/heptane_riscv/heptane-master/benchmarks/matmult"
.LASF0:
	.string	"/tmp/matmult.c"
	.ident	"GCC: (g5964b5cd727) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
