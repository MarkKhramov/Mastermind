require_relative 'menu'
require 'pry'
require 'colorize'

def provide_color_ball(colorString)
  colorString = colorString.split('').to_a  
  
  return colorString.map do |color|
    case color.downcase
    when "r"
       "  ".on_red + " "
    when "y"
       "  ".on_yellow + " "
    when "b" 
       "  ".on_blue + " "
    when "w"
       "  ".on_white + " "  
    when "c"
       "  ".on_cyan + " "
    when "g"
       "  ".on_green+ " "
    end
  end
end

def provide_pegs(clues)
  return clues.map do |clue|
    case clue
    when "white"
      "o".white
    when "red"
      "o".red
    end
  end 
   
end

def provide_clue(computer, play)
  clue = ""
  checked_spots = []
  computer = computer.chomp.split('').to_a
  
  play = play.chomp.split('').to_a
  computer.each.with_index do |color, idx|
    # Checks the player array at index to find out if it is the
    # same as the element in the computer array at that index.
    # Adds the index to checked_spot and adds " red " if so.
    if play[idx] == color 
      clue += "red "
      checked_spots.push(idx)
    # Checks if the color at idx in computer is found else where
    # in the player array. If so, it checks if that element was
    # already counted. If not, adds " white " and counts that index 
    elsif play.include?(color)
      play.each.with_index do |c, idx|  
        if c == color && checked_spots.include?(idx) == false
          checked_spots.push(idx)
          clue += "white "
          break
        end
      end
    end
  end
  return randomize_clue(clue) 
end

def computer_color
  valid_colors = ["r", "y", "b", "w", "c", "g"] 
  return [valid_colors[rand(0..5)],valid_colors[rand(0..5)], valid_colors[rand(0..5)], valid_colors[rand(0..5)]]
end

def randomize_clue(clues)
  clues = clues.chomp.split(" ").to_a
 
  clues.length.times do 
    idx1 = rand(0..clues.length - 1)
    idx2 = rand(0..clues.length - 1) 
    temp = clues[idx1]
    clues[idx1] = clues[idx2]
    clues[idx2] = clues[idx1]
  end 
  
  return clues
end

def colors_valid?(color_string)
  color_string = color_string.chomp.split('').to_a
  valid_colors = ["r", "y", "b", "w", "c", "g"] 

  return color_string.all? {|color| valid_colors.include?(color)}
end

def print_screen(new_balls = nil, new_pegs = nil)
  puts `clear`
  
  if new_balls != nil
    @board.push(provide_color_ball(new_balls) + provide_pegs(new_pegs))
  end
  @board.each do |line| 
    puts line.join(" ")
    puts " "  
  end
  
end

def play_as_codebreaker
  puts `clear`
  guesses = 0
  computer = computer_color.join("") 
  input = nil

  while guesses < 12 
    print "Please enter an input: "
    input = gets

    if colors_valid?(input) && input.chomp.length == 4
      guesses += 1
      print_screen(input,provide_clue(computer, input)) 
    else
      puts "Invalid input! Please try again"
    end
    puts computer
    
    if computer == input.chomp.split.to_a
     break
    end 
  end
   
  if computer == input.chomp.split.to_a
    puts "You Win, congrats!"
  else
    puts "You lose!"
  end
end

def play_as_codemaker
  puts `clear`

end
