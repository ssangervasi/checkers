
class Space {
  int occupiedBy;
  boolean isSelected;
  boolean isHovered;
  Piece occupant;

  Space(int occupiedBy) {
    this.isSelected = false;
    this.occupiedBy = occupiedBy
    
    if (this.occupiedBy != Rules.PLAYER_NONE) {
      this.occupant = new Piece(this.occupiedBy, false);
    }
  }
  
  void selectSpace() {
    this.isSelected = true;
    if (this.occupiedBy != Rules.PLAYER_NONE) {
      occupant.selectPiece();
    }    
  }
}
