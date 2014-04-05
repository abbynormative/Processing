float r;
float g;
float b;
float a;
float diam;
float x;
float y;


void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(20);
}

void draw(){
  
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=mouseX;
  x=random(mouseX);
  y=random(mouseY);
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}
  


