# Lab 1: Array statistics and classification

Implement `main`, `analyze_array`, `classify_value`, and `update_min_max`
in their corresponding `src/*.s` files. Use AAPCS64 and preserve live values
across calls. Recommended concepts: `ldur`, pointer arithmetic, loops,
conditional branches, `bl`, stack frames, and `ret`.

## Procedure interfaces

| Procedure | Arguments | Result / writes |
| --- | --- | --- |
| `classify_value` | `x0`: signed 64-bit value | `x0`: -1 negative, 0 zero, 1 positive |
| `update_min_max` | `x0`: value; `x1`: results address | Update only the minimum/maximum fields; no return value required |
| `analyze_array` | `x0`: array address; `x1`: element count; `x2`: results address | Write all six result fields; no return value required |
| `main` | None | Analyze the supplied demo array, store in `demo_results`, return 0 |

Results are six consecutive 64-bit fields:

| Byte offset | Field |
| --- | --- |
| 0 | Minimum, signed |
| 8 | Maximum, signed |
| 16 | Sum, signed |
| 24 | Positive count |
| 32 | Negative count |
| 40 | Zero count |

`analyze_array` initializes every result field on each call. For an empty
array it writes six zeros and must not dereference the array pointer (which
may be zero). For nonempty input, initialize minimum and maximum from the
first element, then process all elements. Sums and intermediate running sums
in the test inputs fit signed 64 bits; overflow handling is outside scope.
Counts and lengths are nonnegative 64-bit values.

For every element, `analyze_array` must call `classify_value` and use its
returned category to update the count. It must also call `update_min_max`
and use that procedure to maintain the extrema. Do not duplicate those
helpers' decisions in the caller. `update_min_max` assumes its two fields
already contain valid current extrema and leaves the other four fields alone.
The input array is read-only; output storage is valid, separate, and 48 bytes.

## Main integration

Keep the supplied global data labels. `demo_array` contains
`[-4, 0, 7, -2, 7, 0]`; `demo_length` holds 6. `main` loads their address/count,
calls `analyze_array`, and writes `demo_results`. Expected results:
`[-4, 7, 8, 2, 2, 2]`. Output printing is optional; GDB can inspect the buffer.

## Work and checks

Start with `classify_value`, then `update_min_max`, then the array loop and
`main`. Run `make test GROUP=classify`, `GROUP=minmax`, `GROUP=analyze`,
or `GROUP=main`, followed by `make test` for the full suite.
See [grading](docs/grading.md): 80 automated points and 20 manual points.
The recommended instruction subset is advisory. Meaningful helper calls,
correct interfaces, and stack/register discipline are required.
