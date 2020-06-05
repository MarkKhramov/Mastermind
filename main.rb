require_relative 'menu'
require_relative 'mastermind_game'

m = Menu.new()
game = MastermindGame.new()

m.main_menu == "Codebreaker" ? game.play_as_codebreaker : game.play_as_codemaker 
