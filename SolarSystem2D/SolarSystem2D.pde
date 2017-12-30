Planet Sun;

void setup() {
  size(1600, 830);
  Sun = new Planet(100, 0, 0);
  Sun.spawnMoons(5, 250, 1);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  Sun.show();
  Sun.orbit();
}