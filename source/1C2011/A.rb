#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")


for case_number in 1..N
  @r, @c = @f.gets.strip.split(' ').map{ |e| e.to_i }
  
 
  
  tiles = []
  for i in 1..@r
    tiles.push @f.gets.strip.chars.map { |e| e.to_s }
  end
  
  puts tiles.to_s
  
  @out.puts "Case #%i:" % [case_number]
  
  begin
    
    for i in 0..(@r-1)
      for j in 0..(@c-1)
        if tiles[i][j] == '#'
          if tiles[i][j+1] == '#' and tiles[i+1][j] == "#" and tiles[i+1][j+1]=="#"
            tiles[i][j] = "/"
            tiles[i][j+1] = "\\"
            tiles[i+1][j] = "\\"
            tiles[i+1][j+1] = "/"
          else
            raise "error"
          end
        end
      end
    end
    
    tiles.each do |t|
      @out.puts t.join('')
    end
    
  rescue Exception => e
    @out.puts "Impossible"
  end
  
  
  
end
