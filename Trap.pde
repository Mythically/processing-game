class Trap extends Tile {
  Trap(int x, int y, int size) {
   super(x,y,size);
   rect(x,y,size,size);
  }
  
  
 
  void renderTrap(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    fill(255,0,0);
    rect(x,y,size,size);
    noFill();
    
  }
  
  
  
}
