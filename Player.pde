class Player {
  float x, y, size, xSpeed, ySpeed;


  Player(int x, int y, int size, int xSpeed, int ySpeed) {
    this.x = x;
    this.y = y;
    this.size=size;
    this.xSpeed = xSpeed*0.9;
    this.ySpeed = ySpeed*0.9;
  }

  public float getX() {
    return this.x;
  }
  public float getY() {
    return this.y;
  }

  void update() {
    move();
    render();
  }

  void render() {

    fill(random(255), random(255), random(255));
    rect(x, y, size, size);
    fill(random(255), random(255), random(255), 100);
    rect(x-5, y-5, size, size);
    rect(x+5, y+5, size, size);
    rect(x+5, y-5, size, size);
    rect(x-5, y+5, size, size);
    noFill();
  }


  void move() {

    //if key is pressed and recognised as koded
    if (keyPressed && key == CODED) {
      //if key is right keybaord arrow and is thee horizontal position is less than the total width of the screen - the size of the character:
      //stopping the character from going off the screen to the right
      if (keyCode == RIGHT && this.x < width-32) {
            render();

        this.x += this.xSpeed;
      } //same as last one for left arrow, but stopping from it from the left
      if (keyCode == LEFT && this.x > 10) {
            render();

        this.x -= this.xSpeed;
      }//same for top of the screen
      if (keyCode == DOWN && this.y < 800) {
            render();

        this.y += this.ySpeed;
      }//same for bottom of the screen
      if (keyCode == UP && this.y > 15) {
            render();

        this.y -= this.ySpeed;
      }
    }
  }
}
