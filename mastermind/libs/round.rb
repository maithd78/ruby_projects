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

  def code_cracked?(code_braker, secret_code)
    code_braker == secret_code
  end

  def play_round(code_braker, secret_code)
    puts "ROUND #{@round_no}"
    code_braker.player_input
    round_end_hints(code_braker.player_code, secret_code)
    @game_over = true if code_cracked?(code_braker.player_code, secret_code)
  end
end
