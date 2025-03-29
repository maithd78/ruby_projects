# Module to get player inputs
module PlayerCode
  def player_input
    @player_code = []
    puts "available colors:\n#{list_of_colors.join(', ')}"
    until @player_code.size == 4
      puts "what is the color in peg #{@player_code.size + 1}"
      puts 'invalid color, Try again' until list_of_colors.include?(@current_color = gets.chomp.downcase)
      @player_code.push(@current_color)
    end
    p @player_code
  end
end
