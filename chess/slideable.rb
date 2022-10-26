module Slideable
    #module is going to be included in a PIECE class
    #depends on having access to:
        #current position of the piece (self.pos)
        #board instance (self.board)
        #piece color (self.color)
        #piece move_dirs (self.move_dirs)
    def horizontal_dirs
        [[1,0],[0,1],[-1,0],[0,-1]]
    end

    def diagonal_dirs
        [[1,1,],[1,-1],[-1,1],[-1,-1]]
    end

    def moves
        #generate an array of all possible moves
        possible_moves = []
        move_dirs.each do |dir| #restructuring the subarrays within the pipes
            dx, dy = dir
            possible_moves.concat(grow_unblocked_moves_in_dir(dx,dy))
        end
        return possible_moves
    end

    private
    def move_dirs
        #print out CLEAR (custom) error in case parent doesn't overwrite. But the parent SHOULD overwrite it
        raise "implement your own version silly!"
        #the error only runs if the parent class doesn't have its own move_dirs to overwrite this message
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        #generate an array of all possible moves based on:
            #staying in bounds
            #not hitting another piece
        #Therefore, need to know
            #starting position
            #possible directions
            #board boundaries
            #other pieces
        #these things are known because this is essentially copy-pasted into the piece class itself
        #board and pos are defined already in piece
        res = []
        new_pos = [pos[0] + dx, pos[1] + dy] #pos comes from the piece class
        while board.valid_pos?(new_pos) && (board[new_pos].color.nil?)
            res << new_pos
            new_pos = [pos[0] + dx, pos[1] + dy]
             #...
        #while new_pos is in bounds and not occupied
            #if it is occupied, then...
            #shovel new_pos into res
            #recalculuate new_pos by incrementing with dx, dy
        end
        if !board[new_pos].teammate?
            res << new_pos
        end

        return res
    end
end
