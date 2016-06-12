
class Board {
  Space[][] board;
  Space src;
  Space dest;
  Space temp_dest;
  Space hovered;
  int num_squares;
  int side_size;
  float space_size;
  
  Board(int temp_num_squares, int temp_side_size) {
   num_squares = temp_num_squares;
   side_size = temp_side_size;
   space_size = side_size/ num_squares;
   board = new Space[num_squares][num_squares];
 
   for (int x = 0; x < num_squares; x += 1) {
     for (int y = 0; y < num_squares; y += 1) {
       if (y == 0 || y == 1) {
         board[x][y] = new Space(x,y,0); 
       } else if (y == num_squares - 1  || y == num_squares - 2 ) {
         board[x][y] = new Space(x,y,1); 
       } else{
         board[x][y] = new Space(x,y,2);   
       }
     }
   }  
  }
 
  void draw_board() {
    for (int x = 0; x < num_squares; x += 1) {
      for (int y = 0; y < num_squares; y += 1) {
        if(board[x][y].is_selected == 1) {
          fill(217,11,35);  
        } else if (board[x][y].is_hovered == 1) {
          fill(131,131,131);
        } else if ((x % 2 == 0 && y % 2 == 0) || (x % 2 == 1 && y % 2 == 1)) {
          fill(0,0,0);
        } else{
          fill(255,255,255);
        }
        rect(x*space_size,y*space_size,space_size,space_size);
        Space my_space = board[x][y];
        if (my_space.is_occupied == 1) {
          my_space.occupant.draw_piece(my_space.x_pos, my_space.y_pos, space_size);  
        }
      }
    }
  }
  
  int select_space(int x, int y, int turn) {
    int end_turn = 0;
    if(board[x][y].is_selected == 1) {
      board[x][y].is_selected = 0;
      board[x][y].occupant.is_selected = 0;
      if (src == board[x][y]) {
        src.is_selected = 0;
        src.occupant.is_selected = 0;
        src = null;  
        if (dest != null) {
          dest.is_selected = 0;
          dest = null;  
        }
      } else if(dest == board[x][y]) {
        dest.is_selected = 0;
        dest = null;  
      }  
    } else {
      if (src == null && dest == null) {
        if (board[x][y].is_occupied == 1 && (board[x][y].occupant.owner % 2 == turn % 2)) {
          board[x][y].select_space();
          src = board[x][y];
        }
      } else if (src != null && dest == null) {
        if(board[x][y].is_occupied == 0) {
          board[x][y].select_space();
          temp_dest = board[x][y];
          int is_valid = check_move();
          if (is_valid == 1) {
            dest = temp_dest;
            end_turn = 1;
          } else{
            temp_dest.is_selected = 0;
          } 
          temp_dest = null ;
        }
      } else{
        clear_selections();
        if(board[x][y].is_occupied == 1 && (board[x][y].occupant.owner % 2 == turn % 2)) {
          board[x][y].select_space();
          src = board[x][y];
        }
      }  
    }
    return end_turn;
  }
  
  void clear_selections() {
    if (src != null) {
      src.is_selected = 0;
      src.occupant.is_selected = 0;
      src = null;
    }
    
    if (dest != null) {
      dest.is_selected = 0;
      dest = null; 
    } 
    
  }
  
  void hover_over(float x, float y) {
    if (hovered != null) {
      hovered.is_hovered = 0;
      hovered = null;
    }
    int[] coords = new int[2];
    coords = get_space(x,y);
    Space new_hovered = board[coords[0]][coords[1]];
    new_hovered.is_hovered = 1;
    hovered = new_hovered;
  }
  
  int[] get_space(float x_pos, float y_pos) {
    int[] new_space = new int [2];
    int x_coord;
    int y_coord;
    
    x_coord = int(x_pos / space_size);
    y_coord = int(y_pos / space_size);
    
    new_space[0] = x_coord;
    new_space[1] = y_coord;
    return new_space; 
  
  }
}
