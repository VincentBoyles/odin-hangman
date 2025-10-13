require 'debug'

require_relative 'player'
require_relative 'word'
require_relative 'alphabets'

class Game
  attr_accessor :name, :stickman, :word, :alphabets, :blank, :guess, :chances

  def initialize
    puts 'Welcome to Hangman!'
    puts 'Enter your name: '
    @name = Player.new(gets.chomp)
    @word = Word.new
    @alphabets = Alphabets.new
    @blank = ''
    @chances = 10
  end

  def enter_guess
    puts alphabets.display_alphabet
    puts blank.join(' ')
    puts 'Please enter an alphabet from above for your guess: '
    word.blank_word
    until alphabets.alphabets.include?(guess)
      self.guess = gets.chomp.upcase
      puts 'Enter only the ALPHABETS available above!' unless alphabets.alphabets.include?(guess)
    end
  end

  def match_guess
    fullword = word.show_word
    if fullword.include?(guess)
      puts 'You got the guess right!'
    else
      self.chances -= 1
      puts "You got the guess wrong! #{chances} chances left!"
    end
    alphabets.remove_alphabet(guess)
    puts "#{guess} is removed from alphabets"
    replace_blank
  end

  def replace_blank
    fullword = word.show_word.chars
    fullword.each_with_index do |letter, index|
      blank[index] = guess if letter == guess
    end
    puts blank.join(' ')
  end

  def win?
    if blank.join == word.show_word
      puts "Congratulations #{name.name}! you guessed the entire word :)"
      puts "The word is #{word.show_word}"
      true
    else
      false
    end
  end

  def lose?
    if chances.zero?
      puts "Oh no #{name.name}! you failed to guess the word after 10 tries! :("
      puts "The word is #{word.show_word}"
      true
    else
      false
    end
  end

  def continue_or_save
    input = 0
    puts 'Do you want to save your progress or continue?'
    puts '1 is for continue while 2 is for save progress.'
    until [1, 2].include?(input)
      input = gets.chomp.to_i
      puts 'Enter only 1 or 2!' unless [1, 2].include?(input)
    end
    player.save if input == 2
  end

  def play
    name.welcome
    word.get_word
    self.blank = word.blank_word
    alphabets.alphabets_info
    until win? || lose?
      enter_guess
      match_guess
      continue_or_save
    end
  end
end

game1 = Game.new
game1.play
