require_relative 'player'
require_relative 'stickman'
require_relative 'word'
require_relative 'alphabets'

class Game
  attr_accessor :name, :stickman, :word, :alphabets, :blank, :guess

  def initialize
    puts 'Welcome to Hangman!'
    puts 'Enter your name: '
    @name = Player.new(gets.chomp)
    @stickman = Stickman.new
    @word = Word.new
    @alphabets = Alphabets.new
    @blank = ''
  end

  def enter_guess
    puts 'Please enter an alphabet from above for your guess: '
    @word.blank_word
    self.guess = gets.chomp.upcase
  end

  def match_guess
    fullword = word.show_word
    if fullword.include?(guess)
      puts 'You got the guess right!'
      replace_blank
    else
      puts 'You got the guess wrong!'
      @alphabets.remove_alphabet(guess)
      puts @alphabets.display_alphabet
    end
    puts "#{guess} is removed from alphabets"
  end

  def replace_blank
    fullword = word.show_word.chars
    fullword.each_with_index do |letter, index|
      blank[index] = guess if letter == guess
    end
    puts blank.join(' ')
  end

  def win
    return unless @blank.join == @word.show_word

    puts "Congratulations! you guessed the entire word: #{word.show_word}"
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
    self.blank = word.blank_word
    until win
      enter_guess
      match_guess
    end
  end
end

game1 = Game.new
game1.play
