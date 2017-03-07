class Tornado {
  
  
  int size;
  float theta1,theta2;
  float r;
  
  Tornado() {
    
    size = 60;
    theta1 = 0;
    theta2 = 1.6;
    r = 6;
  }
  
  
  void display() {
   
    float x = r * cos(theta1);
    float y = r * sin(theta1);
    float x1 = r * cos(theta2);
    float y1 = r * sin(theta2);
    
    noFill();
    strokeWeight(6);
    stroke(0);
    
    ellipse(x+width/2-4, y+height/2, size, size);
    strokeWeight(5);
    ellipse(x1+width/2+4, y1+height/2, size-8, size-8);
    
    theta1+=0.08;
    theta2+=0.08;
    
  }
  
 
  
  
}