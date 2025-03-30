require_relative 'modules/colors'
require 'pry-byebug'
# Class to contain Computer logic
class Computer
  include Colors

  attr_reader :color_code

  def initialize
    code_solutions
  end

  def code_solutions
    @solutions = (1111..6666).to_a
    @solutions.delete_if { |val| val.digits.any? { |e| e >= 7 || e.zero? } }
    @solutions_to_s = @solutions.map(&:to_s)
  end
end
