require_relative 'modules/colors'
# Class to contain Player logic
class Player
  include Colors

  def create_code_for_computer
    puts "available colors #{list_of_colors.join(',')}"
    @player_color_code = []
    until @player_color_code.size == 4
      puts "what is the color in peg #{@player_color_code.size + 1}"
      @color = gets.chomp.downcase
      @player_color_code.push(@color) if list_of_colors.any?(@color)
      puts 'invalid color' if list_of_colors.none?(@color)
    end
  end
end
