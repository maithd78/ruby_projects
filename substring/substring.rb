def substrings(string, dictionary)
  result = []
  split_str = string.downcase.split(" ")
  split_str.each do |str|
    x = 0
    until x == dictionary.length
    result.push(dictionary[x]) if str.include?(dictionary[x])
    x += 1
    end
  end
  hash = result.reduce(Hash.new(0)) do |key, value|
    key[value] += 1
    key
  end
  p hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)