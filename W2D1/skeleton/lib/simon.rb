class Simon
  require 'byebug'
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length, @game_over, @seq = 1, false, []
  end

  def play
    #debugger
    take_turn until game_over
    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless game_over
    @sequence_length += 1 #sequence_length needs to be
    #an instance variable, even though we have accessor method.
    #why??
  end

  def show_sequence #not sure what the role is here..
    add_random_color
    p seq
    sleep(1)
    system('clear') #SYSTEM CLEAR NOT WORKING HERE.. NOTHING HAPPENING. WHY?
                    #works when I do it with byebug though.
  end

  def require_sequence
    user_seq =
      @sequence_length > 1 ? gets.chomp.split(",") : gets.chomp.split

    @game_over = true if user_seq != seq
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    p "Completed round--nice!"
  end

  def game_over_message
    p "Game over. Play again?"
  end

  def reset_game
    #WHY DO THESE NEED TO BE IVARS?
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

simon_game = Simon.new
simon_game.play
