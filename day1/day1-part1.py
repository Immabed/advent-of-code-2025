#!/usr/bin/env python3

# Advent of Code 2025 Day 1 Part 1
# Author: Immabed
# Date: December 2, 2025

filename = "input"

with open(filename, encoding="utf-8") as file:
    lines = [line.rstrip() for line in file]
    
zeroCount = 0
dialPos = 50

for line in lines:
    direction, distance = line[:1], line[1:]
    direction = 1 if direction == "R" else -1
    distance = int(distance)
    dialPos = (dialPos + direction * distance) % 100
    if (dialPos == 0):
        zeroCount = zeroCount + 1

print(zeroCount)
