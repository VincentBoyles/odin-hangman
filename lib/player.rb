class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.ask_name
    puts 'Enter your name: '
    askname = gets.chomp
    new(askname)
  end
end
