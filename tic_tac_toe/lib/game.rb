require_relative 'display'
require_relative 'player'
require_relative 'round'

# start game with this class
class Game
  def initialize
    @player = [
      Player.new('X'),
      Player.new('O')
    ]
    @game_no = 0
  end

  # starts a round of tic tac toe, a round ends when there are no more choices or there is a winner
  def play_round
    @round = Round.new
    @round.play(@player, @board) while @round.winner.nil? && @round.draw.nil?
    draw_game if @round.draw
    win_game unless @round.winner.nil?
  end

  def draw_game
    @player.each { |p| p.draws += 1 }
    puts 'DRAW'
    end_game
  end

  def win_game
    puts "#{@round.winner.name} WINS"
    @round.winner.wins += 1
    @player.each { |p| p.losses += 1 if p.name != @round.winner.name }
    end_game
  end

  def end_game
    puts 'Enter 1 to start again or 2 to quit'
    input = gets.chomp.to_i
    play_game if input == 1
    display_stats if input == 2
  end

  def display_stats
    puts "Games: #{@game_no}"
    @player.each do |p|
      puts '-' * 9
      puts "Player: #{p.name}"
      puts "wins: #{p.wins}"
      puts "losses: #{p.losses}"
      puts "draws: #{p.draws}"
    end
  end

  def play_game
    @player.each(&:reset_round)
    @board = Display.new
    @game_no += 1
    play_round
  end
end
