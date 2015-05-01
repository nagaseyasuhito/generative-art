void setup() {
  size(2720, 720, OPENGL);
  frameRate(30);
  background(0);

  smooth(4);
  fill(0);
  blendMode(ADD);
  strokeWeight(1);
}

int counter;

void draw() {
  float c = counter++ / 1000.0;
  for(int i = 1; i <= 8; i++) {
    float r = noise('r', i, c * 10) * 12;
    float g = noise('g', i, c * 10) * 12;
    float b = noise('b', i, c * 10) * 12;
    stroke(r, g, b);

    float px = i * width / 1000.0;
    float py = i * height / 1000.0;
    beginShape();
    for(int j = 1; j <= 20; j++) {
      float d = i * j / 100.0;
      float x = noise(px, d, c) * width * 2 - width;
      float y = noise(py, d, c) * height * 2 - height;
      curveVertex(width / 2 + x, height / 2 + y);
    }
    endShape();
  }

//  saveFrame("light-curve-######.png");
}
