# Lab 1 grading

`make test` runs nine public cases. The starter passes the empty and all-zero
cases because it already stores zeros. The completed loop should pass all nine.
Tests check both output slots, selected memory guards, and that the input is
unchanged in the array cases. They also check that the procedure returns with
preserved registers intact. The starter's register choices handle this for you.

Each test has equal weight toward **80 automated points**, rounded down at
the end. The remaining **20 manual points** use this rubric.

| Criterion | Points |
| --- | --- |
| One loop visits each element once and computes both results | 10 |
| Register roles, labels, and comments make the loop easy to follow | 10 |

GitHub Actions runs the same tests on pushes and pull requests. The job summary
and `grading-results` artifact include the score and case results. Locally,
use `build/grade.md` or `build/grade.json`.

## Instructor setup

Use the supplied Codespace environment to try `make run` and `make test`
before distributing the starter. For final grading, run the instructor kit's
`grade-submission.sh` with the matching trusted Lab 1 starter. It builds the
submitted assembly with the instructor's build files and tests. Use a
disposable runner for student submissions and keep the instructor kit private.
