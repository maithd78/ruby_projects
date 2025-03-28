require_relative 'modules/colors'
# Class to contain Player logic
class Player
  include Colors

  attr_reader :player_code_digits

  def player_create_color_code
    @player_code = []
    puts "available colors:\n #{list_of_colors.join(', ')}"
    until @player_code.size == 4
      puts "what is the color in peg #{@player_code.size + 1}"
      puts 'invalid color, Try again' until list_of_colors.include?(@current_color = gets.chomp.downcase)
      @player_code.push(@current_color)
    end
    convert_to_digits
  end

  def convert_to_digits
    @colors = list_of_colors.to_h { |item| [item, list_of_colors.index(item) + 1] }
    @player_code_digits = []
    if @player_code.empty?
      @color_code.each { |e| @player_code_digits.push(@colors.values_at(e)) }
    else
      @player_code.each { |e| @player_code_digits.push(@colors.values_at(e)) }
    end
    @player_code_digits = @player_code_digits.join.to_i
  end
end
