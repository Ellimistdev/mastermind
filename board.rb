require_relative 'lib/core_extensions/string/colorize.rb'

class Board
  def initialize
    @board = []
    @color = ['•'.red, '•'.green, '•'.yellow, '•'.blue, '•'.magenta, '•'.cyan]
    @answer_key = ['•', '•'.red, '•'.green]
  end

  def create_row(guess_seed, answer_seed)
    row = [[], []]
    guess_seed.digits.each_with_index do |val, index|
      row[0][3 - index] = @color[val - 1]
    end
    answer_seed.digits.each do |i|
      row[1] << @answer_key[i - 1]
    end
    row
  end

  def add(row)
    @board << row
  end

  def display
    print '      Guess     Feedback'
    @board.each do |row|
      puts "\n____________________________"
      (0..1).each do |i|
        row[i].each do |element|
          print " #{element} "
        end
        print ' | '
      end
    end
  end
end
