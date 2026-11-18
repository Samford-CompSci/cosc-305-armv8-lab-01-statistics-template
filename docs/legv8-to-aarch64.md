# LEGv8 syntax for Lab 1

The terminal runs AArch64 instructions. Here are the spellings you'll use
to build the same kinds of loops and memory accesses as in the simulator.

| In LEGv8 | In this lab |
| --- | --- |
| `ADDI X0, X0, #8` | `add x0, x0, #8` |
| `SUBI X1, X1, #1` | `sub x1, x1, #1` |
| `ADDI X3, XZR, #0` | `mov x3, #0` |
| `LDUR X5, [X0, #0]` | `ldur x5, [x0, #0]` |
| `STUR X3, [X2, #0]` | `stur x3, [x2, #0]` |
| `BR X30` | `br x30` |

To check for a zero element **count**, you can use `cbz x1, label`.
To check whether an element **value** is zero or negative, use
`cmp x5, #0` and then `b.le label`. Replace `label` with the name of
the place you want to branch to, and define it with a trailing colon.

In the simulator, you could choose an address such as 1000. Here the
supplied code puts valid addresses in `x0` and `x2` before your procedure
begins. The offsets in bracketed memory operands are still in bytes.
