#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")


for case_number in 1..N
  @c, @d = @f.gets.strip.split(' ').map{ |e| e.to_i }
  p = []
  c = []
  for i in 0..(@c-1)
    p[i], c[i] = @f.gets.strip.split(' ').map{ |e| e.to_i }
  end
  
  
  
  
  @out.puts "Case #%i:" % [case_number]
  
end
