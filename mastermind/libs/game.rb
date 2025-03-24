require_relative 'computer'
require_relative 'modules/colors'

# Game logic class
class Game
  include Colors

  def initialize
  end

  def computer_is_codemaker
    @codemaker = Computer.new
    @codemaker.assign_colors_for_round
  end
end
