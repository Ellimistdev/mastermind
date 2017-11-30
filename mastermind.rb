require_relative 'game.rb'

class Mastermind
  def initialize 
    run
  end

  def run
     game = Game.new
     while !game.win? && game.attempts > 0
       puts "please enter your attempt"
       input = gets.chomp.to_i #must validate
       game.make_attempt(input)
       game.render
     end
     
  puts "loss!" if !game.win?        
  puts "win!" if game.win?
  restart?  
  end

  def restart?
    puts "Would you like to play again? y/n"
    action = gets.chomp.downcase
    
    while !/[ynYN]/.match(action)
      puts "You entered: #{action}"
      puts "You must choose y or n" 
      action = gets.chomp.downcase
    end
    
    restart = action == 'y' ? true : false
    run if restart
    close
  end
  
  def close
     puts "Thanks for playing!"
     exit
  end
end
