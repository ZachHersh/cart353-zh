// Katamari and material it picks up
Material[] mat = new Material[10];
Katamari kat;

//material image names
String[] pics = {"noun_468.png", "noun_593485_cc.png", "noun_708246_cc.png", "noun_752003_cc.png", "noun_807683_cc.png"};

void setup() {
  size(800, 600);
  
  //initialize material
  for (int i=0; i<mat.length; i++) {
    mat[i] = new Material(random(40,width-40), 
    random(40,height-40), pics[int(random(0,5))]);
  }
  
  //initialize katamari
  kat = new Katamari();  
}

void draw() {
  background(255);
  
  // gravity(attract+apply force) , friction,  
  for (int i=0; i<mat.length; i++) {
    PVector force = kat.attract(mat[i]);  //calculate gravity
 
    mat[i].applyForce(force, kat);  //apply gravity or stick material to katamri
  
    if(!mat[i].capture) {
    mat[i].update();  //update material movement
    mat[i].checkEdges(); // keep material on screen
    }
    kat.updatePos(); // move arounf katamari with keys
  
    kat.display();
    mat[i].display();
  }
  
  println(mat[0].capture,mat[0].pos2);
}