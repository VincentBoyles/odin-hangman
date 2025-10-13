class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def welcome
    puts "Welcome to Hangman #{name}!"
    puts 'Guess the hidden word by suggesting letters before you run out of 10 chances.'
    puts 'You can also have the option so continue or save your progress.'
    puts 'Enter 1 to continue while 2 to save your progress'
    puts '---- Retrieving a word -----'
  end

  def save
  end
end
