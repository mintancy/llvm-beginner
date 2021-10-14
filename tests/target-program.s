	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m33
	.eabi_attribute	6, 17	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 3	@ Tag_THUMB_ISA_use
	.fpu	fpv5-sp-d16
	.eabi_attribute	27, 1	@ Tag_ABI_HardFP_use
	.eabi_attribute	36, 1	@ Tag_FP_HP_extension
	.eabi_attribute	46, 1	@ Tag_DSP_extension
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"target-program.cpp"
	.globl	_Z3addii                @ -- Begin function _Z3addii
	.p2align	1
	.type	_Z3addii,%function
	.code	16                      @ @_Z3addii
	.thumb_func
_Z3addii:
	.fnstart
@ %bb.0:                                @ %entry
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [sp, #4]
	ldr	r1, [sp]
	add	r0, r1
	add	sp, #8
	bx	lr
.Lfunc_end0:
	.size	_Z3addii, .Lfunc_end0-_Z3addii
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_Z3inci                 @ -- Begin function _Z3inci
	.p2align	1
	.type	_Z3inci,%function
	.code	16                      @ @_Z3inci
	.thumb_func
_Z3inci:
	.fnstart
@ %bb.0:                                @ %entry
	.pad	#4
	sub	sp, #4
	str	r0, [sp]
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	add	sp, #4
	bx	lr
.Lfunc_end1:
	.size	_Z3inci, .Lfunc_end1-_Z3inci
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_Z8testcalli            @ -- Begin function _Z8testcalli
	.p2align	1
	.type	_Z8testcalli,%function
	.code	16                      @ @_Z8testcalli
	.thumb_func
_Z8testcalli:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	movw	r0, :lower16:Fptr
	movt	r0, :upper16:Fptr
	ldr	r1, [r0]
	ldr	r0, [sp, #4]
	blx	r1
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end2:
	.size	_Z8testcalli, .Lfunc_end2-_Z8testcalli
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_Z8testloopi            @ -- Begin function _Z8testloopi
	.p2align	1
	.type	_Z8testloopi,%function
	.code	16                      @ @_Z8testloopi
	.thumb_func
_Z8testloopi:
	.fnstart
@ %bb.0:                                @ %entry
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #12]
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB3_1
.LBB3_1:                                @ %for.cond
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB3_3 Depth 2
	ldr	r0, [sp, #4]
	ldr	r1, [sp, #12]
	cmp	r0, r1
	bge	.LBB3_8
	b	.LBB3_2
.LBB3_2:                                @ %for.body
                                        @   in Loop: Header=BB3_1 Depth=1
	movs	r0, #0
	str	r0, [sp]
	b	.LBB3_3
.LBB3_3:                                @ %for.cond1
                                        @   Parent Loop BB3_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [sp]
	ldr	r1, [sp, #12]
	cmp	r0, r1
	bge	.LBB3_6
	b	.LBB3_4
.LBB3_4:                                @ %for.body3
                                        @   in Loop: Header=BB3_3 Depth=2
	ldr	r0, [sp, #8]
	adds	r0, #1
	str	r0, [sp, #8]
	b	.LBB3_5
.LBB3_5:                                @ %for.inc
                                        @   in Loop: Header=BB3_3 Depth=2
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	b	.LBB3_3
.LBB3_6:                                @ %for.end
                                        @   in Loop: Header=BB3_1 Depth=1
	b	.LBB3_7
.LBB3_7:                                @ %for.inc5
                                        @   in Loop: Header=BB3_1 Depth=1
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB3_1
.LBB3_8:                                @ %for.end7
	ldr	r0, [sp, #8]
	add	sp, #16
	bx	lr
.Lfunc_end3:
	.size	_Z8testloopi, .Lfunc_end3-_Z8testloopi
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_Z15testconditionbrv    @ -- Begin function _Z15testconditionbrv
	.p2align	1
	.type	_Z15testconditionbrv,%function
	.code	16                      @ @_Z15testconditionbrv
	.thumb_func
_Z15testconditionbrv:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#16
	sub	sp, #16
	movs	r0, #0
	str	r0, [sp, #12]
	str	r0, [sp, #8]
	b	.LBB4_1
.LBB4_1:                                @ %for.cond
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp, #8]
	cmp	r0, #9
	bgt	.LBB4_9
	b	.LBB4_2
.LBB4_2:                                @ %for.body
                                        @   in Loop: Header=BB4_1 Depth=1
	ldr	r0, [sp, #8]
	add.w	r1, r0, r0, lsr #31
	bic	r1, r1, #1
	subs	r0, r0, r1
	cbz	r0, .LBB4_4
	b	.LBB4_3
.LBB4_3:                                @ %for.body
                                        @   in Loop: Header=BB4_1 Depth=1
	cmp	r0, #1
	beq	.LBB4_5
	b	.LBB4_6
.LBB4_4:                                @ %sw.bb
                                        @   in Loop: Header=BB4_1 Depth=1
	ldr	r0, [sp, #12]
	str	r0, [sp, #4]
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #12]
	blx	r1
	b	.LBB4_7
.LBB4_5:                                @ %sw.bb1
                                        @   in Loop: Header=BB4_1 Depth=1
	ldr	r0, [sp, #12]
	adds	r0, #1
	str	r0, [sp, #12]
	b	.LBB4_7
.LBB4_6:                                @ %sw.default
                                        @   in Loop: Header=BB4_1 Depth=1
	b	.LBB4_7
.LBB4_7:                                @ %sw.epilog
                                        @   in Loop: Header=BB4_1 Depth=1
	b	.LBB4_8
.LBB4_8:                                @ %for.inc
                                        @   in Loop: Header=BB4_1 Depth=1
	ldr	r0, [sp, #8]
	adds	r0, #1
	str	r0, [sp, #8]
	b	.LBB4_1
.LBB4_9:                                @ %for.end
	ldr	r0, [sp, #12]
	add	sp, #16
	pop	{r7, pc}
.Lfunc_end4:
	.size	_Z15testconditionbrv, .Lfunc_end4-_Z15testconditionbrv
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	main                    @ -- Begin function main
	.p2align	1
	.type	main,%function
	.code	16                      @ @main
	.thumb_func
main:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r6, r7, lr}
	push	{r4, r6, r7, lr}
	.setfp	r7, sp, #8
	add	r7, sp, #8
	.pad	#32
	sub	sp, #32
	movs	r4, #0
	str	r4, [sp, #28]
	movs	r0, #42
	str	r0, [sp, #24]
	movs	r0, #13
	str	r0, [sp, #20]
	ldr	r0, [sp, #24]
	ldr	r1, [sp, #20]
	bl	_Z3addii
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	str	r0, [sp, #12]
	ldr	r0, [sp, #16]
	bl	_Z3inci
	str	r0, [sp, #16]
	str	r4, [sp, #4]
	b	.LBB5_1
.LBB5_1:                                @ %for.cond
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp, #4]
	cmp	r0, #99
	bgt	.LBB5_4
	b	.LBB5_2
.LBB5_2:                                @ %for.body
                                        @   in Loop: Header=BB5_1 Depth=1
	ldr	r0, [sp, #16]
	adds	r0, #1
	str	r0, [sp, #16]
	b	.LBB5_3
.LBB5_3:                                @ %for.inc
                                        @   in Loop: Header=BB5_1 Depth=1
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB5_1
.LBB5_4:                                @ %for.end
	movw	r0, :lower16:Fptr
	movt	r0, :upper16:Fptr
	ldr	r1, [r0]
	ldr	r0, [sp, #16]
	blx	r1
	str	r0, [sp, #16]
	ldr	r0, [sp, #12]
	bl	_Z8testcalli
	str	r0, [sp, #12]
	ldr	r0, [sp, #16]
	bl	_Z8testloopi
	str	r0, [sp, #8]
	bl	_Z15testconditionbrv
	ldr	r0, [sp, #16]
	add	sp, #32
	pop	{r4, r6, r7, pc}
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cantunwind
	.fnend
                                        @ -- End function
	.type	Fptr,%object            @ @Fptr
	.data
	.globl	Fptr
	.p2align	2
Fptr:
	.long	_Z3inci
	.size	Fptr, 4


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final 375507)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
