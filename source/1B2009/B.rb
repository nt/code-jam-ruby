#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")

def digits(string)
  string.chars.map{ |p| p.to_i }.reject { |e| e == 0 }.sort
end

for case_number in 1..N
  n = @f.gets.strip
  
  number = n.to_i
  digits = digits(n)
  base_map = digits.uniq.push(0).sort
  
  clean = n.chars.map { |e| base_map.index e.to_i }.join("")
  start = clean
  
  clean = clean.to_i(base_map.length)
  clean += 1
  clean = clean.to_s(base_map.length)
  
  while digits(clean) != digits(start)
    clean = clean.to_i(base_map.length)
    clean += 1
    clean = clean.to_s(base_map.length)
  end
  
  @out.puts "Case #%i: %i" % [case_number, clean.chars.map { |e| base_map[e.to_i] }.join('')]

end


