require_relative 'game'
# Class for round logic
class Round
  def initialize
    @round = 1
  end

  def play
    @round += 1 until @round == 10
  end
end
