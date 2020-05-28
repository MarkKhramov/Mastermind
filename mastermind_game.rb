require_relative 'menu'
require 'pry'
require 'colorize'

@board = []
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
    case clues
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

      p play
  p computer
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
  valid_colors = ["r", "y", "b", "w", "c", "g"] 
  return [valid_colors[rand(0..5)],valid_colors[rand(0..5)], valid_colors[rand(0..5)], valid_colors[rand(0..5)]]
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
  valid_colors = ["r", "y", "b", "w", "c", "g"] 

  return color_string.all? {|color| valid_colors.include?(color)}
end

def print_screen(new_line = [nil])
  puts `clear`
  @board.each { |line| puts line.join(" ").center(150) } 
end

def play_as_codebreaker()
 valid_input = false
  
  if !valid_input
   puts "Enter an input"
   
end
