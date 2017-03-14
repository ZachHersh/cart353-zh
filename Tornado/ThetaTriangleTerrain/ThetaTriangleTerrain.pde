class Terrain {
  
  PVector mapSize;
  int sections;
  int divisions;
  color[] c;
  PShape[] tria;
  
  Terrain(int _mW, int _mH, int _sections, int _divisions) {
    mapSize = new PVector(_mW,_mH);
    sections = _sections;
    divisions = _divisions;
    c = new color[sections*divisions];
    tria = new PShape[sections*divisions];
    colorChoice();
    makeMap();
  }
  
  void colorChoice() {
    //chooses colors for terrain
    //terrain is divided into sections and sections are divided into divisions
    int inc=0;
    for (int i=0;i<sections;i++){
      for(int j=0;j<divisions;j++){
        //println(inc);
        c[inc] = color(int(random(10,255)),int(random(10,255)),int(random(10,255)));
        inc++; 
      }
    }
    /*
    println(red(c[0]),green(c[0]),blue(c[0]));
    println(red(c[1]),green(c[1]),blue(c[1]));
    println(red(c[2]),green(c[2]),blue(c[2]));
    println(red(c[3]),green(c[3]),blue(c[3]));
    println(red(c[4]),green(c[4]),blue(c[4]));
    println(red(c[5]),green(c[5]),blue(c[5]));
    println(red(c[6]),green(c[6]),blue(c[6]));
    println(red(c[7]),green(c[7]),blue(c[7]));
    println(red(c[8]),green(c[8]),blue(c[8]));
    println(red(c[9]),green(c[9]),blue(c[9]));
    println(red(c[10]),green(c[10]),blue(c[10]));
    println(red(c[11]),green(c[11]),blue(c[11]));
    */
  }
  
  void makeMap() {
    PVector mS = mapSize.get(); //get map size to for diagonal length from mag
    float rMax = mS.mag(); // get diagonal length from magnitude
    float sectionSize = rMax/sections; //divide diagonal length into number of sections  
    
    float r = 0; //radius distance of triangle from starting point 
    float theta = 0; //rotate triangle sections by polar coordinates
     
    int inc=0; //incrementer for color
    
    // make triangles
    noStroke();
    for(int i=0; i<sections;i++) {
        float thetaL = theta; // local theta for division level increments
      for(int j=0;j<divisions;j++){
        float x = r * cos(thetaL);
        float y = r * sin(thetaL);
        
        println(x,y);
        
        fill(c[inc]);  
        tria[inc] = createShape(TRIANGLE,x,y,x+60,y+30,x+20,y+120);
                //printArray(tria[inc]);
        inc++;
        thetaL+=0.1;
        
      }
      r+=sectionSize;
      theta+=0.3;
    }
  }
  
  
  void display() {
    makeMap();
    for(int i=0;i<tria.length;i++) {
      shape(tria[i]);
    }
  }
  
  
  
}