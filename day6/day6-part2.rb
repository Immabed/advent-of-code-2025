#!/usr/bin/env ruby

# Advent of Code 2025 Day 6 Part 2
# Author: Immabed
# Date: December 6, 2025

def parseOperand(digitArray) 
  operand = 0
  digitArray.each do |digit|
    next if digit == ' '
    operand = 10 * operand + digit
  end
  return operand
end

def mul(operands)
  product = 1
  operands.each { |n| product *= n }
  return product
end

def add(operands)
  sum = 0
  operands.each { |n| sum += n }
  return sum
end


equations = []

File.foreach('input') {|line|
  line.split('').each_with_index do |n, i| 
    next if n == "\n"
    if equations[i].nil?
      equations[i] = []
    end
    if n == '+' or n == '*' or n == ' '
      equations[i].push(n) 
    else 
      equations[i].push(n.to_i) 
    end
  end
}

sum = 0

equations.each_with_index do |equation, i|
  next if equation[-1] == ' '
  operands = []
  operands.push(parseOperand(equation[..-2]))
  k = 1
  while i + k < equations.length and (equations[i+k+1].nil? or equations[i+k+1][-1] == ' ')
    operands.push(parseOperand(equations[i+k][..-2]))
    k = k + 1
  end
  if equation[-1] == '*'
    sum += mul(operands)
  elsif equation[-1] == '+'
    sum += add(operands)
  end
end

  

puts sum
