float angle = 0;
float Angle;
int MouseCount = 0;
ArrayList<Box> sponge;

void setup() {
  size(1600, 825, P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0, 0, 0, 320);
  sponge.add(b);
}

void mousePressed() {
  MouseCount += 1;
  if (MouseCount <= 3) {
    ArrayList<Box> next = new ArrayList<Box>();
    for (Box b: sponge) {
      ArrayList<Box> newBoxes = b.generate();
      next.addAll(newBoxes);
    }
    sponge = next;
  }
}

void draw() {
  Angle = angle * 0.4;
  
  background(51);
  stroke(255);
  noFill();
  lights();
  
  translate(width / 2, height / 2);
  rotateX(Angle);
  rotateY(Angle);
  rotateZ(Angle * 2);
  
  angle += 0.01;
  
  for (Box b: sponge) {
    b.show();
  }
}