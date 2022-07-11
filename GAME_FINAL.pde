Game game;
Player player; 
GameState currentState = GameState.SPLASHSCREEN;
public boolean alive = true;
int timePassed, timeBegin; 
CountDown timer;
void setup() {
  timeBegin = millis()/1000;
  game = new Game();
  size(672, 832);
  frameRate(30);
  timer = new CountDown(60);
}

void draw() {
  if (keyPressed) {

    
    currentState = GameState.PLAYING;
  }
  if (!alive) {
    currentState = GameState.ENDSCREEN;
  }
  
  timePassed = (millis()/1000) - timeBegin;
  background(0);
  game.gameState(currentState);
}
