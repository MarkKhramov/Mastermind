require_relative 'menu'
require 'colorize'
computer =[1,6,1,3] 
  #[rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
def provide_color_ball(colorString)
  colorString = colorString.split('').to_a  
  
  return colorString.map do |color|
    case color.downcase
    when "r"
      "  ".red
    when "y"
      "  ".yellow
    when "b" 
      "  ".blue
    when "w"
      "  ".white  
    when "o"
      "  ".orange
    when "g"
      "  ".green
    end
  end
end

def provide_clue(computer, play)
  clue = ""
  checked_spots = []

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
        end
      end

      puts "checked_spots " + checked_spots.to_s
    end
  end
 
  return randomize_clue(clue) 
end

def computer_color
  
  valid_colors = ["r", "y", "b", "w", "o", "g"] 

  return [valid_colors[rand[1..6]], valid_colors[rand[1..6]], valid_colors[rand[1..6]], valid_colors[rand[1..6]]]
end

private 
def randomize_clue(clues)
  clues = clues.split(" ").to_a

  clues.length.times do 
    idx1 = rand(0..clues.length - 1)
    idx2 = rand(0..clues.length - 1) 
    temp = clues[idx1]
    clues[idx1] = clues[idx2]
    clues[idx2] = clues[idx1]
  end 
  
  return clues.to_s
end

def colors_valid?(color_string)
  color_string = color_string.split('').to_a
  valid_colors = ["r", "y", "b", "w", "o", "g"] 

  return color_string.all? {|color| valid_colors.include?(color)}
end


while(true)
  m = Menu.new()
  m.main_menu()
  
  puts computer.to_s
  puts "Please enter a guess: "
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
