#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")

def parse_tree()
  current = {}
  i = @f.gets.strip
  if i[-1] == ")"
    current[:weight] = i[1..-2].to_f
  else
    i = i[1..-1].strip.split(' ')
    current[:weight] = i[0].to_f
    current[:feature] = i[1]
    current[:yes] = parse_tree
    current[:no] = parse_tree
    @f.gets
  end

  #puts current
  return current
end

def cute?(tree)
  if tree[:feature]
    if @features.member? tree[:feature]
      return tree[:weight] * cute?(tree[:yes])
    else
      return tree[:weight] * cute?(tree[:no])
    end
  else
    return tree[:weight]
  end
end

for case_number in 1..N
  @l = @f.gets.strip.to_i
  tree = parse_tree
  #puts tree
  @out.puts "Case #%i:" % case_number
  
  a = @f.gets.strip.to_i
  a.times do
    @features = @f.gets.strip.split(' ')[2..-1]
    @out.puts "%.7f" % cute?(tree)
  end
  

end
