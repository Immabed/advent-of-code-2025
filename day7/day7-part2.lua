-- Advent of Code 2025 Day 7 Part 2
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

for i, line in ipairs(schematic) do
    if i ~= 1 then
        for j, sym in ipairs(line) do
            if type(schematic[i-1][j]) == "number" then
                if sym == "^" then
                    schematic[i][j-1] = (type(schematic[i][j-1]) == "number" and schematic[i][j-1] or 0) + schematic[i-1][j]
                    schematic[i][j+1] = (type(schematic[i][j+1]) == "number" and schematic[i][j+1] or 0) + schematic[i-1][j]
                else 
                    schematic[i][j] = (type(schematic[i][j]) == "number" and schematic[i][j] or 0) + schematic[i-1][j]
                end
            elseif schematic[i-1][j] == "S" then
                schematic[i][j] = 1
            end
        end
    end
end

worldCount = 0
for _, sym in ipairs(schematic[#schematic]) do
    if type(sym) == "number" then
        worldCount = worldCount + sym
    end
end

print("World Count", worldCount)
