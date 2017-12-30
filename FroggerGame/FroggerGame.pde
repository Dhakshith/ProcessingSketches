PImage FroImage;
Frog frog;
PImage CarImage;
PImage OpoImage;
Car[] cars;
PImage LogImage;
Log[] logs;
PImage SafetyLane;
float grid = 50;
float toRotate = 0;

void rotateFrogByDown() {
  toRotate = PI;
}

void rotateFrogByRight() {
  toRotate = HALF_PI;
}

void rotateFrogByLeft() {
  toRotate = (3.0 * PI) / 2;
}

void setup() {
  size(550, 500);
  LogImage = loadImage("Log.png");
  CarImage = loadImage("RaceCar.png");
  OpoImage = loadImage("RaceOpo.png");
  FroImage = loadImage("Frogger.png");
  SafetyLane = loadImage("SafetyLane.jpg");
  frog = new Frog(width / 2, height - grid, grid, toRotate);
  frog.attach(null);
  int index = 0;
  cars = new Car[8];

  //Row 1
  for (int i = 0; i < 2; i++) {
    float x = i * 400;
    cars[index] = new Car(x, height - grid * 2, grid * 4, grid, 2, CarImage);
    index++;
  }

  //Row 2
  for (int i = 0; i < 3; i++) {
    float x = i * 250;
    cars[index] = new Car(x, height - grid * 3, grid * 3, grid, -3.5, OpoImage);
    index++;
  }

  //Row 3
  for (int i = 0; i < 3; i++) {
    float x = i * 300;
    cars[index] = new Car(x, height - grid * 4, grid * 3, grid, 1.25, CarImage);
    index++;
  }

  //initialize
  index = 0;
  logs = new Log[12];

  //Row 4, But Technically 5 !
  for (int i = 0; i < 5; i++) {
    float x = i * width + (i * 10);
    logs[index] = new Log(x, grid * 2, grid * 3, grid, 2.25);
    index++;
  }

  //Row 5, But Technically 6 !
  for (int i = 0; i < 5; i++) {
    float x = i * 180;
    logs[index] = new Log(x, grid * 3, grid * 2, grid, -1.4);
    index++;
  }

  //Row 6, But Technically 7 !
  for (int i = 0; i < 2; i++) {
    float x = i * 300;
    logs[index] = new Log(x, grid * 4, grid * 4, grid, 2.5);
    index++;
  }
}

void draw() {
  background(0);
  fill(186, 85, 211);
  rect(0, grid, width, grid);
  smooth();
  image(SafetyLane, 0, height - grid, width, grid);
  image(SafetyLane, 0, height - grid * 5, width, grid);
  pushMatrix();
  fill(0, 0, 255);
  rect(0, grid * 2, width, grid * 3);
  fill(255, 0, 0);
  rect(0, height - grid, width, - grid * 3);
  fill(50, 255, 10);
  noStroke();
  rect(0, 0, width, grid);
  for (int i = 0; i < 6; i++) {
    rect(grid * i * 2, grid, grid, grid);
  }
  popMatrix();
  for (Car car : cars) {
    car.show();
    car.update();
    if (frog.intersects(car)) {
      frog.resetGame(toRotate);
    }
  }
  for (Log log : logs) {
    log.show();
    log.update();
  }
  if ((frog.y < height - grid * 5 && frog.y >= grid * 2) || frog.y == 0 || ((frog.x == 0 || frog.x == grid * 2 || frog.x == grid * 4 || frog.x == grid * 6 || frog.x == grid * 8 || frog.x == grid * 10) && frog.y <= grid)) {
    boolean ok = false;
    for (Log log : logs) {
      if (frog.intersects(log)) {
        ok = true;
        frog.attach(log);
      }
    }
    if (!ok) {
      frog.resetGame(toRotate);
    }
  } else {
    frog.attach(null);
  }
  frog.update();
  frog.show();
}

void keyPressed() {
  if (keyCode == UP) {
    frog.move(0, -1);
  } else if (keyCode == DOWN) {
    frog.move(0, 1);
    rotateFrogByDown();
  } else if (keyCode == RIGHT) {
    frog.move(1, 0);
    rotateFrogByRight();
  } else if (keyCode == LEFT) {
    frog.move(-1, 0);
    rotateFrogByLeft();
  }
}