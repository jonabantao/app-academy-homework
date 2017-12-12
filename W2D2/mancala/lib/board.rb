class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    cups.map!.with_index do |_ele, idx|
      if idx == 6 || idx == 13
        Array.new
      else
        [:stone] * 4
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    storage = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos

    until storage.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cups[6] << storage.pop if current_player_name == @player1
      elsif idx == 13
        @cups[13] << storage.pop if current_player_name == @player2
      else
        @cups[idx] << storage.pop
      end
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player1_empty = cups[0..5].all?(&:empty?)
    player2_empty = cups[7..12].all?(&:empty?)

    player1_empty || player2_empty
  end

  def winner
    end_value = cups[6].length <=> cups[13].length

    case end_value
    when 1
      return @player1
    when 0
      return :draw
    when -1
      @player2
    end
  end
end
