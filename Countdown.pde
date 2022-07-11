class CountDown
{

  int getRemainingTime;
  int durationSeconds;
  int time;
  boolean timeremaining = true;
  

  CountDown(int duration)
  {
    this.durationSeconds = duration;
  }

  public int getRemainingTime() //return the seconds left on the timer or 0
  { //millis() processing command, returns time in 1000ths sec since program started
    return max(0, durationSeconds - millis()/1000);
  }



  CountDown timer; //declare instance variable of CountDown
}
