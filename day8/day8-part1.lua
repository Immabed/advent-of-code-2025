-- Advent of Code 2025 Day 8 Part 1
-- Author: Immabed
-- Date: December 14, 2025

-- Appends elements of a2 to a1, does not modify a2
function concatArrays(a1, a2)
   for _, v in ipairs(a2) do
       a1[#a1 + 1] = v
   end
   return
end

-- Returns new array, copy of incoming but with no nil's
function cleanNil(tab) 
    local arr = {}
    for _,v in pairs(tab) do
        arr[#arr+1] = v
    end
    return arr
end

function hasValue(tab, val)
    for i, value in ipairs(tab) do
        if val == value then
            return true
        end
    end
    return false
end

function sortDistances(d1, d2)
    return d1[1] < d2[1]
end

function sortCircuits(c1, c2)
    return #c1 < #c2
end

function euclideanDistance(a, b)
    local distance = math.sqrt((a[1]-b[1])^2 + (a[2]-b[2])^2 + (a[3]-b[3])^2)
    return distance
end

-- Begin Program

local f = io.open('input')
local jBoxes = {} 
for line in f:lines() do
    jBoxes[#jBoxes + 1] = {}
    for coord in string.gmatch(line, "([^,]+)") do
        jBoxes[#jBoxes][#(jBoxes[#jBoxes]) + 1] = tonumber(coord)
    end
end

-- array of tuples with values (distance, index 1, index 2)
local distances = {}
for i, box1 in ipairs(jBoxes) do
    for j, box2 in ipairs({table.unpack(jBoxes, i+1, #jBoxes)}) do
        distances[#distances + 1] = {euclideanDistance(box1, box2), i, i+j}
    end
end

-- sort jBox distances
table.sort(distances, sortDistances)

local circuits = {}
for i, distance in ipairs({table.unpack(distances, 1, 1000)}) do
    local jBox1 = 0
    local jBox2 = 0
    for j, circuit in ipairs(circuits) do
        if hasValue(circuit, distance[2]) then
            jBox1 = j
        end
        if hasValue(circuit, distance[3]) then
            jBox2 = j
        end
    end
    if jBox1 == 0 and jBox2 == 0 then
        circuits[#circuits + 1] = {distance[2], distance[3]}
    elseif jBox1 == 0 then
        circuits[jBox2][#(circuits[jBox2]) + 1] = distance[2]
    elseif jBox2 == 0 then
        circuits[jBox1][#(circuits[jBox1]) + 1] = distance[3]
    elseif jBox1 ~= jBox2 then -- Merge two circuits
        concatArrays(circuits[jBox1], circuits[jBox2])
        circuits[jBox2] = nil
        circuits = cleanNil(circuits)
    end
end

table.sort(circuits, sortCircuits)

local product = 1
for i,circuit in ipairs({table.unpack(circuits, #circuits-2, #circuits)}) do
    product = product * #circuit
end

print(product)

