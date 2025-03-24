require_relative 'modules/colors'

# Store computer information and actions
class Computer
  include Colors

  attr_reader :round_colors

  def assign_colors_for_round
    @round_colors = []
    @round_colors.push(list_of_colors.shuffle.pop) until round_colors.size == 4
  end
end
