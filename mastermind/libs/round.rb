require_relative 'modules/colors'
require_relative 'modules/hints'
# Class to contain round logic
class Round
  include Colors
  include Hints

  attr_accessor :round_no
  attr_reader :player_code, :game_over

  def initialize
    @round_no = 0
    @game_over = false
  end

  def code_cracked?(code_breaker, secret_code)
    code_breaker == secret_code
  end

  def play_round_computer(computer, secret_code)
    puts "ROUND #{@round_no}"
    @guess = computer.next_possible_guess(@round_no)
    p @guess

    round_end_hints(@guess, secret_code)
    puts "Black: #{@hints[:B]}, White: #{@hints[:W]}"
    @game_over = true if code_cracked?(@guess, secret_code)

    computer.possible_solutions(@guess, @hints) unless @game_over == true
  end

  def play_round(code_breaker, secret_code)
    puts "ROUND #{@round_no}"
    code_breaker.player_input
    round_end_hints(code_breaker.player_code, secret_code)
    puts "Black: #{@hints[:B]}, White: #{@hints[:W]}"
    @game_over = true if code_cracked?(code_breaker.player_code, secret_code)
  end
end
