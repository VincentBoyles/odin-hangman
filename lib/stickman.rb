class Stickman
  attr_accessor :word, :guesses, :stickman
  def initialize
    @word = ''
    @guesses = 0
  end

  def show_stickman
    @stickman = 
    "
        ____________
      |/         ¦
      ||	       O
      ||	      /|\ 
      ||         |
      ||        / \
      ||
      | \
    =========
    ============
    ===============
    Word: #{word}
    Number of guesses left #{word.length}
    "
  end
end