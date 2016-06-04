class Checkers {
  AI jonny = new AI(3);
  int all_kings;
  int num_players;
  int turn_clock;
  Board board;
  
  Checkers(int temp_num_players, int temp_all_kings) {
    all_kings = temp_all_kings;
    num_players = temp_num_players;
    turn_clock = 0;
  }
  
  void make_board(int temp_num_squares, int temp_side_size){
    // Sets up the initial game state by:
    // Making a board
    // Creating the initial pieces
    
    board = new Board(temp_num_squares, temp_side_size); 
  }

  class Board {
    Space[][] board;
    int num_squares;
    int side_size;
    float space_size;
    
    Board(int temp_num_squares, int temp_side_size) {
     num_squares = temp_num_squares;
     side_size = temp_side_size;
     space_size = side_size/ num_squares;
     board = new Space[num_squares][num_squares];
   
     for (int x = 0; x < num_squares; x += 1){
       for (int y = 0; y < num_squares; y += 1){
         if (y == 0 || y == 1){
           board[x][y] = new Space(x,y,0); 
         }
         else if (y == num_squares - 1  || y == num_squares - 2 ){
           board[x][y] = new Space(x,y,1); 
         }
         else{
           board[x][y] = new Space(x,y,2);   
         }
       }
     }  
    }
   
    void draw_board(){
      for (int x = 0; x < num_squares; x += 1){
        for (int y = 0; y < num_squares; y += 1){
          if ((x % 2 == 0 && y % 2 == 0) || (x % 2 == 1 && y % 2 == 1)){
            fill(0,0,0);
          }
          else{
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

    class Space {
      int x_pos;
      int y_pos;
      int is_occupied;
      Piece occupant;

      Space(int temp_x_pos, int temp_y_pos, int temp_is_occupied) {
        x_pos = temp_x_pos;
        y_pos = temp_y_pos;
        
        if (temp_is_occupied == 1 || temp_is_occupied == 0){
          occupant = new Piece(0, temp_is_occupied, 50);
          is_occupied = 1;
        }
        else{
          is_occupied = 0;  
        }
      
    }
  }
  
  }
}
