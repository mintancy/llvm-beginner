	.text
	.file	"target-program.cpp"
	.globl	_Z3addii                # -- Begin function _Z3addii
	.p2align	4, 0x90
	.type	_Z3addii,@function
_Z3addii:                               # @_Z3addii
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	movl	%esi, -4(%rbp)
	movl	-8(%rbp), %eax
	addl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z3addii, .Lfunc_end0-_Z3addii
	.cfi_endproc
                                        # -- End function
	.globl	_Z3inci                 # -- Begin function _Z3inci
	.p2align	4, 0x90
	.type	_Z3inci,@function
_Z3inci:                                # @_Z3inci
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_Z3inci, .Lfunc_end1-_Z3inci
	.cfi_endproc
                                        # -- End function
	.globl	_Z8testcalli            # -- Begin function _Z8testcalli
	.p2align	4, 0x90
	.type	_Z8testcalli,@function
_Z8testcalli:                           # @_Z8testcalli
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	Fptr, %rax
	movl	-4(%rbp), %edi
	callq	*%rax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	_Z8testcalli, .Lfunc_end2-_Z8testcalli
	.cfi_endproc
                                        # -- End function
	.globl	_Z8testloopi            # -- Begin function _Z8testloopi
	.p2align	4, 0x90
	.type	_Z8testloopi,@function
_Z8testloopi:                           # @_Z8testloopi
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -16(%rbp)
	movl	$0, -8(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, -4(%rbp)
.LBB3_3:                                # %for.cond1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB3_3
.LBB3_6:                                # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_7
.LBB3_7:                                # %for.inc5
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB3_1
.LBB3_8:                                # %for.end7
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	_Z8testloopi, .Lfunc_end3-_Z8testloopi
	.cfi_endproc
                                        # -- End function
	.globl	_Z15testconditionbrv    # -- Begin function _Z15testconditionbrv
	.p2align	4, 0x90
	.type	_Z15testconditionbrv,@function
_Z15testconditionbrv:                   # @_Z15testconditionbrv
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10, -4(%rbp)
	jge	.LBB4_9
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	movl	%eax, %edx
	addl	%ecx, %edx
	andl	$-2, %edx
	subl	%edx, %eax
	je	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	subl	$1, %eax
	je	.LBB4_5
	jmp	.LBB4_6
.LBB4_4:                                # %sw.bb
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB4_7
.LBB4_5:                                # %sw.bb1
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB4_7
.LBB4_6:                                # %sw.default
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_7
.LBB4_7:                                # %sw.epilog
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_8
.LBB4_8:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB4_1
.LBB4_9:                                # %for.end
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	_Z15testconditionbrv, .Lfunc_end4-_Z15testconditionbrv
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -28(%rbp)
	movl	$42, -20(%rbp)
	movl	$13, -16(%rbp)
	movl	-20(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	_Z3addii
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %edi
	callq	_Z3inci
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$100, -8(%rbp)
	jge	.LBB5_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB5_1
.LBB5_4:                                # %for.end
	movq	Fptr, %rax
	movl	-4(%rbp), %edi
	callq	*%rax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %edi
	callq	_Z8testcalli
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %edi
	callq	_Z8testloopi
	movl	%eax, -24(%rbp)
	callq	_Z15testconditionbrv
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        # -- End function
	.type	Fptr,@object            # @Fptr
	.data
	.globl	Fptr
	.p2align	3
Fptr:
	.quad	_Z3inci
	.size	Fptr, 8


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final 375507)"
	.section	".note.GNU-stack","",@progbits
