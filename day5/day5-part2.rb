#!/usr/bin/env ruby

# Advent of Code 2025 Day 5 Part 2
# Author: Immabed
# Date: December 6, 2025

freshRanges = Hash.new
ingredients = []
File.foreach('input') {|line|
  if line.include? "-"
    range = line.split("-").map {|n| n.to_i }
    next if freshRanges.key?(range[0]) and freshRanges[range[0]] > range[1]
    freshRanges[range[0]] = range[1]
  end
}


sortedRanges = []
freshRanges.keys.sort.each do |rangeStart|
  if sortedRanges.length == 0
    sortedRanges.push(rangeStart)
  else
    next if freshRanges[sortedRanges[-1]] >= freshRanges[rangeStart]
    sortedRanges.push(rangeStart)
  end
end

freshCount = 0

sortedRanges.each_with_index do |rangeStart, i|
  if i + 1 == sortedRanges.length or freshRanges[rangeStart] < sortedRanges[i+1]
    freshCount += freshRanges[rangeStart] - rangeStart + 1
  else
    freshCount += sortedRanges[i+1] - rangeStart
  end
end

puts "Fresh Count", freshCount

