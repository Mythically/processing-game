public class Tile {
  int x, y, size;  


  //overloaded consturctor
  Tile(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  //getters as a reccomnded good practice
  int getX() {
    return this.x;
  }
  int getY() {
    return this.y;
  }
  int getSize() {
    return this.size;
  }

  // draws wall tiles
  void renderWall(int x, int y, int size) {
    fill(0, 255, 255);
    rect(x, y, size, size);
    noFill();
  }

  void renderWall2(int x, int y, int size) {
    fill(0, 255, 0);
    rect(x, y, size, size);
    noFill();
  }
  //draws booster tiles
  void renderBooster(int x, int y, int size) {
    fill(255, 255, 0);
    rect(x, y, size, size);
    noFill();
  }
  void renderBooster2(int x, int y, int size) {
    fill(random(255), random(255), random(255));
    rect(x, y, size, size);
    noFill();
  }
  //draws puddle tiles
  void renderPuddle(int x, int y, int size) {
    fill(0, 0, 255);
    rect(x, y, size, size);
    noFill();
  }
  void renderPuddle2(int x, int y, int size) {
    fill(random(255), random(255), random(255));
    rect(x, y, size, size);
    noFill();
  }
}
