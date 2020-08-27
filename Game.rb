class Game 
    WINNING_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    attr_accessor :board, :players

    def initialize(board,players)
        @board = board
        @players = players
    end


    def game_turn(playerIndex)
        @currentPlayer = @players[playerIndex]
        continueGame = play_game
        if continueGame
            game_turn(playerIndex == 0 ? 1 : 0)
        end
    end

    def play_game
        puts "#{@currentPlayer.name} - Enter position"
        if(@currentPlayer.name == 'Computer')
            position = rand(0..8)
        else
            position =  gets.chop
        end
        
        if(@board.positions[position.to_i] == ' ')
            @board.update(position, @currentPlayer.symbol)
            @currentPlayer.moves << position
            @board.show
            if winner?
                puts "#{@currentPlayer.name} won the game"
                return false
            elsif draw?
                puts "Game ended in draw"
                return false
            else
                return true
            end
        else
            puts "Position taken, try again"
            play_game
        end
    end

    def winner?
        WINNING_COMBINATIONS.each do |combo|
            if(@board.positions[combo[0]] == @currentPlayer.symbol && @board.positions[combo[1]] == @currentPlayer.symbol && @board.positions[combo[2]] == @currentPlayer.symbol)
            # if(combo.select{ |x| !@currentPlayer.moves.include?(x) }.empty?)
                return true
            end
        end
        return false
    end

    def draw?
        !@board.positions.index(' ')
    end

end