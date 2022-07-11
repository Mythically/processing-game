class Enemy {
  int x, y, size, xSpeed, ySpeed;

  Enemy(int x, int y, int size, int xSpeed, int ySpeed) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
  }
  
  void update() {
   collisionPlayer();
   render();
   move();
  }

  void render() {
    fill(random(255), random(255), random(255));
    circle(x,y,size);
    fill(random(255), random(255), random(255), 100);
    circle(x-5,y-5,size);
    circle(x+5,y+5,size);
    circle(x-5,y+5,size);
    circle(x+5,y-5,size);
    noFill();
  }

  void move() {
    if (game.enemy.x > game.player.getX()) {
      game.enemy.x -= xSpeed;
    }
    if (game.enemy.x < game.player.getX()) {
      game.enemy.x += xSpeed;
    }
    if (game.enemy.y > game.player.getY()) {
      game.enemy.y -= ySpeed;
    }
    if (game.enemy.y < game.player.getY()) {
      game.enemy.y += ySpeed;
    }
  }

  void collisionPlayer() {
    if (abs(game.player.getX() - game.enemy.x) < 10) {
      if (abs(game.player.getY() - game.enemy.y) < 10) {
        alive = false;
      }
    }
  }
}
