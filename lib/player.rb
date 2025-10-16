class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def welcome
    puts "Welcome to Hangman #{name}!"
    puts 'Guess the word by suggesting letters before you run out of 10 chances.'
    puts 'Enter 1 to continue while 2 to save your progress'
    puts '---- Please wait! We are currently retrieving a word :D -----'
  end
end
