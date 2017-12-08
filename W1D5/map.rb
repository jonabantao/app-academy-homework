class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    key_idx = @map.index { |key_value| key_value[0] == key }
    key_idx ? @map[key_idx][-1] = value : @map << [key, value]

    [key, value]
  end

  def lookup(key)
    @map.each do |key_value|
      return key_value[-1] if key_value[0] == key
    end

    nil
  end

  def remove(key)
    @map.each_with_index do |key_value, idx|
      return @map.delete_at(idx)[-1] if key_value[0] == key
    end

    nil
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup(arr)
    arr.map(&:dup)
  end
end
