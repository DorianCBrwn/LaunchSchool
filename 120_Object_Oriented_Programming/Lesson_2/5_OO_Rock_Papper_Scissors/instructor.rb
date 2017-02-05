class Player
  attr_accessor :move
  
  def initialize(player_type)
    @player_type = player_type
    @move = nil
  end
  
  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if %w(rock paper scissors).include?(choice)
        puts "Sorry, invalid choice."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end
  
  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end
  
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end
  
  def display_goodbye_message
    puts "Thanks for playing Rock, Plaper, Scissors. Good bye!"
  end
  
  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play