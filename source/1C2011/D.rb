#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")


for case_number in 1..N
  @l = @f.gets.strip.to_i
  
  @out.puts "Case #%i:" % [case_number]
  
end
