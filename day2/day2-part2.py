#!/usr/bin/env python3

# Advent of Code 2025 Day 2 Part 2
# Author: Immabed
# Date: December 2, 2025

filename = "input"

with open(filename, encoding="utf-8") as file:
    ranges = file.read().rstrip().split(",")

IDsum = 0

for IDRange in ranges:
    start, end = IDRange.split('-')
    for i in range(int(start), int(end) + 1):
        ID = str(i)
        IDLen = len(ID)
        isValid = True
        if (IDLen == 1): continue # Single digit numbers don't work
        for div in range(2,IDLen+1): # All possible divisors are in this list
            if (IDLen % div == 0): # Check if div is a valid divisor
                sublen = IDLen // div # Get the dividend, the length of substring to check
                substring = ID[:sublen] # Get the substring to check for repetition
                testID = substring * div
                if (ID == testID):
                    isValid = False
                    break
        if (not isValid):
            IDsum = IDsum + i

print(IDsum)
