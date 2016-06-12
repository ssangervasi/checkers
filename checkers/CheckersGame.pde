class CheckersGame {
  AI jonny = new AI(3);
  int allKings;
  int numPlayers;
  int turnClock;
  Board board;
  
  CheckersGame(int numPlayers, int allkings) {
    this.allKings = allkings;
    this.numPlayers = numPlayers;
    turnClock = 0;
  }
  
  void makeBoard(int numsquares, int sidesize) {
    // Sets up the initial game state by:
    // Making a board
    // Creating the initial pieces
    
    board = new Board(numsquares, sidesize); 
  }
  
}


