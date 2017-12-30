import processing.sound.*;

Puck puck;

SoundFile ScoreSound;

Paddle Left;
Paddle Right;

int LeftScore = 0;
int RightScore = 0;
int y = 55;

void setup() {
  size(600, 400);
  ScoreSound = new SoundFile(this, "Ding.mp3");
  puck = new Puck();
  Left = new Paddle(0);
  Right = new Paddle(width);
}

void draw() {
  background(0);
  noStroke();
 
  for (int x = 0; x < width; x += 6) {
    stroke(-(x + y >> 1 & 1));
    line(x, y, x + 5, y);
  }
 
  for (int y = 0; y < width; y += 6) {
    stroke(-((width / 2) + y >> 1 & 1));
    line(width / 2, y, width / 2, y + 5);
  }
  
  puck.update();
  puck.edges();
  puck.show();
  
  puck.checkPaddleRight(Right);
  puck.checkPaddleLeft(Left);
  
  Left.update();
  Left.show();
  Left.y = puck.y;
  
  Right.update();
  Right.show();
  Right.y = mouseY;
  
  fill(255);
  textSize(32);
  text(LeftScore, width / 4, 40);
  text(RightScore, width * 0.75, 40);
}