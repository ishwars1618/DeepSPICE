#!/bin/bash

file="bool_list.txt"
out="netlists_master.py"

file_list=$(cat "$file")

> "$out"

for f in $file_list; do
	echo "$f" >> "$out"
	outstr=$(sed '2q;d' "$f")
	echo "$outstr" >> "$out"
done

