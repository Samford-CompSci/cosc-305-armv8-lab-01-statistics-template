.text
.global _start
.type _start, %function
_start:
    ldr x0, =demo_array
    mov x1, #demo_length
    ldr x2, =demo_results
    bl analyze_array

    // Send the two 64-bit results to the demo script for display.
    ldr x0, =demo_results
    mov x1, #16
    bl write_stdout
    cmp x0, #16
    cset x0, ne
    mov x8, #93
    svc #0
.size _start, .-_start

.section .rodata
.balign 8
demo_array: .quad -4, 0, 7, -2, 7, 0
.equ demo_length, (. - demo_array) / 8

.bss
.balign 8
demo_results: .skip 16
.section .note.GNU-stack,"",@progbits
