class Piece {
    int owner;
    boolean isKing;
    boolean isSelected;
    float diameter;
    
    Piece (int owner, boolean isKing) {
      this.owner = owner;
      this.isKing = isKing;
      this.isSelected = false;
    }
    
    void drawPiece(int xPos, int yPos, float spaceSize) {
      if(isSelected) {
        fill(11,14,217);  
      } else if (owner == Rules.PLAYER_NONE) {
        fill(133, 33,108);
      } else {
        fill(57, 189,21); 
      }
      noStroke();
      // TODO(Nickie): Clarify these magic numbers
      ellipse((xPos*spaceSize) + (spaceSize/2),
              (yPos * spaceSize) + (spaceSize/2),
              2*spaceSize/3,
              2*spaceSize/3);
      
    }
    
    void selectPiece() {
      isSelected = true;  
    }
    
  }
