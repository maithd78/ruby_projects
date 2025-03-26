# Class to contain round logic
class Round
  attr_accessor :round_no
  attr_reader :game_over

  def initialize
    @round_no = 1
    @game_over = false
  end

  def compare_round_results(code)
    @checked_colors = []
    @round_guesses.each_with_index do |v, i|
      @hints.push('black peg') && @checked_colors.push(v) if v == code[i] && i == 0 + i
      @hints.push('white peg') if code.include?(v) && @checked_colors.none?(v)
    end
    puts @hints.sort
    puts 'try again'
  end

  def compare_round_results_win(code)
    @game_over = true if @round_guesses == code
  end

  def play_round(code)
    @hints = []
    @round_guesses = []
    until @round_guesses.size == 4
      puts "what is the color in peg##{@round_guesses.size + 1}"
      @round_guesses.push(gets.chomp)
    end
    compare_round_results(code) unless compare_round_results_win(code)
  end
end
