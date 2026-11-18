# Optional · Inspect registers and memory in GDB

`make run` is enough to see the lab's results. If you want to step through
your code as in the simulator, open two terminals in your Codespace.

1. In the first terminal, run `make debug`.
2. In the second terminal, run `make gdb`. At the `(gdb)` prompt, enter
   `continue` to stop at the first instruction of `analyze_array`.
3. Use `info registers x0 x1 x2 x3 x4 x5` for the register view and
   `x/6dg $x0` to see the six signed integers at the input address on entry.
4. Enter `set $results = $x2` to save the output address for inspection.
   Use `si` to step one instruction at a time. After the stores, use
   `x/2dg $results` to see the sum and count. To stop just after the return
   from inside the procedure, use `tbreak *$x30` and then `continue`.
5. Enter `quit` when you're done. Rebuild and start both commands again
   after changing the source.
