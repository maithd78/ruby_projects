# Create Game method to start game, initialize an array to contain the colors for the game for player and computer
# init the array of available color and guesses
# create new method to get whether the player chooses the colors or if the computer chooses the colours
# skip 2 for now
# let computer choose colours from an array of colors do this in the computer class
# store this info in the computer class
# create round loop in game.rb
# until round == 0 do ?
# let the player guess 4 colors one after the other and then confirm the choices at the end
# do this in player
# at the end of that loop send the info to the array containing colors for player in game and check if any matches are
# found in computer.
# then if there are matches print if colors right or locations right.
require_relative 'libs/game'

# computer = Computer.new
# computer.next_possible_guess
# player = Player.new
# player.player_create_color_code
# p player.player_code_digits

# game = Game.new
# game.play_game

# computer = Computer.new

# computer.play_game('1122', '1236')

# round = 1

# until round == 10 || computer.code_cracked == true
#   puts "round no #{round}"
#   # computer.play_guess(round)
#   round += 1
# end

game = Game.new
game.play_game
