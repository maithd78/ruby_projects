# frozen_string_literal: true

require_relative 'libs/cipher'

encode = Cipher.new('Hello World!', 5)
encode.shift_chars
