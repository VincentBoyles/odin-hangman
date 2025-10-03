require_relative 'player'
require_relative 'stickman'
require_relative 'word'

class Game
  attr_accessor :name, :game, :guesses

  def initialize
    @name = ''
    @game = []
  end

  def set_player_name
    self.name = Player.ask_name
  end

  def generate_stickman
    stick = Stickman.new
    stick.show_stickman
  end

  def generate_word
    Word.get_word
  end
end

game1 = Game.new
game1.generate_word
