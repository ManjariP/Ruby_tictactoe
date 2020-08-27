class Board 

    TILE_N_COUNT = 3

    attr_accessor :positions

    def initialize
        @positions = Array.new(TILE_N_COUNT*TILE_N_COUNT," ")
    end

    def update(position,symbol)
        @positions[position.to_i] = symbol
    end

    def show
        @positions.each_with_index do |pos,index|
            if (((index + 1) % TILE_N_COUNT) == 0)
                puts "#{positions[index]}"
            else
                print "#{positions[index]}|"
            end
        end
    end
end