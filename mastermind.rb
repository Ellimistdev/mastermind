require_relative 'game.rb'

class Mastermind
  def initialize
    run
  end

  def run
    game = Game.new
    until game.victory || game.attempts < 1
      puts 'please enter your attempt'
      input = gets.chomp.to_i # must validate
      game.make_attempt(input)
      game.render
    end

    puts game.victory ? 'win!' : 'loss!'
    restart?
  end

  def restart?
    puts 'Would you like to play again? y/n'
    action = gets.chomp.downcase

    until /[ynYN]/ =~ action
      puts "You entered: #{action}"
      puts 'You must choose y or n'
      action = gets.chomp.downcase
    end

    run if action == 'y'
    close
  end

  def close
    puts 'Thanks for playing!'
    exit
  end
end
