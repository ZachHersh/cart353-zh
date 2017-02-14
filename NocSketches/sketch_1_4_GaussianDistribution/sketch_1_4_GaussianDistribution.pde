import java.util.*;

Random generatorX;
Random generatorY;
Random generatorZ;

void setup() {
  size(640,360);
  generatorX = new Random();
  generatorY = new Random();
  generatorZ = new Random();
}

void draw() {
 float numX=(float)generatorX.nextGaussian();
 float numY=(float)generatorY.nextGaussian();
 float numZ=(float)generatorY.nextGaussian();
 
 
 float sd=120;
 
 float meanX=width/2;
 float meanY=height/2;
 
 float x=sd*numX+meanX;
 float y=sd*numY+meanY;
 
 color splat = color(int(numX*255),int(numY*255),int(numZ*255),10);
 
 noStroke();
 fill(splat);
 ellipse(x,y,16,16);
}