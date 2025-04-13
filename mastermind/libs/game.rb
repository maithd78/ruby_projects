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
    @code_maker = nil

    # @computer.convert_to_colors

    code_maker?
  end

  def code_maker?
    puts 'Would you like to create a code or guess a code?[guess/create]'
    @code_maker = gets.chomp.downcase until @code_maker == 'guess' || @code_maker == 'create'
  end

  def end_game_computer_won
    puts "The code was #{@player.player_code}"
    puts "The code was cracked in #{@round.round_no} round(s)"
  end

  def end_game_screen
    puts "The code was #{@player.player_code}"
    puts "You cracked the code in #{@round.round_no} round(s)"
  end

  def play_game
    play_game_guess_code if @code_maker == 'guess'
    play_game_create_code if @code_maker == 'create'
  end

  def play_game_create_code
    @round = Round.new
    @player.player_create_color_code
    until @round.round_no == 10 || @round.game_over
      @round.round_no += 1
      @round.play_round_computer(@computer, @player.secret_code)
    end
    end_game_computer_won if @round.game_over
  end

  def play_game_guess_code
    @round = Round.new
    @computer.create_color_code
    until @round.round_no == 10 || @round.game_over
      @round.round_no += 1
      @round.play_round(@player, @computer.color_code)
    end
    end_game_screen if @round.game_over
  end
end
