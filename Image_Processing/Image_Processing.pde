PImage art;
PImage rose;
PImage saved;

RGBMixer mixer;
Blurrer blur;
Twirler twirl;

void setup() {
 
  size(640, 480); 
  art=loadImage("art.jpg");
  rose=loadImage("rose.png");
  saved= createImage(width,height, RGB);
  
  mixer = new RGBMixer();
  blur = new Blurrer();
  twirl = new Twirler(); 
}

void draw() {
 
  imageMode(CORNER);
  rotate(0);
  image(art,0,0);
  
  if(mixer.tinted == 0) {
    tint(255);
  } else if (mixer.tinted == 1){
    tint(255, 40, 40);
  } else if (mixer.tinted == 2){
    tint(80, 255, 80);
  } else if (mixer.tinted > 2){
    tint(80,80,250);
  }
  
  translate(width/2, height/2);
  imageMode(CENTER);
  rotate(twirl.rot);
  image(rose,0,0);
  
  filter(BLUR, blur.blurFac);
  translate(-width/2, -height/2);
  tint(255);
  
}


  
void mousePressed() {
    twirl.twirlIt();
    
}

void keyPressed() {
 if (key == ' '){
  mixer.mixIt(); 
 }
 
 if (key == CODED) {
    if (keyCode == UP) {
      blur.blurFactorP();
    } else if (keyCode == DOWN) {
      blur.blurFactorM();
    } 
  }
}