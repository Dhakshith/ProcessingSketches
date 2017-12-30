class Frog extends Rectangle {  
  Log attached = null;
  float degree;
  
  Frog(float x, float y, float w, float radian) {
    super(x, y, w, w);
    degree = radian;
  }
  
  void resetGame(float rotatoor) {
    frog = new Frog(width / 2, height - grid, grid, rotatoor);
    frog.attach(null);
  }
  
  void attach(Log log) {
    attached = log;
  }
  
  void update() {
    if (attached != null) {
      frog.x += attached.speed;
    }
    float heigh = height;
    frog.x = constrain(x, 0, width - w);
    frog.y = constrain(y, 0, heigh - w);
  }
  
  void show() {
    fill(0, 255, 0, 200);
    image(FroImage, x, y, w, w);
  }
  
  void move(float XDir, float YDir) {
    x += XDir * grid;
    y += YDir * grid;
    rotate(degree);
  }
}