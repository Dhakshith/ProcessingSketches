class Car extends Rectangle { 
  float speed;
  PImage C;
  
  Car(float x, float y, float w, float h, float s, PImage CarImg) {
    super(x, y, w, h);    
    speed = s;
    C = CarImg;
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
    image(C, x, y, w, h);
  }
}