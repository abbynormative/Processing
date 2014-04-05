//FallingLine line1;
//FallingLine line2;

FallingLine[] lines;
int count=0;
int max=200;

void setup() {
  size(200, 400);
  background(0);
  frameRate(60);

  lines = new FallingLine[max];
  lines[count]=new FallingLine(random(2));
  count++;

  // line1 = new FallingLine();
  // line2 = new FallingLine(2);
}

void draw() {
  background(0);
  // line1.move();
  // line1.display();
  // line2.move();
  //line2.display();
  if (count<max) {
    // check to see if there are any still falling
    boolean anystillfalling = false;
    for (int i=0; i<count; i++) {
      if (!lines[i].stopped) {
        anystillfalling = true;
        break;
      }
    }
    if (!anystillfalling) {
      lines[count]=new FallingLine(random(2));
      count++;
    }
  }
  for (int i = 0; i<count;i++) {
    lines[i].move();
    lines[i].display();

    if (lines[i].stopped) {
      for (int j=0;j<count;j++) {
        if (j!=i) {
          if (abs(lines[j].getPosition()-lines[i].getPosition()) < 8) {
            lines[j].stopped=true;
          }
        }
      }
    }
  }
}

class Gradient {
 private color c1;
 private color c2;

  Gradient(color c1, color c2) {
     this.c1 = c1;
     this.c2 = c2;
  } 
  
  color getColor(float position) {
    return lerpColor(c1, c2, position);
  }
}
class FallingLine {
  float ypos;
  float r;
  float g;
  float b;
  int y = 0;
  float velocity;
  float acceleration;
  boolean stopped;
  FallingLine() {
    r=random(255);
    g=random(255);
    b=random(255);
    velocity=0;
    acceleration=0.1;
    stopped=false;
  }
  FallingLine(float vel){
    r=random(255);
    g=random(255);
    b=random(255);
    velocity=vel;
    acceleration=0.1;
    stopped=false;
  }   
  void display() {
    strokeWeight(6);
    stroke(r, g, b);
    line(0, ypos, width, ypos);
  }
  float getPosition() {
    return ypos;
  }


  void move() {
    if (!stopped) {
      ypos+=velocity;
      velocity+=acceleration;
      if (ypos>height) {
        ypos=height;
        stopped=true;
      }
    }
  }
}

