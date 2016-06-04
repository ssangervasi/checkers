void setup() {
  
}

void draw() {
  
}

class Checkers {
  Piece[] player_2;
  Piece[] player_1;

  int board_size;
  int turn_clock;

  class Board {
    Space[][] board;

    class Space {
      int x_pos;
      int y_pos;

      Space(int temp_x_pos, int temp_y_pos) {
        x_pos = temp_x_pos;
        y_pos = temp_y_pos;
      }
      
    }

  }

  class Piece {
    int owner;
    int is_king;
    
    Piece(int temp_owner, int temp_is_king) {
      owner = temp_owner;
      is_king = temp_is_king;  
    }
    
  }

  void select_piece(){
    
  }

  void move_piece(){
    
  }

  void capture_piece(){
    
  }

}