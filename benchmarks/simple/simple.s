	.file	"simple.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "simple.c"
	.loc 1 2 13
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 6 8
	lw	a4,12(sp)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	.loc 1 6 12
	lw	a5,8(sp)
	add	a5,a4,a5
	.loc 1 6 5
	addi	a5,a5,-1
	sw	a5,12(sp)
	.loc 1 7 5
	sw	zero,4(sp)
	.loc 1 8 5
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	.loc 1 9 4
	lw	a5,12(sp)
	addi	a5,a5,-1
	sw	a5,12(sp)
	.loc 1 10 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x62
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x2
	.4byte	.LASF2
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x5e
	.byte	0x1
	.string	"i"
	.byte	0x7
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x74
	.byte	0x1
	.string	"j"
	.byte	0x9
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x7c
	.byte	0x1
	.string	"k"
	.byte	0xb
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x4
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2
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
	.byte	0x3
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
	.byte	0x4
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
	.file 0 "/home/andre/uni/heptane_riscv/heptane-master/benchmarks/simple" "/tmp/simple.c"
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"GNU C17 11.1.0 -mtune=rocket -march=rv32imafdc -mabi=ilp32d -march=rv32imafdc -ggdb -O0 -fomit-frame-pointer"
.LASF3:
	.string	"main"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/andre/uni/heptane_riscv/heptane-master/benchmarks/simple"
.LASF0:
	.string	"/tmp/simple.c"
	.ident	"GCC: (g5964b5cd727) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
