# frozen_string_literal: true

require_relative 'libs/cipher'

p 'Enter message to encrypt'
message = gets.chomp

p 'Enter shift'
shift = gets.chomp.to_i

my_message = Cipher.new(message, shift)
p my_message.encrypt
