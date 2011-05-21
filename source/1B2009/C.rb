#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")

D = [[-1,0],[1,0],[0,-1],[0,1]]

for case_number in 1..N
  w, q = @f.gets.strip.split(' ').map { |e| e.to_i }
  square = Array.new
  
  states = []
  
  for i in 1..w
    line = Array.new
    str = @f.gets.strip
    for j in 1..w
      if str[j-1] == "+" or str[j-1] == "-"
        line.push str[j-1]
      else
        line.push str[j-1].to_i
        states.push({:i=>i,:j=>j,:value=>str[j-1].to_i,:s=>str[j-1]})
      end
    end
    square.push(line)
  end
  
  queries = @f.gets.strip.map { |e| e.to_i }
  
  for q in queries
    these = states.clone
    c = states.slice! 0
    while c[:value]!=q
      for ope_pos in D
        x = c[:x]+ope_pos[0]
        y = c[:y]+ope_pos[1]
        if x >=0 and x<w and y>=0 and y<w
          for k_pos in D
            x = c[:x]+ope_pos[0]+k_pos[0]
            y = c[:y]+ope_pos[1]+k_pos[1]
            if x >=0 and x<w and y>=0 and y<w
              ns = {:i=>x,:j=>y}
              if square[ope_pos[0],ope_pos[1]] == "+"
            end
          end
        end
      end
    end
  end
  
  @out.puts "Case #%i: " % [case_number]




end


