Mover[] movers = new Mover[10];
Liquid liquid;

void setup() {
 size(640,720); 
 
 // instanitating movers with mass between .1 and 4 and x of 30 and y of 0
 for (int i=0; i < movers.length;i++) {
   int dist = width/10;
   dist*=i; 
   movers[i] = new Mover(random(0.1,4),dist+32,random(0,200));
 }
 
 liquid = new Liquid(0, height/1.25, width, height/1.25, 0.1);
 
}

void draw() {
  background(255);
  
  liquid.display();
  
  
  
  // apply forces, update, animte movers
  for (int i=0; i < movers.length;i++) {
    // make gravity force that is same to all movers despite having differing mass
    PVector gravity = new PVector(0,0.1*movers[i].mass);
    
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }
        
    
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].display();
  }
  
  
}