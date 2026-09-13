require 'pry-byebug'

require_relative 'player'
require_relative 'display'

# plays a round of tic tac toe
class Round
  attr_accessor :winner, :draw

  def initialize
    @winner = nil
    @draw = nil
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  # a round of ttt alternates between each player until a winner is found or all spots are filled
  def play(players, display)
    players.each do |player|
      puts "Player #{player.name} turn"
      choice = choice_input(players) while choice.nil?
      player.choice << choice
      display.assign(choice, player.name)
      return @winner = player if winning_combo?(player)
      return @draw = true unless display.valid_moves?
    end
  end

  def choice_input(players)
    until (choice = gets.chomp.to_i - 1).between?(0, 8)
      puts 'INVALID'
    end
    if players[0].choice.include?(choice) || players[1].choice.include?(choice)
      puts 'already filled in, try again'
      return nil
    end
    choice
  end

  def winning_combo?(player)
    # checks if  the player has any winning combos
    @winning_combinations.each do |combo| # loop through the 9 winning combos
      sort_intrsct_arr = player.choice.sort.intersection(combo) # creates an intersection with the players marks
      if @winning_combinations.include?(sort_intrsct_arr) # if the current intersection is also in the winning combos
        player.winning_choice = sort_intrsct_arr # a winner has been found
        return true
      else
        next unless combo == @winning_combinations[-1] # continues the loop unless the current itr is the last

        return nil
      end
    end
  end
end
