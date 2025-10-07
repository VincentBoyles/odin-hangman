require_relative 'player'
require_relative 'stickman'
require_relative 'word'

class Game
  attr_accessor :name

  def initialize
    puts 'Welcome to Hangman!'
    puts 'Enter your name: '
    @name = Player.new(gets.chomp)
    @stickman = Stickman.new
  end

  def player_name
    puts @name
  end

  def generate_word
    new_word = Word.new
    self.word = new_word.get_word
    puts word
  end

  def blank_word
    blank_word = Array.new(word.length - 1, '_')
    puts blank_word.join(' ')
  end
end

game1 = Game.new
game1.player_name
