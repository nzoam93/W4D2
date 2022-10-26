require_relative 'piece'
module Slideable 
    HORIZONTAL_DIRS = [[-1,0],[1,0], [0,-1], [0,1] ]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,-1], [-1, 1]]

    def moves(start_pos) 
        i, j = start_pos
        possible_moves = []
        temp = 5
        #checking to see if it's out of bounds for HORIZONTAL
        until temp < 0 #moving left
            possible_moves << [start_pos[0] + HORIZONTAL_DIRS[0][0], j]
            temp = start_pos[0] + HORIZONTAL_DIRS[0][0]
        end
        # until i > 7 #moving right
        #     possible_moves << [start_pos[0] + HORIZONTAL_DIRS[1][0], j]   
        # end
        # until j < 0
        #     possible_moves << [i, start_pos[1] + HORIZONTAL_DIRS[2][1]]
        # end
        # until j > 7
        #     possible_moves << [i, start_pos[1] + HORIZONTAL_DIRS[3][1]]
        # end

        #  #checking to see if it's out of bounds for DIAGONAL
        # until i > 7 || j > 7 #moving down right
        #     possible_moves << [start_pos[0] + DIAGONAL_DIRS[0][0], start_pos[1] + DIAGONAL_DIRS[0][1]]
        # end

        # until i > 7 || j < 0 #moving down left
        #     possible_moves << [start_pos[0] + DIAGONAL_DIRS[1][0], start_pos[1] + DIAGONAL_DIRS[1][1]]
        # end

        # until i < 0 || j < 0 #moving up left
        #     possible_moves << [start_pos[0] + DIAGONAL_DIRS[2][0], start_pos[1] + DIAGONAL_DIRS[2][1]]
        # end

        # until i < 0 || j > 7 #moving up right
        #     possible_moves << [start_pos[0] + DIAGONAL_DIRS[3][0], start_pos[1] + DIAGONAL_DIRS[3][1]]
        # end
#  we still need to check if piece  is there
        return possible_moves
    end

end
