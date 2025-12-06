#!/usr/bin/env ruby

# Advent of Code 2025 Day 5 Part 1
# Author: Immabed
# Date: December 6, 2025

freshRanges = Hash.new
ingredients = []
File.foreach('input') {|line|
  if line.include? "-"
    range = line.split("-").map {|n| n.to_i }
    next if freshRanges.key?(range[0]) and freshRanges[range[0]] > range[1]
    freshRanges[range[0]] = range[1]
  elsif line.length > 1
    ingredients.push(line.to_i)
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

ingredients.each do |id|
  i = sortedRanges.length / 2
  start = 0
  finish = sortedRanges.length - 1
  next if id < sortedRanges[0]
  if sortedRanges[-1] <= id
    next if freshRanges[sortedRanges[-1]] < id
    i = -1
  else 
    while true
      if id >= sortedRanges[i]
        break if id < sortedRanges[i+1]
        start = i
      else
        finish = i
      end
      i = start + (finish - start) / 2
    end
    next if id > freshRanges[sortedRanges[i]]
  end
  freshCount += 1
end

puts "Fresh Count", freshCount

