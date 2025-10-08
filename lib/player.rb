class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def welcome
    puts "Welcome to Hangman #{name}!"
  end
end
