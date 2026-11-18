// x0=value -> x0=-1/0/1 for negative/zero/positive.
.text
.global classify_value
.type classify_value, %function
classify_value:
    .cfi_startproc
    // TODO: replace this branch with your implementation.
    b not_implemented
    .cfi_endproc
.size classify_value, .-classify_value
.section .note.GNU-stack,"",@progbits
