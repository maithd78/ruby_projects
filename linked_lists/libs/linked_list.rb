require_relative 'node'

class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @head = Node.new(value, @head)
    end
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

  def at(index)
    return nil if @head.nil?
    if index >= self.size
      return nil
    else
      pointer = @head
      i = 0
      until i == index
        pointer = pointer.next_node
        i += 1
      end
      pointer.value
    end
  end

  def pop
    if @head.nil?
      return nil
    elsif @head.next_node == nil
      popped = @head
      @head = nil
      return popped
    end

    pointer = @head.next_node
    while pointer.next_node
      prev = pointer
      pointer = pointer.next_node
    end
    @tail = prev
    prev.next_node = nil
    pointer
  end

  def contains?(value)
    return false if @head.nil?

    pointer = @head
    while pointer
      return true if pointer.value == value
      return false if pointer.next_node.nil?
      pointer = pointer.next_node
    end
  end

  def find(value)
    return "not in list" if @head.nil?

    pointer = @head
    index = 0
    while pointer
      return index if pointer.value == value
      return nil if pointer.next_node.nil?
      index += 1
      pointer = pointer.next_node
    end
  end

  def insert_at(value, index)
    return nil if @head.nil?
    if index == 0
      self.prepend(value) 
      p @head
      return
    end
    i = 0
    pointer = @head
    until i == index
      prev = pointer
      self.append(nil) if pointer.next_node.nil?
      pointer = pointer.next_node
      i += 1
    end
    prev.next_node = Node.new(value)
    prev.next_node.next_node = pointer if pointer.value != nil
    p @head
  end

  def remove_at(index)
    return nil if @head.nil?
    return nil if index >= self.size

    pointer = @head
    if index == 0
      @head = pointer.next_node
    else
      i = 0
      until i == index
        prev = pointer
        i += 1
        pointer = pointer.next_node
      end
      prev.next_node = pointer.next_node
    end
    p @head    
  end

  def to_s
    return nil if @head.nil?

    str = ''
    pointer = @head
    while pointer
      str.insert(-1, "( #{pointer.value} ) -> ")
      pointer = pointer.next_node
    end
    str.insert(-1, 'nil')
  end
end