require_relative 'board.rb'

class Mastermind
  def initialize
    @board = Board.new
    @attempts = 12
  end

  def make_attempt(guess_seed)
    answer_seed = 1221 # validateGuess(guess_seed)
    attempt = @board.create_row(guess_seed, answer_seed)
    @board.add(attempt)
    @attempts -= 1
  end

  def render
    @board.display
  end

  def validate_guess(guess_seed)
    # answer_seed = ''
  end
end
