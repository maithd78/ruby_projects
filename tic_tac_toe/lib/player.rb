# Class to assign players
class Player
  attr_reader :name
  attr_accessor :choice, :winning_choice, :wins, :losses, :draws

  def initialize(name)
    @name = name
    @choice = []
    @winning_choice = []
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def reset_round
    # resets prev choices
    @choice = []
    @winning_choice = []
  end
end
