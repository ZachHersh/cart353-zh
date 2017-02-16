float xoff = 0.0;
float yoff = 0.0;

void setup() {
size(400,400); 

}

void draw() {
loadPixels();

for (int x = 0; x < width; x++) {
  
  for (int y = 0; y < height; y++) {
    //noiseDetail(1,0.5);
    float bright = map(noise(xoff,yoff),0,1,0,255);
    pixels[x+y*width] = color(bright);
    yoff+=0.01;
  }
  xoff+=0.01;
}
updatePixels();
}