require_relative 'piece'
module Stepable
    def knight_moves
        [[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[-1,2],[1,-2],[1,2]]
    end

    def king_moves
        [[1,1,],[1,-1],[-1,1],[-1,-1]] + [[1,0],[0,1],[-1,0],[0,-1]]
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
        raise "implement your own version silly!"
    end

    def grow_unblocked_moves_in_dir(dy,dx)
        res = []
        cur_y, cur_x = pos
        cur_y, cur_x = cur_y + dy, cur_x + dx
        new_pos = [cur_y, cur_x]
        if board.valid_pos?(new_pos)
            if board[new_pos].is_a?(NullPiece)
                res << new_pos
            else
                if board[new_pos].color != self.color
                    res << new_pos
                end
            end
        end
        res
    end

end
