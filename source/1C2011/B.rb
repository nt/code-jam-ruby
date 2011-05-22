#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")


def d(i)
  @a[i % @k]
end

for case_number in 1..N
  v = @f.gets.strip.split(' ').map { |e| e.to_i }
  @l, @t, @n, @c = v[0..3]
  @a = v[4..-1]
  
  dist = []
  for i in 0..(@n-1)
    dist.push @a[ i % @c ]
  end
  
  time = 0
  
  
  
  while time < @t and dist.size != 0
    time += dist.first * 2
    dist = dist[1..-1]
    if time > @t
      dist.push((time-@t)/2)
      time = @t
    end
  end
  

  dist.sort!

  while dist.size != 0 and @l > 0
    time += dist.pop
    @l -= 1
    #puts dist.to_s
  end
  
  #puts "boosters off"
  #puts time
  
  time += dist.reduce(0){ |x,y| x + y}*2
  #time += dist.reduce{ |x,y| x+y }
  
  #puts time
  
  @out.puts "Case #%i: %i" % [case_number, time]
  
end
