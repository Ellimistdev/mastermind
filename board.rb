Integer.include CoreExtensions::Integer

module Board
  @color = ["red", "green", "blue", "yellow", "magenta", "cyan"]
  @answerKey = ["blank", "red", "green"]
  
  
  def initialize
  @board = []
  end
  
  def makeAttempt(guessSeed)
    answerSeed = 1221
    attempt = new row(guessSeed, answerSeed)
    @board << attempt
    p @board
  end
  
  def row(guessSeed, answerSeed)
    row = [[],[]]
    guessSeed.digits.each do |i| 
      row[0] << @color[i - 1] # figure out how to handle leading zeros better
    end
    puts "\n"
    answerSeed.digits.each do |i|
      row[1] << @answerKey[i - 1] # figure out how to handle leading zeros better
    end
    row
  end
end