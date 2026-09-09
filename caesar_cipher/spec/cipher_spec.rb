# frozen_string_literal: true

require_relative '../libs/cipher'

describe Cipher do # rubocop:disable Metrics/BlockLength
  # receives text to be encoded and a shift value
  describe '#initialize' do
    # no tests neccessary when initializing instance variables
  end

  describe '#get_shift' do
    subject(:encryption) { described_class.new('Hello World!', 30) }

    context 'when shift is larger than 26' do
      it 'return a number lower less than 26' do
        max = 26
        expect(encryption.get_shift(30)).to be <= max
      end
    end
    context 'when shift is 0' do
      it 'returns 0' do
        expect(encryption.get_shift(0)).to eq(0)
      end
    end
  end

  describe '#get_upcase' do
    subject(:upcase_letter) { described_class.new('HELLO', 20) }

    context 'when Z, wrap around the alphabet' do
      it 'will return A' do
        expect(upcase_letter.get_upcase('Z', 1)).to eq('A')
      end
    end
  end

  describe '#get_downcase' do
    subject(:lower_letter) { described_class.new('hello', 20) }

    context 'When z, wrap around the alphabet' do
      it 'will return a' do
        expect(lower_letter.get_downcase('z', 1)).to eq('a')
      end
    end
  end

  describe '#shift_chars' do
    subject(:not_alpha) { described_class.new('!@#$%^&*(){}:"|<>?', 5) }

    context 'when given non-alphabetical characters' do
      it 'returns as is' do
        non_alphabeticals = %w[! @ # $ % ^ & * ( ) { } : " | < > ?]
        expect(not_alpha.shift_chars).to eq(non_alphabeticals)
      end
    end
  end
end
