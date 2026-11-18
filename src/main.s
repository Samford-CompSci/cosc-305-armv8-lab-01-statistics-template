// Analyze demo_array using demo_length; store demo_results; return 0.
.text
.global main
.type main, %function
main:
    .cfi_startproc
    // TODO: replace this branch with your implementation.
    b not_implemented
    .cfi_endproc
.size main, .-main
.section .note.GNU-stack,"",@progbits

.data
.balign 8
.global demo_array, demo_length
demo_array: .quad -4, 0, 7, -2, 7, 0
demo_length: .quad 6
.bss
.balign 8
.global demo_results
demo_results: .skip 48
