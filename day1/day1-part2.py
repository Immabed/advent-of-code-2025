#!/usr/bin/env python3

# Advent of Code 2025 Day 1 Part 2
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
    rotation = direction * distance
    # take distance plus starting position to determine passes by 0
    # for counterclockwise rotation, invert starting position (100-pos) and normalize so that
    # a position of 0 doesn't give a start of 100.
    dialPosNoMod = dialPos + rotation if direction == 1 else (100 - dialPos) % 100 - rotation
    zeroPasses = dialPosNoMod // 100

    dialPos = (dialPos + rotation) % 100
    zeroCount = zeroCount + zeroPasses

print(zeroCount)
