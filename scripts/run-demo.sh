#!/usr/bin/env bash
set -euo pipefail

values=$("$@" | od -An -v -td8)
read -r sum positive_count <<< "$values"
printf '%-15s %20s %8s\n' Result Yours Expected
printf '%-15s %20s %8s\n' Sum "$sum" 8 'Positive count' "$positive_count" 2
