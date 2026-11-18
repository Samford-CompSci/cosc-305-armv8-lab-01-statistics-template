// Build the student instructions as an ordinary callable procedure.
.text
.global analyze_array
.type analyze_array, %function
.include "src/analyze_array.s"
.size analyze_array, .-analyze_array
.section .note.GNU-stack,"",@progbits
