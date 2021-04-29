require_relative 'player'
require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

player1 = StudioGame::Player.new("moe")
player2 = StudioGame::Player.new("larry", 60)
player3 = StudioGame::Player.new("curly", 125)

knuckleheads = StudioGame::Game.new("Knuckleheads")
klutz = StudioGame::ClumsyPlayer.new("klutz", 105, 3)
knuckleheads.add_player(klutz)
berserker = StudioGame::BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)
knuckleheads.load_players(ARGV.shift || "players.csv")

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
      knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save_high_scores


















