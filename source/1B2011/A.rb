#!/usr/bin/env ruby

@f = File.open ARGV[0]
N = @f.gets.strip.to_i
@out = File.open(ARGV[0][0..-3]+"out", "w")


for case_number in 1..N
  @s = @f.gets.strip.to_i
  team = []
  for i in 1..@s
    team.push @f.gets.strip.chars.map{ |e| e=='.' ? nil : e.to_i }
  end
  
  wins = team.map{ |w| w.select{ |e| e == 1 }.count }
  
  plays = team.map{ |w| w.select{ |e| !e.nil? }.count }
  
  wp = []
  for i in 1..@s
    wp.push (wins[i-1].to_f / plays[i-1].to_f)
  end
  
  owp = []
  
  
  
  for i in 0..(@s-1)
    tmp=[]
    for j in 0..(@s-1)
      next if( i==j or team[j][i] == nil)
      if team[j][i] == 1
        tmp.push ([wins[j]-1,0].max.to_f)/(plays[j]-1)
      else
        tmp.push (wins[j].to_f)/(plays[j]-1)
      end
    end
    owp.push (tmp.reduce{ |x,y| x+y }.to_f / tmp.count)
  end
  
  
  oowp=[]
  for i in 0..(@s-1)
    tmp=[]
    for j in 0..(@s-1)
      next if( i==j or team[j][i] == nil)
      tmp.push owp[j]
    end
    oowp.push (tmp.reduce{ |x,y| x+y }.to_f / tmp.count)
  end

  @out.puts "Case #%i:" % [case_number]
  for i in 1..@s
    @out.puts "%0.8f" % (0.25*wp[i-1] + 0.5*owp[i-1] + 0.25*oowp[i-1])
  end
  
end
