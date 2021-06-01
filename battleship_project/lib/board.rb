class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](pos_arr) #[x, y]
        pos_0 = pos_arr[0]
        pos_1 = pos_arr[1]
        @grid[pos_0][pos_1]                    #grid_location[x, y]
    end

    def []=(pos_arr, v)
         pos_0 = pos_arr[0]
        pos_1 = pos_arr[1]
        @grid[pos_0][pos_1]=v                   #grid_set[x, y]= :A
    end
    
    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(pos_arr)
        if  self[pos_arr]== :S
            self[pos_arr]= :H
            print "you sunk my battleship!"
            return true
        else
            self[pos_arr]= :X
            return false
        end
    end

    def place_random_ships

    end


end #end
