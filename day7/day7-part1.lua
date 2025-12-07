-- Advent of Code 2025 Day 7 Part 1
-- Author: Immabed
-- Date: December 7, 2025

local f = io.open('input')
local schematic = {}
for line in f:lines() do
    schematic[#schematic + 1] = {}
    for char in string.gmatch(line, ".") do
        schematic[#schematic][#(schematic[#schematic]) + 1] = char
    end
end

local splitCount = 0

for i, line in ipairs(schematic) do
    if i ~= 1 then
        for j, sym in ipairs(line) do
            if schematic[i-1][j] == "|" or schematic[i-1][j] == "S" then
                if sym == "." then
                    schematic[i][j] = "|"
                elseif sym == "^" then
                    schematic[i][j-1] = "|"
                    schematic[i][j+1] = "|"
                    splitCount = splitCount + 1
                end
            end
        end
    end
end

-- print schematic
for _, data in ipairs(schematic) do
    for _, value in ipairs(data) do
        io.write(value)
    end
    io.write('\n')
end

print("Split Count", splitCount)
