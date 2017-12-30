class Box {
  PVector pos;
  float r;
  
  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }
  
  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z);
          float NewR = r / 3;
          if (sum > 1) {
            Box b = new Box(pos.x + x * NewR, pos.y + y * NewR, pos.z + z * NewR, NewR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }
  
  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(255, 204, 0);
    box(r);
    popMatrix();
  }
}