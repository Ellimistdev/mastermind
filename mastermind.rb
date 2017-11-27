require_relative 'board.rb'

class Mastermind
  def initialize
    @board = Board.new
    @attempts = 12
    @solution = gen_solution
  end

  def make_attempt(guess_seed)
    @board.add(@board.create_row(guess_seed, validate_guess(guess_seed)))
    @attempts -= 1
  end

  def render
    @board.display
    @solution # remove before completion
  end

  private

  def gen_solution
    solution = ''
    4.times do
      solution << [*1..6].sample.to_s
    end
    solution.to_i
  end

  def validate_guess(guess_seed)
    values = [@solution.digits, guess_seed.digits, []]
    values = find_exact_matches(values)
    values = find_close_matches(values)
    values[2] << 1 while values[2].length < 4
    values[2].join('').to_i
  end

  def find_exact_matches(values)
    index = 0
    4.times do
      if values[1][index] == values[0][index]
        values[2] << 3
        values = trim(values, [0, 1], index)
        index -= 1
      end
      index += 1
    end
    values
  end

  def find_close_matches(values)
    puts values[1].join.to_i
    values[1].each do |num|
      if values[0].any? { |i| i == num }
        values[2] << 2
        values = trim(values, [0], values[0].index(num))
      end
    end
    values
  end

  def trim(values, targets, index)
    targets.each do |i|
      values[i].delete_at(index)
    end
    values
  end
end
