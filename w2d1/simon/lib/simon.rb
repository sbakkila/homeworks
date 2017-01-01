class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    system("clear")
    puts "Remember this sequence of colors!"
    sleep 1

    show_sequence
    user_seq = require_sequence

    @sequence_length += 1 unless @game_over
    @game_over = true unless user_seq == @seq

    round_success_message
    system("clear")

  end

  def show_sequence
    system("clear")
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 0.2
    end
  end

  def require_sequence
    puts "Enter sequence (full color name with spaces)"
    user_seq = gets.chomp
    user_seq.split(" ")
  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    "Correct! Get ready for the next round!"
  end

  def game_over_message
    puts "Game over! You remembered #{@sequence_length - 1} colors correctly!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__

  Simon.new.play
end
