# frozen_string_literal: true

# Receives message from main and returns ciphered message
class Cipher
  def initialize(message, shift)
    @message = message
    @shift = shift < 26 ? shift : get_shift(shift)
  end

  def get_shift(shift)
    shift % 26
  end

  def get_upcase(char, shift)
    # % to wrap around the alphabet and add 65 to get ascii.
    (((char.ord - 65 + shift) % 26) + 65).chr
  end

  def get_downcase(char, shift)
    # % to wrap around the alphabet and add 97 to get ascii.
    (((char.ord - 97 + shift) % 26) + 97).chr
  end

  def shift_chars(message = @message, shift = @shift, result = [])
    message.each_char do |char|
      result << if char.ord.between?(97, 122)
                  get_downcase(char, shift)
                elsif char.ord.between?(65, 90)
                  get_upcase(char, shift)
                else
                  char
                end
    end
    result
  end

  def encrypt
    @message = shift_chars.join
  end
end
