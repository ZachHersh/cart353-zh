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
  translate(width/2, height/2);
  imageMode(CENTER);
  rotate(twirl.rot);
  image(rose,0,0);
  translate(-width/2, -height/2);
  
  saved.loadPixels();
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++) {
      int loc = x + y*source.width;
      
    }
  }

  saved.updatePixels();
}



void mousePressed() {
    twirl.rot += 0.5;
}