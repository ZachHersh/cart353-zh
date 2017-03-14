//PVector loc;

void setup() {
  fullScreen();
  //loc = new PVector(width/2-30,height/2-80);
  //size(300,300);
  
  //noFill();
  beginShape();
        vertex(30, 20);
  bezierVertex(100, 20, 
               100, 40, 
               30, 40);
  
  endShape(); 
  
  noFill();
  stroke(200,40,40);
  beginShape();
        vertex(30, 20);
  bezierVertex(80, 20, 
               80, 75, 
               30, 75);
  
  endShape();
}