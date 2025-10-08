require_relative 'player'
require_relative 'stickman'
require_relative 'word'
require_relative 'alphabets'

class Game
  attr_accessor :name, :stickman, :word, :alphabets, :guess

  def initialize
    puts 'Welcome to Hangman!'
    puts 'Enter your name: '
    @name = Player.new(gets.chomp)
    @stickman = Stickman.new
    @word = Word.new
    @alphabets = Alphabets.new
    @guess = ''
  end

  def enter_guess
    puts 'Please enter an alphabet from above for your guess: '
    @word.blank_word
    self.guesss = gets.chomp.upcase
  end

  def match_guess
    fullword = word.show_word
    fullword.split
    if fullword.include?(guess)
      puts 'You got the guess right!'
    else
      puts 'You got the guess wrong!'
    end
  end

  def replace_blank
    fullword = word.show_word
    fullword.split
  end

  def alphabets_info
    @alphabets.alphabets_info
    puts @alphabets.display_alphabet
  end

  def play
    @name.welcome
    @stickman.show_stickman
    @word.get_word
    puts @word.show_word
    alphabets_info
    match_guess
  end
end

game1 = Game.new
game1.play
