class Word
  attr_accessor :word

  def initialize
    @word = []
  end

  def get_word
    file = File.open('/home/vincent/repos/odin-hangman/lib/google-10000-english-no-swears.txt')
    arr = []
    while line = file.gets
      self.word = arr.push(line)
      self.word = word.select { |word| word.length >= 5 }
    end
    self.word = word.sample.upcase
  end

  def blank_word
    Array.new(word.length - 1, '_')
  end

  def show_word
    word.strip
  end
end
