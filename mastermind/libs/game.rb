require_relative 'modules/colors'
require_relative 'player'
require_relative 'computer'
require_relative 'round'
require 'pry-byebug'
# Class to contain game logic
class Game
  include Colors

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def game_over_screen
    puts 'you cracked the code'
    puts 'play again[y/n]'
    @answer = gets.chomp.downcase
    puts 'play again[y/n]' until @answer == 'y' || @answer == 'n'
    puts 'thanks for playing' if @answer == 'n'
    play_game if @answer == 'y'
  end

  def play_game
    @round = Round.new
    @computer.create_new_color_code
    puts @computer.color_code
    until @round.round_no == 10 || @round.game_over == true
      @round.play_round(@computer.color_code)
      @round.round_no += 1
    end
    game_over_screen if @round.game_over == true
  end
end
