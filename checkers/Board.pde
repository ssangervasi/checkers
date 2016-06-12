
class Board {
  Space[][] board;
  Space src;
  Space dest;
  Space dest;
  Space hovered;
  int numSquares;
  int sideSize;
  float spaceSize;
  
  Board(int numSquares, int sideSize) {
   this.numSquares = numSquares;
   this.sideSize = sideSize;
   spaceSize = sideSize/ numSquares;
   board = new Space[numSquares][numSquares];
 
   for (int x = 0; x < numSquares; x += 1) {
     for (int y = 0; y < numSquares; y += 1) {
       if (y == 0 || y == 1) {
         board[x][y] = new Space(x,y,0); 
       } else if (y == numSquares - 1  || y == numSquares - 2 ) {
         board[x][y] = new Space(x,y,1); 
       } else{
         board[x][y] = new Space(x,y,2);   
       }
     }
   }  
  }
 
  void drawBoard() {
    for (int x = 0; x < numSquares; x += 1) {
      for (int y = 0; y < numSquares; y += 1) {
        if(board[x][y].isSelected) {
          fill(217,11,35);  
        } else if (board[x][y].isHovered) {
          fill(131,131,131);
        } else if ((x % 2 == 0 && y % 2 == 0) || (x % 2 == 1 && y % 2 == 1)) {
          fill(0,0,0);
        } else{
          fill(255,255,255);
        }
        rect(x*spaceSize,y*spaceSize,spaceSize,spaceSize);
        Space mySpace = board[x][y];
        if (mySpace.isOccupied) {
          mySpace.occupant.drawPiece(mySpace.xPos, mySpace.yPos, spaceSize);  
        }
      }
    }
  }
  
  int selectSpace(int x, int y, int turn) {
    int endTurn = 0;
    if(board[x][y].isSelected) {
      board[x][y].isSelected = false;
      board[x][y].occupant.isSelected = false;
      if (src == board[x][y]) {
        src.isSelected = false;
        src.occupant.isSelected = false;
        src = null;  
        if (dest != null) {
          dest.isSelected = false;
          dest = null;  
        }
      } else if(dest == board[x][y]) {
        dest.isSelected = false;
        dest = null;  
      }  
    } else {
      if (src == null && dest == null) {
        if (board[x][y].isOccupied && (board[x][y].occupant.owner % 2 == turn % 2)) {
          board[x][y].selectSpace();
          src = board[x][y];
        }
      } else if (src != null && dest == null) {
        if(board[x][y].isOccupied) {
          board[x][y].selectSpace();
          dest = board[x][y];
          boolean isValid = checkMove();
          if (isValid) {
            this.dest = dest;
            endTurn = 1;
          } else{
            dest.isSelected = false;
          } 
          dest = null ;
        }
      } else{
        clearSelections();
        if(board[x][y].isOccupied && (board[x][y].occupant.owner % 2 == turn % 2)) {
          board[x][y].selectSpace();
          src = board[x][y];
        }
      }  
    }
    return endTurn;
  }
  
  void clearSelections() {
    if (src != null) {
      src.isSelected = false;
      src.occupant.isSelected = false;
      src = null;
    }
    
    if (dest != null) {
      dest.isSelected = false;
      dest = null; 
    } 
    
  }
  
  void hoverOver(float x, float y) {
    if (hovered != null) {
      hovered.isHovered = false;
      hovered = null;
    }
    int[] coords = new int[2];
    coords = getSpace(x,y);
    Space newHovered = board[coords[0]][coords[1]];
    newHovered.isHovered = true;
    hovered = newHovered;
  }
  
  int[] getSpace(float xPos, float yPos) {
    int[] newSpace = new int [2];
    int xCoord;
    int yCoord;
    
    xCoord = int(xPos / spaceSize);
    yCoord = int(yPos / spaceSize);
    
    newSpace[0] = xCoord;
    newSpace[1] = yCoord;
    return newSpace; 
  
  }
}
