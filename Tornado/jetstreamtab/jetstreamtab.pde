class JetStream {
  
  float motionInc;
  PVector[][] motion;
  //PShape warmFront;
  //PShape jetStream;
  //PShape coldFront;
  
  
  JetStream(float _motionInc) {
    motionInc = _motionInc;
    motion = new PVector[4][3];
    fillMotion();
    //warmFront = createShape();
    //jetStream = createShape();
    //coldFront = createShape();
    //makeShape();
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    PVector change = new PVector(10/*random(-motionInc,motionInc)*/, 0);
    
    motion[2][1].add(change);
    println(motion[2][1].x);
    /*for(int i=0; i<motion.length; i++) {
      if (motion[i].y<10 && motion[i].y>590) {
        motion[i].add(change);
      }     
    }  
    */
  }
  
  void display() {
    
    beginShape();
    fill(254,153,32,60);
    noStroke();
    vertex(motion[0][0].x, motion[0][0].y);
    vertex(motion[1][0].x, motion[1][0].y);
    bezierVertex(motion[2][0].x, motion[2][0].y, motion[2][1].x, motion[2][1].y, motion[2][2].x, motion[2][2].y);
    bezierVertex(motion[3][0].x, motion[3][0].y, motion[3][1].x, motion[3][1].y, motion[3][2].x, motion[3][2].y);
    endShape();
    
    
  }
  
  void fillMotion() {
    motion[0] = new PVector[]{new PVector(200, 0), new PVector(0, 0), new PVector(0, 0)};
    motion[1] = new PVector[]{new PVector(400, 0), new PVector(0, 0), new PVector(0, 0)};
    motion[2] = new PVector[]{new PVector(400, 600), new PVector(550, 0), new PVector(250, 600)};
    motion[3] = new PVector[]{new PVector(200, 600), new PVector(400, 600), new PVector(400, 600)};
        
  }
  
  void makeShape() {
    /*jetStream.beginShape();
    jetStream.fill(254,153,32,60);
    jetStream.noStroke();
    jetStream.vertex(motion[0].x, motion[0].y);
    jetStream.vertex(motion[1].x, motion[1].y);
    jetStream.vertex(motion[2].x, motion[2].y);
    jetStream.vertex(motion[3].x, motion[3].y);
    jetStream.vertex(motion[4].x, motion[4].y);
    jetStream.vertex(motion[5].x, motion[5].y);
    jetStream.endShape(); 
    */
  }
}