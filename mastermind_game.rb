require 'pry'
computer =[1,6,1,3] 
  #[rand(1..6), rand(1..6), rand(1..6), rand(1..6)]

def provide_clue(computer, play)
  clue = ""
  checked_spots = []

  computer.each.with_index do |color, idx|
    # Checks the player array at index to find out if it is the
    # same as the element in the computer array at that index.
    # Adds the index to checked_spot and adds " red " if so.
    if play[idx] == color 
      clue += " red "
      checked_spots.push(idx)
    # Checks if the color at idx in computer is found else where
    # in the player array. If so, it checks if that element was
    # already counted. If not, adds " white " and counts that index 
    elsif play.include?(color)
      play.each.with_index do |c, idx|  
        if c == color && checked_spots.include?(idx) == false
          checked_spots.push(idx)
          clue += " white "
        end
      end

      puts "checked_spots " + checked_spots.to_s
    end
  end
 
  return clue
end

while(true)
  puts computer.to_s
  print "please enter a guess: "
  play = gets.chomp
  play = play.split("").to_a
  play = play.map { |x| x.to_i }
  if play == computer
    puts "correct"
  else
    puts "wrong"
    puts provide_clue(computer,play)
  end
end
