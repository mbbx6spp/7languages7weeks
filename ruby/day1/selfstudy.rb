#!/usr/bin/env ruby

# Woot woot - thinking like a n000b

puts "Hello, world."
# but I could also do:
puts ".dlrow ,olleH".reverse
# or even 
["H", "e", "l", "l", "o", ",", " ", "w", "o", "r", "l", "d", "."].each do |c|
  print c
end
puts

s = "Hello, Ruby."
index = s.index("Ruby")
puts "The index of the word 'Ruby' is: #{index}"

10.times { puts "Susan Potter sucks, but not as much as Tony Blair!" }

(1..10).each do |i|
  puts "This is sentence number #{i}"
end

# Run a Ruby program from a file...
puts "To run a Ruby program from a file do: ruby <filename>"

# see spec examples for rest from now on.
