import processing.video.*;
Capture video;

void setup() {
size(160,90);
printArray(Capture.list());
video = new Capture(this, Capture.list()[10]);
video.start();
}

void draw() {
  
  /* Method 1 
  if(video.available()){
   video.read(); 
  }
  */
  
  image(video, 0, 0);
}

void captureEvent(Capture video){
  video.read();
}