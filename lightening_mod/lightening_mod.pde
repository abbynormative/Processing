import ddf.minim.*;

Minim minim;
AudioSample closeThunder;
AudioSample thunderClap;
AudioSample thunderLong;

float x;
float y;
float diam;
int age = 0;


void setup() {
  size(480, 480);
  diam = 0;
  minim = new Minim(this);
  
  closeThunder = minim.loadSample( "thunder-close.wav",
                                    1024
                                    );
  thunderClap = minim.loadSample( "thunder-clap.wav",
                                    1024
                                    );
  thunderLong = minim.loadSample( "longthunder.wav",
                                    1024
                                    );
}



void draw() {
  display();
  flicker();
}
  
  
 void display(){
   if (age == 0) {
    background(0);
  }
  if (age == 0 && random(100) > 99) {
    x=random(480);
    y=random(480);
    diam=random(480);
    fill(255);
    ellipse(x, y, diam, diam);
    age = int(diam / 15);
    thunder();
  }
 }
    
  void thunder(){
    if (diam > 150 && random(100) > 80){
    thunderLong.trigger();
  }
  if (diam >30 && diam<100 && random(100) > 80){
      closeThunder.trigger();
    }
  if (diam <30 && diam >10 && random(100) > 80){
        thunderClap.trigger();
      }
  }
  
  
  void flicker(){
    if (age > 0) {
    if (age % 2 == 0)
       background(0);
     else
       ellipse(x, y, diam, diam);
    age--;
    }
  }


