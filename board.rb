require_relative 'lib/core_extensions/integer/digits.rb'

class Board
  def initialize
    @board = []
    @color = %w[red green blue yellow magenta cyan]
    @answer_key = %w[blank red green]
  end

  def create_row(guess_seed, answer_seed)
    row = [[], []]
    guess_seed.digits.each do |i|
      row[0] << @color[i - 1] # figure out how to handle leading zeros
    end
    answer_seed.digits.each do |i|
      row[1] << @answer_key[i - 1] # figure out how to handle leading zeros
    end
    row
  end

  def add(row)
    @board << row
  end

  def display
    p @board
  end
end
