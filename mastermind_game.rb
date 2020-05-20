computer = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]

while(true)
  print "please enter a guess"
  if gets.split('') == computer
    puts "correct"
  else
    puts "wrong"
  end
end
