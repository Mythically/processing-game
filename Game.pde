class Game {
  Tile tile;
  Trap trap;
  Player player = new Player(320, height-32, 20, 16, 16);
  Enemy enemy = new Enemy(0, 0, 25, 5, 5);
  public int score;


  ArrayList<Trap> puddleList = new ArrayList<Trap>();
  ArrayList<Trap> trapList = new ArrayList<Trap>();
  ArrayList<Tile> boosterList = new ArrayList<Tile>();
  ArrayList<Tile> wallList = new ArrayList<Tile>();

  // checks game states 
  public void gameState(GameState currentState) {
    switch(currentState) {
    case SPLASHSCREEN:
      splashScreen();
      break;
    case PLAYING:
      timeCheck();
      textSize(15);
      text(timer.getRemainingTime+timePassed + "seconds", 70, 20);
      drawMap();
      loadBoosters();
      loadWall();
      loadTrap();
      loadPuddle();
      collisionTrap();
      collisionBooster();
      collisionWall();
      collisionPuddle();
      player.update();
      enemy.update();
      drawScore();

      break;
    case ENDSCREEN:
      endScreen();

      break;
    }
  }

  void splashScreen() {
    fill(0);
    rect(0, 0, width, height);
    noFill();

    fill(255);
    textSize(15);
    text("You're, a discosquare, everything you touch will be disco, except for teal, it likes green.",10,50);
    text("Collect points if you want to, the game will end either way. You have 60 seconds to live...  ", 10, 100);
    text("or until you're caught, or step on a RED trap.. Controls are the arrow keys", 10, 150);
    text("YELLOW = 1pts,  BLUE = 2pts, TEAL = 200pts(teals never end)", 10, 200);
    text("You can stay in one place and collect points, but beware of THE CIRCLE",10,250);
    text("Press any key to start playing", 10, 300);
  }

  void endScreen() {
    fill(random(50), random(50), random(50));
    rect(0, 0, 672, 832);
    noFill();
    fill(255);
    textSize(20);
    text("Yay, game is over, so much fun", width/2, height/2);
    text("Highscore:" + score + " pts", width/2, height/2+20);
  }

  void timeCheck() {
    if (timer.getRemainingTime+timePassed >= 60) {
      alive = false;
    }
  }
  //for reach instance in the ArrayList do the following: checks for collision & removes instance if true
  boolean collisionPuddle() {
    for (Tile tile : puddleList) {
      if (abs(player.getX() - tile.x) < 25) {
        if (abs(player.getY() - tile.y) < 25) {
          tile.renderPuddle2(tile.getX(), tile.getY(), tile.getSize());
          puddleList.remove(tile);
          score += 2;
          print("puddle collision, ");
          return true;
        }
      }
    }
    return false;
  }
  boolean collisionBooster() {
    for (Tile booster : boosterList) {
      if (abs(player.getX() - booster.x) < 25) {
        if (abs(player.getY() - booster.y) < 25) {
          booster.renderBooster2(booster.getX(), booster.getY(), booster.getSize());
          boosterList.remove(booster);
          score+=1;
          print("booster collision, ");
          return true;
        }
      }
    }
    return false;
  }
  boolean collisionTrap() {
    for (Trap trap : trapList) {
      if (abs(player.getX() - trap.x) < 25) {
        if (abs(player.getY() - trap.y) < 25) {
          print("trap collision, ");
          alive = false;
          return true;
        }
      }
    }
    return false;
  }
  boolean collisionWall() {
    for (Tile wall : wallList) {
      if (abs(player.getX() - wall.x) < 25) {
        if (abs(player.getY() - wall.y) < 25) {          
          color col = get(wall.getX(), wall.getY());
          if (col == color(0, 255, 255)) {
            wallList.remove(wall);
            score+=200;
            wall.renderWall2(wall.getX(), wall.getY(), wall.getSize());
          }
          print("wall collision, ");
          return true;
        }
      }
    }
    return false;
  }

  void loadPuddle() {
    int loop = 0;

    for (int y = 4; y <= 12; y+=3) {
      puddleList.add(new Trap(10*32, y*32, 32));
      Tile puddle = puddleList.get(loop);
      puddle.renderPuddle(puddle.getX(), puddle.getY(), puddle.getSize());
      loop++;
    }

    for (int y = 14; y <= 20; y+=3) {
      puddleList.add(new Trap(10*32, y*32, 32));
      Tile puddle = puddleList.get(loop);
      puddle.renderPuddle(puddle.getX(), puddle.getY(), puddle.getSize());
      loop++;
    }

    for (int x = 2; x < 9; x+=3) {
      puddleList.add(new Trap(x*32, 12*32, 32));
      Tile puddle = puddleList.get(loop);
      puddle.renderPuddle(puddle.getX(), puddle.getY(), puddle.getSize());
      loop++;
    }

    for (int x = 12; x < 21; x+=3) {
      puddleList.add(new Trap(x*32, 12*32, 32));
      Tile puddle = puddleList.get(loop);
      puddle.renderPuddle(puddle.getX(), puddle.getY(), puddle.getSize());
      loop++;
    }

    puddleList.add(new Trap(4*32, 0*32, 32));
    Tile puddle1 = puddleList.get(loop);
    puddle1.renderPuddle(puddle1.getX(), puddle1.getY(), puddle1.getSize());
    loop++;
    puddleList.add(new Trap(0*32, 5*32, 32));
    Tile puddle2 = puddleList.get(loop);
    puddle2.renderPuddle(puddle2.getX(), puddle2.getY(), puddle2.getSize());
    loop++;
    puddleList.add(new Trap(4*32, 8*32, 32));
    Tile puddle3 = puddleList.get(loop);
    puddle3.renderPuddle(puddle3.getX(), puddle3.getY(), puddle3.getSize());
    loop++;
    puddleList.add(new Trap(16*32, 3*32, 32));
    Tile puddle4 = puddleList.get(loop);
    puddle4.renderPuddle(puddle4.getX(), puddle4.getY(), puddle4.getSize());
    loop++;
    puddleList.add(new Trap(6*32, 11*32, 32));
    Tile puddle5 = puddleList.get(loop);
    puddle5.renderPuddle(puddle5.getX(), puddle5.getY(), puddle5.getSize());
    loop++;
    puddleList.add(new Trap(14*32, 13*32, 32));
    Tile puddle6 = puddleList.get(loop);
    puddle6.renderPuddle(puddle6.getX(), puddle6.getY(), puddle6.getSize());
    loop++;
    puddleList.add(new Trap(16*32, 22*32, 32));
    Tile puddle7 = puddleList.get(loop);
    puddle7.renderPuddle(puddle7.getX(), puddle7.getY(), puddle7.getSize());
    loop++;
  }



  void loadTrap() { 
    int loop = 0;
    for (int x = 2; x <= 18; x+=16) {
      for (int y = 3; y <= 21; y+=18) {
        trapList.add(new Trap(x*32, y*32, 32));
        Trap trap = trapList.get(loop);
        trap.renderTrap(trap.getX(), trap.getY(), trap.getSize());
        loop++;
      }
    }
    for (int x = 1; x <= 19; x+=18) {
      for (int y = 4; y <= 20; y+=16) {
        trapList.add(new Trap(x*32, y*32, 32));
        Trap trap = trapList.get(loop);
        trap.renderTrap(trap.getX(), trap.getY(), trap.getSize());
        loop++;
      }
    }
    for (int x = 9; x <= 11; x+=2) {
      for (int y = 4; y <= 12; y+=3) {
        trapList.add(new Trap(x*32, y*32, 32));
        Trap trap = trapList.get(loop);
        trap.renderTrap(trap.getX(), trap.getY(), trap.getSize());
        loop++;
      }
    }
    for (int x = 9; x <= 11; x+=2) {
      for (int y = 14; y <= 20; y+=3) {
        trapList.add(new Trap(x*32, y*32, 32));
        Trap trap = trapList.get(loop);
        trap.renderTrap(trap.getX(), trap.getY(), trap.getSize());
        loop++;
      }
    }
    for (int x = 12; x <= 18; x+=3) {
      for (int y = 11; y <= 13; y+=2) {
        trapList.add(new Trap(x*32, y*32, 32));
        Trap trap = trapList.get(loop);
        trap.renderTrap(trap.getX(), trap.getY(), trap.getSize());
        loop++;
      }
    }
    for (int x = 2; x < 11; x+=3) {
      for (int y = 11; y <= 13; y+=2) {
        trapList.add(new Trap(x*32, y*32, 32));
        Trap trap = trapList.get(loop);
        trap.renderTrap(trap.getX(), trap.getY(), trap.getSize());
        loop++;
      }
    }
  }


  void loadWall() {
    int loop = 0;

    for (int i = 8; i < 13; i++) {
      wallList.add(new Tile(i*32, 5*32, 32));
      Tile wall = wallList.get(loop);
      wall.renderWall(wall.getX(), wall.getY(), wall.getSize());
      loop++;
    }
    for (int i = 14; i < 18; i++) {
      wallList.add(new Tile(16*32, i*32, 32));
      Tile wall = wallList.get(loop);
      wall.renderWall(wall.getX(), wall.getY(), wall.getSize());
      loop+=1;
    }
    // manually adding objects with unique coordinates, where i cannot use loops :(
    wallList.add(new Tile(19*32, 20*32, 32));
    Tile wall1 = wallList.get(loop);
    wall1.renderWall(wall1.getX(), wall1.getY(), wall1.getSize());
    loop++;
    wallList.add(new Tile(10*32, 8*32, 32));
    Tile wall2 = wallList.get(loop);
    wall2.renderWall(wall2.getX(), wall2.getY(), wall2.getSize());
    loop++;
    wallList.add(new Tile(10*32, 11*32, 32));
    Tile wall3 = wallList.get(loop);
    wall3.renderWall(wall3.getX(), wall3.getY(), wall3.getSize());
    loop++;
    wallList.add(new Tile(9*32, 12*32, 32));
    Tile wall4 = wallList.get(loop);
    wall4.renderWall(wall4.getX(), wall4.getY(), wall4.getSize());
    loop++;
    wallList.add(new Tile(10*32, 13*32, 32));
    Tile wall5 = wallList.get(loop);
    wall5.renderWall(wall5.getX(), wall5.getY(), wall5.getSize());
    loop++;
    wallList.add(new Tile(11*32, 15*32, 32));
    Tile wall6 = wallList.get(loop);
    wall6.renderWall(wall6.getX(), wall6.getY(), wall6.getSize());
    loop++;
    wallList.add(new Tile(11*32, 18*32, 32));
    Tile wall7 = wallList.get(loop);
    wall7.renderWall(wall7.getX(), wall7.getY(), wall7.getSize());
    loop++;
    wallList.add(new Tile(9*32, 18*32, 32));
    Tile wall8 = wallList.get(loop);
    wall8.renderWall(wall8.getX(), wall8.getY(), wall8.getSize());
  }


  void loadBoosters() {
    int loop = 0;
    for (int x = 2; x <= 18; x+=16) {
      for ( int y = 4; y < 20; y++) {
        boosterList.add(new Tile(x*32, y*32, 32));
        Tile booster = boosterList.get(loop);
        booster.renderBooster(booster.getX(), booster.getY(), booster.getSize());
        loop++;
      }
    }
    for (int y = 4; y <= 22; y+=16) {
      for ( int x = 2; x <= 18; x++) {
        boosterList.add(new Tile(x*32, y*32, 32));
        Tile booster = boosterList.get(loop);
        booster.renderBooster(booster.getX(), booster.getY(), booster.getSize());
        loop++;
      }
    }

    for (int x = 5; x <= 15; x+=10) {
      for (int y = 7; y < 17; y+=1 ) {
        boosterList.add(new Tile(x*32, y*32, 32));
        Tile booster = boosterList.get(loop);
        booster.renderBooster(booster.getX(), booster.getY(), booster.getSize());
        loop++;
      }
    }
    for (int x = 5; x <= 15; x+=1) {
      for (int y = 7; y <= 17; y+=10 ) {
        boosterList.add(new Tile(x*32, y*32, 32));
        Tile booster = boosterList.get(loop);
        booster.renderBooster(booster.getX(), booster.getY(), booster.getSize());
        loop++;
      }
    }
    for (int x = 8; x <= 12; x+=1) {
      for (int y = 10; y <= 14; y+=4 ) {
        boosterList.add(new Tile(x*32, y*32, 32));
        Tile booster = boosterList.get(loop);
        booster.renderBooster(booster.getX(), booster.getY(), booster.getSize());
        loop++;
      }
    }
    for (int x = 8; x <= 12; x+=4) {
      for (int y = 10; y <= 14; y+=1 ) {
        boosterList.add(new Tile(x*32, y*32, 32));
        Tile booster = boosterList.get(loop);
        booster.renderBooster(booster.getX(), booster.getY(), booster.getSize());
        loop++;
      }
    }
  }

  void drawScore() {
    text(score + "pts", 10, 20);
  }

  void drawMap() {
    //fill(0, 128, 128);
    //rect(10*32, 3*32, 32, 32);
    //noFill();
    stroke(100);
    for (int x = 0; x <= 672; x+=32) {
      for (int y = 0; y <= 832; y+=32) {
        line(x, y, 672, y);
        line(x, y, x, 832);
      }
    }
    noStroke();

    //loadTiles();
  }


  public int Score() {
    return score;
  }
  // draws the map squares
}
