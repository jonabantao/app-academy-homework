class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      reshift(el)
    elsif count >= @size
      remove_and_add(el)
    else
      @cache << el
    end
  end

  def show
    print @cache
  end

  private

  def reshift(el)
    @cache.push(@cache.delete(el))
  end

  def remove_and_add(el)
    @cache.shift
    @cache << el
  end

end
