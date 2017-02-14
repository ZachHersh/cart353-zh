//import processing.video.*;
//Capture video;

Walker zach;

void setup() {
size(400,400);
//printArray(Capture.list());
zach = new Walker();
//video = new Capture(this, Capture.list()[10]);
//video.start();
}

void draw() {
  
  /* Method 1 
  if(video.available()){
   video.read(); 
  }
  */
  
  //image(video, 0, 0);
  zach.step();
  zach.display();
}

/*void captureEvent(Capture video){
  video.read();
}*/