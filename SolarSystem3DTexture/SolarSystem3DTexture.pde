import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam Cam;
Planet Sun;
PImage SunMap;
PImage[] textures = new PImage[10];

void setup() {
  size(1600, 830, P3D);
  SunMap = loadImage("SunMap.jpg");
  textures[0] = loadImage("MercuryMap.jpg");
  textures[1] = loadImage("VenusMap.jpg");
  textures[2] = loadImage("EarthMap.jpg");
  textures[3] = loadImage("MarsMap.jpg");
  textures[4] = loadImage("JupiterMap.jpg");
  textures[5] = loadImage("SaturnMap.jpg");
  textures[6] = loadImage("UranusMap.jpg");
  textures[7] = loadImage("NeptuneMap.jpg");
  textures[8] = loadImage("PlutoMap.jpg");
  textures[9] = loadImage("MoonMap.jpg");
  Cam = new PeasyCam(this, 500);
  Sun = new Planet(100, 0, 0, SunMap);
  Sun.spawnMoons(9, random(200, 300), 1);
}

void draw() {
  background(0);
  lights();
  Sun.show();
  Sun.orbit();
}