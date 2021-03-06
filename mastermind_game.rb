class MastermindGame
	require 'colorize'
	require 'pry'


	@board = Array.new() 

	public
	def initialize
	  @board = []
	end

	def play_as_codebreaker
	  puts `clear`
	  guesses = 0
	  computer = computer_color.join("") 
	  input = nil

	  while guesses < 12 
	    print_available_colors
	    print "Please enter an input: "
	    input = gets

	    if colors_valid?(input) && input.chomp.length == 4
	      guesses += 1
	      print_screen(input,provide_clue(computer, input)) 
	    else
	      puts "Invalid input! Please try again"
	    end
	    
	   break if computer == input.chomp.split('').to_a
	  end
	   
	  puts computer == input.chomp.split('').to_a ? "You Win!" : "You Lose!"
	end

	
	def play_as_codemaker
	  puts `clear`
	  user_colors = ""

	  loop do
	    print_available_colors
	    print "Please enter a sequence of colors: "
	    user_colors = gets
	    break if colors_valid?(user_colors)
	    puts "Invalid Input! Please enter a valid input"
	  end
	  
	  guesses = 0 
	  while guesses < 12
	    puts "Thinking"
	    sleep(2)
	    computer = computer_color.join("")
	    print_screen(computer, provide_clue(user_colors, computer)) 
	    guesses+=1
	    break if computer == user_colors.chomp.split('').to_a
	  end

	  puts computer == user_colors.chomp.split('').to_a ? "You Lose!" : "You Win!"
	end

	private
	def provide_color_ball(colorString)
	  colorString = colorString.chomp.split("").to_a  
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

	def provide_clue(codemaker, play)
	  clue = ""
	  checked_spots = []
	  codemaker = codemaker.chomp.split('').to_a
	  play = play.chomp.split('').to_a
	  codemaker.each.with_index do |color, idx|
	    # Checks the player array at index to find out if it is the
	    # same as the element in the codemaker array at that index.
	    # Adds the index to checked_spot and adds " red " if so.
	    if play[idx] == color 
	      clue += "red "
	      checked_spots.push(idx)
	    # Checks if the color at idx in codemaker is found else where
	    # in the player array. If so, it checks if that element was
	    # already counted. If not, adds " white " and counts that index 
	    elsif play.include?(color)
	      play.each.with_index do |c, idx|  
		if c == color && checked_spots.include?(idx) == false && codemaker[idx] != c
		  checked_spots.push(idx)
		  clue += "white "
		  break
		end
	      end
	    end
	  end
	  return randomize_clue(clue) 
	end

	#returns random colors for the computer when it is the codemaker (or codebreaker if lazy)
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
	    clues[idx2] = temp 
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

	def print_available_colors
          puts "Valid Colors: " + "r ".black.on_red  + "y ".black.on_yellow  + "b ".black.on_blue + "w ".black.on_white  + "c ".black.on_cyan  + "g ".black.on_green  
        end

end
