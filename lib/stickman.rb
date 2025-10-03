class Stickman
  attr_accessor :word, :guesses, :drawing

  def initialize
    @word = ''
    @guesses = 0
    @drawing = '
      ___________
      | /       ¦
      ||	O
      ||       /|\
      ||        |
      ||       / \
      ||
      ==============
    '
  end

  def show_stickman
    puts @drawing
  end
end
