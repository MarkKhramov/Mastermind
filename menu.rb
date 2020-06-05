class Menu

  def initialize()
  end

  def main_menu
    while true

    puts `clear`

    puts "****************************************\n
          *                                      *\n
          *              MASTERMIND              *\n
          *                                      *\n
          ****************************************\n".lines.map{ |line| line.strip.center(150) }.join("\n")
    puts "\n\n"
    puts "(P)lay Game               (I)nstructions".strip.center(150) 
    
    input = gets.chomp
    if input.upcase== 'P'
      return print_choices 
    elsif input.upcase == 'I'
      print_instructions()
    end
  
    end 
  end
  
  
  def print_instructions
    puts `clear`

    puts "Instructions:"

    puts "(1) Mastermind has two players: the Codemaker and the Codebreaker".strip.center(150)
    puts "(2) The Codemaker makes a combination of four colors that are placed\n".strip.center(150)
    puts "in an order of their choosing. This combination is hidden from\n".strip.center(150)
    puts "the Codebreaker.".strip.center(150)
    puts "(3) The Codebreaker must then figure out what the colors are and in\n".strip.center(150)
    puts     "what order.".strip.center(150)
    puts "(4) Each time the Codebreaker guesses a combination, clues are provided\n".strip.center(150)
    puts "about the accuracy of the prediction".strip.center(150) 
    puts "(5) If the Codebreaker guesses the correct color in the correct place,\n".strip.center(150)
    puts "a red peg is provided.".strip.center(150)
    puts "(6) If the Codebreaker guesses a correct color, but in an incorrect \n".strip.center(150)
    puts "place, a white peg is provided.".strip.center(150)
    puts "(7) The Codebreaker has 12 chances to deduce the code".strip.center(150)
    puts "\nPress enter to continue".strip.center(150)
    gets
    return nil
  end

  def print_choices
    puts `clear`
    puts "Play as (1)Codebreaker or (2)Codemaker?"
    input = gets.chomp
    
    if input == "1" || input == "2"
      input =="1" ? "Codebreaker" : "Codemaker"
    else 
      return print_choices 
    end
  end
end
