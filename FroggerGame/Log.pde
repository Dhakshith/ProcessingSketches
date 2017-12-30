class Log extends Rectangle {
  float speed;
  
  Log(float x, float y, float w, float h, float s) {
    super(x, y, w, h);    
    speed = s;
  }
  
  void update() {
    x += speed;
    float FOUR_GRID = grid * 4;
    
    if (speed > 0 && x > width + FOUR_GRID) {
      x = - FOUR_GRID;
    } else if (speed < 0 && x < - FOUR_GRID) {
      x = width + FOUR_GRID;
    }
  }
  
  void show() {
    fill(200);
    image(LogImage, x, y, w, h);
  }
}