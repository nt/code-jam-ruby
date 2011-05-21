#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")


for case_number in 1..N
  l = @f.gets.strip
  base_map = l.chars.map { |e| e }.uniq
  
  map = {}
  map[base_map[0]]="1"
  map[base_map[1]]="0"
  for i in 2..base_map.length
    map[base_map[i]]=i.to_s
  end
  
  @out.puts "Case #%i: %i" % [case_number, l.chars.map { |e| map[e] }.join('').to_i([base_map.length, 2].max)]
  
end
