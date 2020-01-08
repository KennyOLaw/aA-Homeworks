class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(ele)
    add_helper(ele)
    @cache << ele
  end

  def show
    puts @cache
  end
  
  private

  def add_helper(ele)
    if @cache.include?(ele)
      @cache.delete(ele)
    elsif count >= @size
      @cache.shift
    end
  end 

end

p johnny_cache = LRUCache.new(4)

p johnny_cache.add("I walk the line")
p johnny_cache.add(5)

p johnny_cache.count # => returns 2

p johnny_cache.add([1,2,3])
p johnny_cache.add(5)
p johnny_cache.add(-5)
p johnny_cache.add({a: 1, b: 2, c: 3})
p johnny_cache.add([1,2,3,4])
p johnny_cache.add("I walk the line")
p johnny_cache.add(:ring_of_fire)
p johnny_cache.add("I walk the line")
p johnny_cache.add({a: 1, b: 2, c: 3})