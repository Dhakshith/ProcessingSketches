class Puck {
  float heigh = height;
  float x = width / 2;
  float y = heigh / 2;
  float XSpeed;
  float YSpeed;
  float radius = 20.0;
  
  Puck() {
    Reset();
  }
  
  void checkPaddleLeft(Paddle P) {
    if (y - radius / 2 < P.y + P.h / 2 && y + radius / 2 > P.y - P.h / 2 && x - radius / 2 < P.x + P.w / 2) {
      if (x + radius / 2 > P.x - P.w / 2) {
        float Diff = (y + radius / 2) - (P.y - P.h / 2) * 0.5;
        XSpeed = 5 * cos(Diff);
        YSpeed = 5 * sin(Diff);
        x = P.x + P.w / 2 + (radius / 2);
      }
    }
  }
  
  void checkPaddleRight(Paddle P) {
    if (y - radius / 2 < P.y + P.h / 2 && y + radius / 2 > P.y - P.h / 2 && x + radius / 2 > P.x - P.w / 2) {
      if (x - radius / 2 < P.x + P.w / 2) {
        float Diff = (y + radius / 2) - (P.y - P.h / 2) * 0.5;
        XSpeed = 5 * cos(Diff);
        YSpeed = 5 * sin(Diff);
        x = P.x - P.w / 2 - (radius / 2);
      }
    }
  }
  
  void update() {
    x += XSpeed;
    y += YSpeed;
  }
  
  void Reset() {
    float angle = random(-QUARTER_PI, QUARTER_PI);
    x = width / 2;
    y = heigh / 2;
    XSpeed = 5 * cos(angle);
    YSpeed = 5 * sin(angle);
  }
  
  void edges() {
    if (y - radius / 2 < 0 || y + radius / 2 > height) {
      YSpeed = - YSpeed;
    }
    if (x + radius / 2 >= width) {
      ScoreSound.play();
      ScoreSound.amp(0.1);
      LeftScore++;
      Reset();
    }
    if (x - radius / 2 <= 0) {
      ScoreSound.play();
      ScoreSound.amp(0.1);
      RightScore++;
      Reset();
    }
  }
  
  void show() {
    fill(255);
    ellipseMode(CENTER);
    ellipse(x, y, radius, radius);
  }
}