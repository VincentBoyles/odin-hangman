class Word
  attr_accessor :word

  def initialize
    @word = []
  end

  def get_word
    file = File.open('google-10000-english-no-swears.txt')
    arr = []
    while line = file.gets
      self.word = arr.push(line)
      self.word = word.select { |word| word.length >= 5 }
    end
    self.word = word.sample.upcase
  end

  def blank_word
    blanks = Array.new(word.length - 1, '_')
    puts blanks.join(' ')
  end

  def show_word
    puts word
  end
end
