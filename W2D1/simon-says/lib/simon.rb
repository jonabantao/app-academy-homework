class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while true
      take_turn

      break if @game_over
      round_success_message
      @sequence_length += 1
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
  end

  def show_sequence
    add_random_color
    puts @seq
    # sleep(5)
    # system("clear")
  end

  def require_sequence
    idx = 0

    until @sequence_length == idx
      color = prompt
      if @seq[idx] == color
        idx += 1
        next
      else
        @game_over = true
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Correct!"
  end

  def prompt
    value = nil

    loop do
      puts "Input color "
      print "> "

      value = gets.chomp.downcase

      if COLORS.include?(value)
        return value
      else
        puts "Please pick a valid color: 'red, blue, green, yellow'"
        puts ""

        value = nil
      end
    end
  end

  def game_over_message
    puts "Wrong color! Game over. Play again?"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
