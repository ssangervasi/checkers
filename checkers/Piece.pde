class Piece {
    int owner;
    int is_king;
    int is_selected;
    float diameter;
    
    Piece (int temp_owner, int temp_is_king) {
      owner = temp_owner;
      is_king = temp_is_king;
      is_selected = 0;
    }
    
    void draw_piece(int x_pos, int y_pos, float space_size) {
      if(is_selected == 1){
        fill(11,14,217);  
      }
      else if (owner == 0){
      fill(133, 33,108);
      }
      else{
        fill(57, 189,21); 
      }
      noStroke();
      ellipse((x_pos*space_size) + (space_size/2), (y_pos * space_size) + (space_size/2),2*space_size/3, 2*space_size/3);
      
    }
    
    void select_piece(){
      is_selected = 1;  
    }
    
  }
