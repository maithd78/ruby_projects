require 'pry-byebug'
require_relative 'lib/display'
require_relative 'lib/player'

player = [
  Player.new('X'),
  Player.new('O')
]

turn = 1
winner = nil
winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

board = Display.new
puts 'select a grid number to place your mark'

while winner.nil?
  player.each_index do |i|
    puts "#{player[i].name} turn"
    until (choice = gets.chomp.to_i - 1).between?(0, 9)
      puts 'invalid'
    end
    redo if player[0].choice.include?(choice) || player[1].choice.include?(choice)
    player[i].choice.push(choice)
    if player[i].name == 'X'
      board.assign_x(choice)
    else
      board.assign_o(choice)
    end
    turn += 1
    if turn > 6
      winning_combinations.each do |arr|
        newarr = player[i].choice.sort.intersection(arr)
        next unless winning_combinations.include?(newarr)

        player[i].choice = newarr
        break
      end
    end
    next unless turn >= 6 && winning_combinations.include?(player[i].choice.sort)

    winner = player[i].name
    puts "#{winner} WINNER"
    break
  end
end
