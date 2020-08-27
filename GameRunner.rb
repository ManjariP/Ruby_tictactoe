require './Game'
require './Board'
require './Player'

@board = Board.new()
@players = []

def setup_game 
    puts "Enter player name"
    playerName = gets.chomp
    @players << Player.new(playerName,'X')
    @players << Player.new('Computer','O')
    @board = Board.new()
    @game = Game.new(@board, @players)
    @game.game_turn(0)
end

setup_game