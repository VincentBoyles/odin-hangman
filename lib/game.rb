require_relative 'player'
require_relative 'stickman'
require_relative 'word'
require_relative 'alphabets'

class Game
  attr_accessor :name, :stickman, :word, :alphabets

  def initialize
    puts 'Welcome to Hangman!'
    puts 'Enter your name: '
    @name = Player.new(gets.chomp)
    @stickman = Stickman.new
    @word = Word.new
    @alphabets = Alphabets.new
  end

  def enter_guess
    puts 'Please enter an alphabet for your guess'
    @alphabets.alphabets_info
    puts @alphabets.display_alphabet
  end

  def play
    @name.welcome
    @stickman.show_stickman
    @word.get_word
    @word.show_word
    @word.blank_word
    enter_guess
  end
end

game1 = Game.new
game1.play
