class Menu

  def main_menu
    `clear`
    valid_command = false 

    puts "****************************************\n
          *                                      *\n
          *              MASTERMIND              *\n
          *                                      *\n
          ****************************************\n"
    puts "\n\n"
    puts "(P)lay Game               (I)nstructions" 
    
    unless valid_command do
      input = gets
      
      if gets == "P"
        
        gets 
        
      elsif gets == "I"
        print_instructions
      end
    end 
  end
  end
  
  def print_instructions
    `clear`

    puts "Instructions:"

    puts "(1) Mastermind has two players: the Codemaker and the Codebreaker"
    puts "(2) The Codemaker makes a combination of four colors that are placed\n
              in an order of their choosing. This combination is hidden from\n
              the Codebreaker."
    puts "(3) The Codebreaker must then figure out what the colors are and in\n
              what order."
    puts "(4) Each time the Codebreaker guesses a combination, clues are provided\n
              about the accuracy of the prediction" 
    puts "(5) If the Codebreaker guesses the correct color in the correct place,\n
              a red peg is provided."
    puts "(6) If the Codebreaker guesses a correct color, but in an incorrect \n
              place, a white peg is provided."
    puts "(7) The Codebreaker has 12 chances to deduce the code"
    puts "\nPress enter to continue"
    gets
  end

  def print_choice
    `clear`
    puts "Play as (1)Codebreaker or (2)Codemaker?"
    input = gets
    
    if input == "1" || input == "2"
      input == 1 ? "Codebreaker" : "Codemaker"
    else 
      return print_choices 
  end
end
