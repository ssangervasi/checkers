class CheckersGame {
  AI jonny = new AI(3);
  int all_kings;
  int num_players;
  int turn_clock;
  Board board;
  
  CheckersGame(int temp_num_players, int temp_all_kings) {
    all_kings = temp_all_kings;
    num_players = temp_num_players;
    turn_clock = 0;
  }
  
  void make_board(int temp_num_squares, int temp_side_size) {
    // Sets up the initial game state by:
    // Making a board
    // Creating the initial pieces
    
    board = new Board(temp_num_squares, temp_side_size); 
  }
  
}


