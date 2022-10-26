require_relative 'piece'
class Pawn < Piece
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
        @start_pos = pos
    end

    def white_dirs
        [[1,0],[2,0]]
    end

    def black_dirs
        [[-1,0],[-2,0]]
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
        if self.pos == @start_pos
            return white_dirs if self.color == "white"
            return black_dirs if self.color == "black"
        else
            return [white_dirs[0]] if self.color == "white"
            return [black_dirs[0]] if self.color == "black"
        end
    end

    def grow_unblocked_moves_in_dir(dy,dx)
        res = []
        cur_y, cur_x = pos
        cur_y, cur_x = cur_y + dy, cur_x + dx
        new_pos = [cur_y, cur_x]
        if board.valid_pos?(new_pos)
            if board[new_pos].is_a?(NullPiece)
                res << new_pos
            end
        end
        res
    end
end
