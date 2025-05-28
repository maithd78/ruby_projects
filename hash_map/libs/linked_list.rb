require_relative "node"

# Holds jey,value pair in hashmap
class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
  end

  def append(key, value = nil)
    if @head.nil?
      @head = Node.new(key, value)
      @tail = @head
    else
      @tail.next_node = Node.new(key, value)
      @tail = @tail.next_node
    end
  end

  def delete(key)
    pointer = @head
    until pointer.key == key
      prev = pointer
      pointer = pointer.next_node
    end

    @tail = prev
    prev.next_node = nil
    pointer.value
  end

  def size
    return 0 if @head.nil?

    pointer = @head
    i = 0
    while pointer
      pointer = pointer.next_node
      i += 1
    end
    i
  end

  def to_s
    return nil if @head.nil?

    str = ""
    pointer = @head
    while pointer
      str.insert(-1, "( key:#{pointer.key} | value: #{pointer.value} ) -> ")
      pointer = pointer.next_node
    end
    str.insert(-1, "nil")
  end
end
