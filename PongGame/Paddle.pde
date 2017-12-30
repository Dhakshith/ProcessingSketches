class Paddle {
  float x;
  float y = height / 2;
  float w = 10;
  float h = w * 10;
  float s = 0;

  Paddle(float X) {
    float a = w;
    
    if (X == width) {
      a = -a;
    } else if (X == 0) {
      a = w;
    }
    
    x = X + a;
  }
  
  void update() {
    y += s;
    y  = constrain(y, h / 2, height - h / 2);
  }
  
  void show() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}