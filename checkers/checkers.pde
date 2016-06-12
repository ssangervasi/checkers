CheckersGame game;

void setup() {
  int xSize = 800;  
  game = new CheckersGame(2,0);
  game.makeBoard(8, xSize);

  
  size(xSize,xSize);
}

void draw() {
  background(0);
  game.board.drawBoard();
  game.board.hoverOver(mouseX,mouseY); 
  
}


void mouseClicked() {
  int[] selected = new int[2];
  int turnEnd = 0;
  selected = game.board.getSpace(mouseX, mouseY);
  
  turnEnd = game.board.selectSpace(selected[0],selected[1], game.turnClock);
  if (turnEnd == 1) {
    game.turnClock += 1;
    game.board.clearSelections();  
  }
}

boolean checkMove() {
  boolean isValid = false;
  int[] srcCoords = new int [2];
  int[] destCoords = new int [2];
  int srcOwner = game.board.src.occupant.owner;
  boolean isSourceKing = game.board.src.occupant.isKing;
  
  srcCoords[0] = game.board.src.xPos;
  srcCoords[1] = game.board.src.yPos;
  destCoords[0] = game.board.dest.xPos;
  destCoords[1] = game.board.dest.yPos;
  
  if (isSourceKing || (srcOwner == 0 && destCoords[1] - srcCoords[1] >= 1) || (srcOwner == 1 && destCoords[1] - srcCoords[1] <= 1)) {
    if (abs(srcCoords[0] - destCoords[0]) == 1) {
      isValid = true;
    }  
  }
  
  
  return isValid;
  
}
