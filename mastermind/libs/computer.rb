require_relative 'modules/colors'
# Class to contain Computer logic
class Computer
  include Colors

  attr_reader :color_code

  def create_new_color_code
    create_color_code
  end

  def guess_player_colorcode
    @guesses = []
    @guesses.size.push(list_of_colors.sample) until @guesses.size == 4
  end
end
