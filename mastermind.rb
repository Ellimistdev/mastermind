require_relative 'game.rb'

class Mastermind
  def initialize
    introduction
    start_game
  end

  def introduction
    print "\nWelcome to"
    3.times do
      print '.'
      sleep(0.5)
    end
    puts "
     __  __           _                      _           _
    |  \\/  |         | |                    (_)         | |
    | \\  / | __ _ ___| |_ ___ _ __ _ __ ___  _ _ __   __| |
    | |\\/| |/ _` / __| __/ _ \\ '__| '_ ` _ \\| | '_ \\ / _` |
    | |  | | (_| \\__ \\ ||  __/ |  | | | | | | | | | | (_| |
    |_|  |_|\\__,_|___/\\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|".cyan
    sleep(0.5)
    puts "\nGreetings Agent".yellow
    puts 'As our preeminent code breaker, your talents are needed to disable'
    puts 'the security system at The Enemy Agency. The security code consists'
    puts 'of four colors from the following:'
    puts "\n\t(R)ed ".red + '(G)reen '.green + '(Y)ellow '.yellow +
         '(B)lue '.blue + '(M)agenta '.magenta + '(C)yan'.cyan
    puts "\n- You have 12 attempts before the system locks down."
    puts "\n- After entering the code, the system will display feedback"
    puts '  indicating whether a color is:'
    puts "\t#{'•'.green} | In the code and in the correct position"
    puts "\t#{'•'.red} | In the code and in the incorrect position"
    puts "\t• | Not in the code."
    puts "\n- *Note that the position of the feedback indicator does not always"
    puts '  correspond to the same position in the submitted code. For example,'
    puts "  the #{'green'.green} feedback indicator below does not neccessarily mean"
    puts "  that the #{'yellow'.yellow} guess indicator is in the correct position."
    print "\t    Guess     Feedback"
    puts "\n\t________________________"
    puts "\t• ".red + ' • '.green + ' • '.blue + ' • '.yellow + ' | ' \
         '• ' + ' • ' + ' • '.red + ' • '.green
    puts "\n\nPress ENTER to start the game!"
    gets
  end

  def start_game
    game = Game.new
    until game.victory || game.attempts < 1
      puts "\nATTEMPTS UNTIL LOCKDOWN: #{game.attempts}"
      puts 'PLEASE ENTER THE 4 CHARACTER ACCESS CODE:'
      puts '(R)ed '.red + '(G)reen '.green + '(Y)ellow '.yellow +
           '(B)lue '.blue + '(M)agenta '.magenta + '(C)yan:'.cyan
      game.make_attempt(game.convert_input)
      game.render
    end
    end_game(game)
  end

  def end_game(game)
    puts "\nUNLOCKING DOOR\nMission Complete!" if game.victory
    puts "\nCOMMENCING LOCKDOWN\nMission Failed!" unless game.victory
    restart?
  end

  def restart?
    puts 'Would you like to play again? y/n'
    action = gets.chomp.downcase

    until /[yn]/ =~ action
      puts "You entered: #{action}"
      puts 'You must choose y or n'
      action = gets.chomp.downcase
    end

    start_game if action == 'y'
    close
  end

  def close
    puts 'Thanks for playing!'
    exit
  end
end

Mastermind.new
