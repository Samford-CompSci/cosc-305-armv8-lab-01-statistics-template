# Lab 1 · Array sum and positive count

In the LEGv8 simulator, you can use `BL` to call a procedure, `BR X30` to
return, and `STUR` to put a value in memory. Here the supplied code calls your
procedure, `analyze_array`, and shows the two values it stores in memory.
The result stores and return are already in your starter file.

## What your loop receives

| Register | Value on entry |
| --- | --- |
| `x0` | Address of the first array element |
| `x1` | Number of elements |
| `x2` | Address of the two result slots |

Each array element is a signed 64-bit integer and takes 8 bytes. Keep the
input array intact. The starter uses `x3` for the sum and `x4` for the positive
count. You can use `x5`–`x7` for temporary values and change `x0` and `x1`
as you go. Keep `x2` available for the final stores and `x30` for the return.

## Build the loop in two steps

1. **Sum the array.** Before loading an element, check whether `x1` is zero.
   If it is, branch to `store_results`. Otherwise load the current value
   with `ldur x5, [x0, #0]` and add it to the running sum. Move `x0` forward
   by 8 bytes, decrease `x1` by 1, and repeat. Run `make run` and check that
   you get a sum of 8.
2. **Count positive elements.** Inside the same loop, compare the current
   value with zero. Increment the count only when the value is greater than
   zero. Run `make run` again and check that the count is 2.

In AArch64, use `add x0, x0, #8` for LEGv8's `ADDI X0, X0, #8`.
Use `cmp x5, #0` followed by `b.le` to branch when the element is zero or
negative. See the [syntax notes](docs/legv8-to-aarch64.md) for short examples.

The starter stores the sum at `[x2, #0]` and the positive count at
`[x2, #8]`. For an empty array, store two zeros and skip all array loads.
Assume the running sum fits in a signed 64-bit register.

`make run` uses `[-4, 0, 7, -2, 7, 0]`. Run `make test` when both demo
results match. The tests include empty arrays, all-negative arrays, zeros,
and values that need 64-bit registers.
