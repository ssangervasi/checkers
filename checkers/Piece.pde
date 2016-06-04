class Piece {
    int owner;
    int is_king;
    float diameter;
    
    Piece (int temp_owner, int temp_is_king) {
      owner = temp_owner;
      is_king = temp_is_king;
    }
    
    void draw_piece(int x_pos, int y_pos, float space_size) {
      if (owner == 0){
      fill(133, 33,108);
      }
      else{
        fill(57, 189,21); 
      }
      ellipse((x_pos*space_size) + (space_size/2), (y_pos * space_size) + (space_size/2),2*space_size/3, 2*space_size/3);
      
    }
    
  }
