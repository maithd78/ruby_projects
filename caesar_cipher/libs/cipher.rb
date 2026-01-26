# frozen_string_literal: true

# Receives message from main and returns ciphered message
class Cipher
  def initialize(message, shift)
    @message = message.chars
    @shift = get_shift(shift)
    @result = []
  end

  def get_shift(shift)
    return shift if shift <= 26

    (shift % 26)
  end

  def get_upcase(char, shift)
    (((char.ord - 65 + shift) % 26) + 65).chr
  end

  def get_downcase(char, shift)
    (((char.ord - 97 + shift) % 26) + 97).chr
  end

  def print_encode(result = @result)
    p result.join
  end

  def shift_chars(message = @message, shift = @shift, result = @result)
    message.each do |char|
      result << if char.ord.between?(97, 122)
                  get_downcase(char, shift)
                elsif char.ord.between?(65, 90)
                  get_upcase(char, shift)
                else
                  char
                end
    end
    print_encode
  end
end
