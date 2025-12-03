#!/usr/bin/env python3

# Advent of Code 2025 Day 2 Part 1
# Author: Immabed
# Date: December 2, 2025

filename = "input"

with open(filename, encoding="utf-8") as file:
    ranges = file.read().rstrip().split(",")

IDsum = 0

for IDRange in ranges:
    start, end = IDRange.split('-')
    if (len(start) == len(end) and len(end) % 2 == 1): continue #ignore ranges with only odd lengths
    for i in range(int(start), int(end) + 1):
        ID = str(i)
        half = len(ID) // 2
        if (ID[:half] == ID[half:]):
            IDsum = IDsum + i

print(IDsum)
