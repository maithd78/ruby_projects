require_relative 'modules/colors'
require_relative 'modules/hints'
require 'pry-byebug'
# Class to contain Computer logic
class Computer
  include Colors
  include Hints

  attr_reader :color_code

  def initialize
    code_solutions
  end

  def code_solutions
    @solutions = (1111..6666).to_a
    @solutions.delete_if { |val| val.digits.any? { |e| e >= 7 || e.zero? } }
    @remaining_solutions = @solutions.map { |sol| sol.to_s.chars.map(&:to_i) }
  end

  def possible_solutions(guess, current_guess_hints)
    @remaining_solutions.delete_if do |arr|
      round_end_hints(arr, guess)
      @hints != current_guess_hints
    end
    p @remaining_solutions.size
  end

  # def minimax(hints)
  #   @value_of_solutions = Array.new(@remaining_solutions.size)
  #   if (hints[:B]).zero? && (hints[:W]).zero?
  #     @value_of_solutions.each_with_index do |val, index|
  #       val = 1 if @remaining_solutions[index]
  #     end
  #   end
  # end

  def next_possible_guess(current_round)
    if current_round == 1
      [1, 1, 2, 2]
    else
      @remaining_solutions.sample
    end
  end
end
