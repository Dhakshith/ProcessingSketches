class Planet {
  float radius;
  float angle;
  float Distance;
  float OrbitSpeed;
  Planet[] planets;
  
  Planet(float r, float d, float o) {
    radius = r;
    Distance = d;
    angle = random(TWO_PI);
    OrbitSpeed = o;
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
    float number = radius / 0.75;
    
    for (int i = 0; i < planets.length; i++) {
      if (level == 1) {
        number = radius / 4;
      } else if (level == 2) {
        number = 15;
      } else if (level == 3) {
        number = radius / 2.5;
      }
      
      planets[i] = new Planet(number, Dista, random(0.010, 0.020));
      
      if (level < 3) {
        planets[i].spawnMoons(1, number * 2, level + 1);
      }
    }
  }
  
  void show() {
    pushMatrix();
    
    fill(255, 100);
    noStroke();
    rotate(angle);
    translate(Distance, 0);
    ellipse(0, 0, radius * 2, radius * 2);
    
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
  }
}