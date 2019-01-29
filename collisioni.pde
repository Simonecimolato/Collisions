int k = 1;

int dim = 100;

float v1 = 0;
float v2 = -2;
float m1 = 1;
float m2 = 1;//pow(100, k);

int count = 0;

float v1Prev = v1;
float v2Prev = v2;

float posx1 = 200;  
float posx2 = 600;

void setup() {
  size(800, 600);
  stroke(255);
  strokeWeight(3);
  noFill();
  textSize(20);
}

void draw() {
  background(51);
  text("Collisions: " + count, width * 8/10, height/10);
  text("m1: " + (int)m1, width * 4/10, height/10);
  text("m2: " + (int)m2, width * 6/10, height/10);

  
  if (posx2 - dim <= posx1) {
    v1 = ((m1 - m2)/(m1 + m2)) * v1Prev + ((2*m2)/(m1+m2))* v2Prev;
    v2 = ((2*m1)/(m1 + m2)) * v1Prev + ((m2 - m1)/(m1 + m2))* v2Prev;
    count++;
  }

  if (posx1 <= width/12){
    v1 *= -1;
    count++;
  }
  
  v1Prev = v1;
  v2Prev = v2;

  posx1 = posx1 +v1;
  posx2 = posx2 +v2;

  rect(posx1, height*9/12, dim, dim);
  rect(posx2, height*9/12, dim, dim);

  axes();
}

void axes() {
  line(width/12, 0, width/12, height);
  line(0, height*11/12, width, height*11/12);
}
