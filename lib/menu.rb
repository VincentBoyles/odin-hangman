require_relative 'game'

class Menu
  SAVE_DIR = './saves'

  def initialize
    Dir.mkdir(SAVE_DIR) unless Dir.exist?(SAVE_DIR)
  end

  def start
    loop do
      puts '=== HANGMAN ==='
      puts '1. New Game'
      puts '2. Load Saved Game'
      puts '3. Delete Saved Game'
      puts '4. Exit'
      print 'Choose an option: '

      case gets.chomp.to_i
      when 1 then start_new_game
      when 2 then load_saved_game
      when 3 then delete_saved_game
      when 4 then exit_game
      else
        puts 'Invalid choice. Try again.'
      end
    end
  end

  def start_new_game
    puts 'Enter your name: '
    player_name = gets.chomp
    player = Player.new(player_name)
    game = Game.new(player)
    game.play
  end

  def load_saved_game
    saves = Dir.entries(SAVE_DIR).select { |f| f.end_with?('.yml') }

    if saves.empty?
      puts 'No saved games found.'
      return
    end

    puts 'Saved games:'
    saves.each_with_index do |file, i|
      puts "#{i + 1}. #{file.gsub('hangman_save_', '').gsub('.yml', '').capitalize}"
    end
    print 'Select a number to load: '
    choice = gets.chomp.to_i

    if choice.between?(1, saves.size)
      filename = File.join(SAVE_DIR, saves[choice - 1])
      game = Game.load_from_file(filename)
      game.play
    else
      puts 'Invalid choice.'
    end
  end

  def delete_saved_game
    saves = Dir.entries(SAVE_DIR).select { |f| f.end_with?('.yml') }

    if saves.empty?
      puts 'No saved games to delete.'
      return
    end

    puts 'Saved games:'
    saves.each_with_index do |file, i|
      puts "#{i + 1}. #{file.gsub('hangman_save_', '').gsub('.yml', '').capitalize}"
    end
    print 'Select a number to delete: '
    choice = gets.chomp.to_i

    if choice.between?(1, saves.size)
      File.delete(File.join(SAVE_DIR, saves[choice - 1]))
      puts 'Save deleted successfully!'
    else
      puts 'Invalid choice.'
    end
  end

  def exit_game
    puts 'Goodbye!'
    exit
  end
end
