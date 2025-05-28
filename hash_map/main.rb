require_relative "libs/hash_map"
require_relative "libs/hash_set"
require_relative "libs/linked_list"

hashmap = HashMap.new
hashset = HashSet.new

hashmap.set("apple", "red")
hashmap.set("banana", "yellow")
hashmap.set("carrot", "orange")
hashmap.set("dog", "brown")
hashmap.set("elephant", "gray")
hashmap.set("frog", "green")
hashmap.set("grape", "purple")
hashmap.set("hat", "black")
hashmap.set("ice cream", "white")
hashmap.set("jacket", "blue")
hashmap.set("kite", "pink")
hashmap.set("lion", "golden")
hashmap.set("moon", "silver")

puts hashmap.length
p hashmap.get("dog")
p hashmap.has?("moon")
p hashmap.has?("cream ice")
p hashmap.keys
p hashmap.values
p hashmap.entries
p hashmap.remove("moon")

hashset.set("apple")
hashset.set("banana")
hashset.set("carrot")
hashset.set("dog")
hashset.set("elephant")
hashset.set("frog")
hashset.set("grape")
hashset.set("hat")
hashset.set("ice cream")
hashset.set("jacket")
hashset.set("kite")
hashset.set("lion")
hashset.set("cacodeamon")

puts hashset.length
p hashset.get("dog")
p hashset.has?("moon")
p hashset.has?("cream ice")
p hashset.keys
p hashset.entries
p hashset.remove("moon")
