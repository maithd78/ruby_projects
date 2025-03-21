# Class to assign players
class Player
  attr_reader :name
  attr_accessor :choice

  def initialize(name)
    @name = name
    @choice = []
  end
end
