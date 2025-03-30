# methods to get feedback from round
module Hints
  def black_pegs
    @guess_copy.each_with_index do |val, index|
      next unless val == @secret_code_copy[index]

      @hints[:B] += 1
      @guess_copy[index] = nil
      @secret_code_copy[index] = nil
    end
  end

  def white_pegs
    @guess_copy.each_index do |index|
      next unless @secret_code_copy.include?(@guess_copy[index]) && !@guess_copy[index].nil?

      @hints[:W] += 1
      id = @secret_code_copy.index(@guess_copy[index])
      @secret_code_copy[id] = nil
      @guess_copy[index] = nil
    end
  end

  def round_end_hints(guess, secret_code)
    @guess_copy = guess.map(&:clone)
    @secret_code_copy = secret_code.map(&:clone)
    @hints = { B: 0, W: 0 }
    black_pegs
    white_pegs
    puts "Black: #{@hints[:B]}, White: #{@hints[:W]}"
  end
end
