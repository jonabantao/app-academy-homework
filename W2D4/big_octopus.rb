require 'byebug'

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#O(n^2)
def sluggish_octopus(array)
  longest_fish = array[0]

  array.each_index do |idx|
    next if idx == array.length - 1
    ((idx + 1)...array.length).each do |idx2|
      if longest_fish.length < array[idx2].length
        longest_fish = array[idx2]
      end
    end
  end

  longest_fish
end

#O(n log n)
def dominant_octopus(array)
  return array if array.length < 2
  mid_idx = array.length / 2

  left_fish = dominant_octopus(array.take(mid_idx))
  right_fish = dominant_octopus(array.drop(mid_idx))

  merged_fish(left_fish, right_fish)
end

def merged_fish(left, right)
  sorted = []

  until left.empty? || right.empty?
    sort_val = left.first.length <=> right.first.length
    case sort_val
    when -1
      sorted << left.shift
    when 0
      sorted << left.shift
    when 1
      sorted << right.shift
    end
  end

  sorted + left + right
end

longest_fish = dominant_octopus(arr).last

#O(n)
def clever_octopus(array)
  array.reduce do |longest, fish|
    longest = (longest.length < fish.length) ? fish : longest
  end
end

#dancing octopustiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, array)
  array.each_with_index { |tile, idx| return idx if tile == direction }
end

tiles_hash = {
  up: 0,
  right_up: 1,
  right: 2,
  right_down: 3,
  down: 4,
  left_down: 5,
  left: 6,
  left_up: 7
}
def fast_dance(direction, hash)
  hash[direction]
end

p fast_dance(:up, tiles_hash)
p fast_dance(:right_down, tiles_hash)
