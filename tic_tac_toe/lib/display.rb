# Class for displaying board
class Display
  def initialize
    @board = Array(1..9)
    draw
    @board.map! { |_e| ' ' }
  end

  def draw
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n "
  end

  def assign_o(num)
    @board[num] = 'O'
    draw
  end

  def assign_x(num)
    @board[num] = 'X'
    draw
  end
end
