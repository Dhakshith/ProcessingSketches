import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam Cam;

Planet Sun;

void setup() {
  size(1600, 830, P3D);
  Cam = new PeasyCam(this, 500);
  Sun = new Planet(100, 0, 0);
  Sun.spawnMoons(8, random(200, 300), 1);
}

void draw() {
  background(0);
  lights();
  Sun.show();
  Sun.orbit();
}