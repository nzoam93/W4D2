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
            dy, dx = dir
            possible_moves.concat(grow_unblocked_moves_in_dir(dy,dx))
        end
        return possible_moves
    end

    private
    def move_dirs
        #print out CLEAR (custom) error in case parent doesn't overwrite. But the parent SHOULD overwrite it
        raise "implement your own version silly!"
        #the error only runs if the parent class doesn't have its own move_dirs to overwrite this message
    end

    def grow_unblocked_moves_in_dir(dy,dx)
        res = []
        cur_y, cur_x = pos
        loop do 
            cur_y, cur_x = cur_y + dy, cur_x + dx
            pos = [cur_y, cur_x]
            break unless board.valid_pos?(pos)
            if board[pos].is_a?(NullPiece)
                res << pos
            else
                if board[pos].color != self.color
                    res << pos
                end
                break
            end
        end
        res
    end
end
        # new_pos = [pos[0] + dy, pos[1] + dx] #pos comes from the piece class
        # while board.valid_pos?(new_pos) && (board[new_pos].color.nil?)
        #     res << new_pos
        #     new_pos = [pos[0] + dy, pos[1] + dx]
        #     #...
        #     #while new_pos is in bounds and not occupied
        #     #if it is occupied, then...
        #     #shovel new_pos into res
        #     #recalculuate new_pos by incrementing with dx, dy
        # end
        
        # if board[new_pos].color != board[pos].color  # look at self
        #     res << new_pos
        # end
        
        # return res

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