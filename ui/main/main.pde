Checkers game;

void setup() {
  int x_size = 800;
  
  game = new Checkers(2,0);
  game.make_board(8, x_size);

  
  size(x_size,x_size);
}

void draw() {
  background(0);
  game.board.draw_board();
  
}

void select_piece(){
    
  }

void move_piece(){
    
  }

void capture_piece(){
    
  }
