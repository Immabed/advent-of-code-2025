#!/usr/bin/env ruby

# Advent of Code 2025 Day 6 Part 1
# Author: Immabed
# Date: December 6, 2025

equations = []
File.foreach('input') {|line|
  line.split.each_with_index do |n, i| 
    if equations[i].nil?
      equations[i] = []
    end
    if n == '+' or n == '*' 
      equations[i].push(n) 
    else 
      equations[i].push(n.to_i) 
    end
  end
}

sum = 0

equations.each do |equation|
  if equation[-1] == '+'
    sum += equation[0] + equation[1] + equation[2] + equation[3]
  elsif equation[-1] == '*'
    sum += equation[0] * equation[1] * equation[2] * equation[3]
  end
end

puts sum
