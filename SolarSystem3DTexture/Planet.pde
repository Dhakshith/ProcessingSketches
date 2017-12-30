class Planet {
  float radius;
  float angle;
  float Distance;
  float OrbitSpeed;
  PVector v;
  Planet[] planets;
  PShape globe;
  
  Planet(float r, float d, float o, PImage texture) {
    v = PVector.random3D();
    radius = r;
    Distance = d;
    v.mult(Distance);
    angle = random(TWO_PI);
    OrbitSpeed = o;
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(texture);
  }
  
  void orbit() {
    angle += OrbitSpeed;
    
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnMoons(int total, float Dista, int level) {
    planets = new Planet[total];
    float number = radius / 3.5;
    int index = -1;
    
    for (int i = 0; i < planets.length; i++) {
      if (index < textures.length - 1) {
        index += 1;
      }
      
      PImage PlaneTexture = textures[index];
      
      if (level == 2) {
        PlaneTexture = textures[9];
      }
      
      planets[i] = new Planet(number, Dista, random(0.010, 0.020), PlaneTexture);
      
      if (level < 2) {
        planets[i].spawnMoons(1, number * 2, level + 1);
      }
    }
  }
  
  void show() {
    pushMatrix();
    
    fill(255);
    stroke(255);
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    
    // line(0, 0, 0, v.x * 10, v.y * 10, v.z * 10);
    // line(0, 0, 0, p.x * 10, p.y * 10, p.z * 10);
    
    translate(v.x, v.y, v.z);
    noStroke();
    
    // sphere(radius);
    
    shape(globe);
    
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
  }
}