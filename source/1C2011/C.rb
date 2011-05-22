#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")

for case_number in 1..N
  @n, @l, @h = @f.gets.strip.split(' ').map { |e| e.to_i }
  @freq = @f.gets.strip.split(' ').map { |e| e.to_i }
  
  @freq.sort!
  
  for j in 0..(@n-1)
    
    ppcm = @freq[0..j].reduce{ |x,y| (x*y)/(x.gcd y) }
    pgcd = @freq[(j+1)..@n].reduce{ |x,y| x.gcd y }
    
    pgcd = pgcd ? pgcd : ppcm
    
    #puts "ppcm : %i pcgd : %i" % [ppcm, pgcd]
    
    r = ppcm * (@l/ppcm + 1)
    while r < @h
      
      if pgcd % r == 0
        break
      end
      
      r+=ppcm
    end
    
    if pgcd % r == 0
      break
    end
    
  end
  
  if @l <= r and r <= @h
    @out.puts "Case #%i: %i" % [case_number, [
                r,
                @freq.reduce{ |x,y| x.gcd y },
                @freq.reduce{ |x,y| (x*y)/(x.gcd y) }
              ].select{ |e| e<=@h and e>=@l }.min]
  else
    puts "NO"
    @out.puts "Case #%i: NO" % [case_number]
  end
  
  
end
