def caesar(string, shift)
  result = Array.new
  downcase_alphabet = ('a'..'z').to_a
  upcase_alphabet = ('A'..'Z').to_a
  alphabet = Array(downcase_alphabet + upcase_alphabet)
  split = string.split("")
  split_hash = Hash[(0...split.size).zip split]
  whitespace = split_hash.select {|k,v| !alphabet.include?(v)}
  split.delete_if {|e| !alphabet.include?(e)}
  split.each do |letter|
    if letter == letter.upcase
      swap_index = upcase_alphabet.index(letter) + shift
      swap_index -= 26 if swap_index > 25 
      result.push(upcase_alphabet[swap_index])
    else
      swap_index = downcase_alphabet.index(letter) + shift
      swap_index -= 26 if swap_index > 25
      result.push(downcase_alphabet[swap_index])
    end
  end
  whitespace.each_pair do |index, value|
    result.insert(index,value)
  end
puts result.join
end

puts "enter plaintext to cipher"
str = gets.chomp

shift = 0
puts "enter shift"
until shift != 0
  shift = gets.chomp.to_i
  puts "not a number" if shift == 0
end

caesar(str,shift)
