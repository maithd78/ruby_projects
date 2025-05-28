require_relative "linked_list"
require_relative "node"

# Class for Hash set
class HashSet # rubocop:disable Metrics/ClassLength
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_nimber = 31

    key.each_char { |char| hash_code = (prime_nimber * hash_code) + char.ord }

    hash_code % @capacity
  end

  def set(key) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    index = hash(key)
    if @buckets[index].nil?
      @buckets[index] = LinkedList.new
      @buckets[index].append(key)
    else
      pointer = @buckets[index].head
      while pointer
        return pointer.key if pointer.key == key

        pointer = pointer.next_node
        @buckets[index].append(key) if pointer.nil?
      end
    end
    growth if length >= @capacity * @load_factor
  end

  def get(key)
    index = hash(key)
    return nil if @buckets[index].nil?

    pointer = @buckets[index].head
    while pointer
      return pointer.key if pointer.key == key

      pointer = pointer.next_node
    end
  end

  def has?(key)
    index = hash(key)
    return false if @buckets[index].nil?

    pointer = @buckets[index].head
    while pointer
      return true if pointer.key == key

      pointer = pointer.next_node
      return false if pointer.nil?
    end
  end

  def remove(key) # rubocop:disable Metrics/MethodLength
    index = hash(key)
    return nil if @buckets[index].nil?

    pointer = @buckets[index].head
    while pointer
      if pointer.key == key && @buckets[index].size > 1
        return @buckets[index].delete(key)
      elsif pointer.key == key
        @buckets[index] = nil
        return pointer.key
      end

      pointer = pointer.next_node
    end
  end

  def length
    @count = 0
    @buckets.each do |list|
      next if list.nil?

      pointer = list.head
      while pointer
        @count += 1 unless pointer.nil?
        pointer = pointer.next_node
      end
    end
    @count
  end

  def clear
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def keys
    @keys = []
    @buckets.each do |list|
      next if list.nil?

      pointer = list.head
      while pointer
        @keys << pointer.key unless pointer.nil?
        pointer = pointer.next_node
      end
    end
    @keys
  end

  def entries # rubocop:disable Metrics/MethodLength
    @entries = []
    @buckets.each do |list|
      next if list.nil?

      pointer = list.head
      while pointer
        current_key = []
        (current_key << pointer.key) unless pointer.nil?
        @entries << current_key unless current_key == []

        pointer = pointer.next_node
      end
    end
    @entries
  end

  def growth # rubocop:disable Metrics/MethodLength
    old_buckets = @buckets
    @capacity *= 2
    @buckets = Array.new(@capacity)
    old_buckets.each do |list|
      next if list.nil?

      pointer = list.head
      while pointer
        set(pointer.key)

        pointer = pointer.next_node
      end
    end
  end
end
