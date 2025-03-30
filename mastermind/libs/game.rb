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

  def end_game_screen
    puts "The code was #{@player.player_code}"
    puts "You cracked the code in #{@round.round_no} round(s)"
  end

  def play_game
    @round = Round.new
    @computer.create_color_code
    p @computer.color_code
    until @round.round_no == 10 || @round.game_over
      @round.round_no += 1
      @round.play_round(@player, @computer.color_code)
    end
    end_game_screen if @round.game_over
  end
end
