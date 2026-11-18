// x0: address of the first element
// x1: number of elements
// x2: address where the two results go
analyze_array:
    mov x3, #0              // running sum
    mov x4, #0              // positive count

    // TODO 1: Walk the array and add each element to x3.
    // TODO 2: While walking the array, increment x4 for each value > 0.

store_results:
    stur x3, [x2, #0]
    stur x4, [x2, #8]
    br x30
