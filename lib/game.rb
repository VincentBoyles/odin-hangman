require 'yaml'
require_relative 'player'
require_relative 'word'
require_relative 'alphabets'

class Game
  attr_accessor :name, :word, :alphabets, :blank, :guess, :chances

  SAVE_DIR = './saves'

  def initialize(player)
    @name = player
    @word = Word.new
    @alphabets = Alphabets.new
    @blank = ''
    @chances = 10
  end

  def self.load_from_file(filename)
    data = YAML.load_file(filename)
    game = allocate
    game.name = data[:name]
    game.word = data[:word]
    game.alphabets = data[:alphabets]
    game.blank = data[:blank]
    game.guess = data[:guess]
    game.chances = data[:chances]
    puts "Welcome back #{game.name.name}! Your game has been loaded."
    game
  end

  def save_file_name
    File.join(SAVE_DIR, "hangman_save_#{name.name.downcase}.yml")
  end

  def save
    data = {
      name: @name,
      word: @word,
      alphabets: @alphabets,
      blank: @blank,
      guess: @guess,
      chances: @chances
    }
    File.write(save_file_name, YAML.dump(data))
    puts "Game progress saved for #{name.name}!"
  end

  def enter_guess
    puts alphabets.display_alphabet
    puts blank.join(' ')
    puts 'Please enter an alphabet from above for your guess: '
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
      puts "Congratulations #{name.name}! You guessed the entire word :)"
      puts "The word was #{word.show_word}"
      File.delete(save_file_name) if File.exist?(save_file_name)
      true
    else
      false
    end
  end

  def lose?
    if chances.zero?
      puts "Oh no #{name.name}! You failed to guess the word after 10 chances! :("
      puts "The word was #{word.show_word}"
      File.delete(save_file_name) if File.exist?(save_file_name)
      true
    else
      false
    end
  end

  def continue_or_save
    input = 0
    puts 'Do you want to save your progress or continue?'
    puts '1. Continue'
    puts '2. Save & Exit'
    until [1, 2].include?(input)
      input = gets.chomp.to_i
      puts 'Enter only 1 or 2!' unless [1, 2].include?(input)
    end
    return unless input == 2

    save
    puts 'Goodbye!'
    exit
  end

  def play
    name.welcome if name.respond_to?(:welcome)
    word.get_word if blank == ''
    self.blank = word.blank_word if blank == ''
    alphabets.alphabets_info
    until win? || lose?
      enter_guess
      match_guess
      continue_or_save
    end
  end
end
