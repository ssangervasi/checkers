Checkers game;

void setup() {
  // Run tests  
  TestAI.test();
  
  int x_size = 800;  
  game = new Checkers(2,0);
  game.make_board(8, x_size);

  
  size(x_size,x_size);
}

void draw() {
  background(0);
  game.board.draw_board();
  game.board.hover_over(mouseX,mouseY);
  
}


void mouseClicked(){
  int[] selected = new int[2];
  int turn_end = 0;
  selected = game.board.get_space(mouseX, mouseY);
  
  turn_end = game.board.select_space(selected[0],selected[1], game.turn_clock);
  if (turn_end == 1){
    game.turn_clock += 1;
    game.board.clear_selections();  
  }
}

int check_move(){
  int is_valid = 0;
  int[] src_coords = new int [2];
  int[] dest_coords = new int [2];
  int src_owner = game.board.src.occupant.owner;
  int src_king = game.board.src.occupant.is_king;
  
  src_coords[0] = game.board.src.x_pos;
  src_coords[1] = game.board.src.y_pos;
  dest_coords[0] = game.board.temp_dest.x_pos;
  dest_coords[1] = game.board.temp_dest.y_pos;
  
  if (src_king == 1 || (src_owner == 0 && dest_coords[1] - src_coords[1] >= 1) || (src_owner == 1 && dest_coords[1] - src_coords[1] <= 1)){
    if (abs(src_coords[0] - dest_coords[0]) == 1){
      is_valid = 1;
    }  
  }
  
  
  return is_valid;
  
}
