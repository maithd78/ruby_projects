require_relative 'modules/colors'
# Class to contain Computer logic
class Computer
  include Colors

  attr_reader :color_code, :solutions, :colors

  def initialize
    code_solutions
  end

  def code_solutions
    @solutions = (1111..6666).to_a
    @solutions.delete_if { |val| val.digits.any? { |e| e >= 7 || e.zero? } }
  end
end
