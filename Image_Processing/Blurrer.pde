class Blurrer {
 int blurFac;
  
  Blurrer() {
    blurFac = 0;
  }
  
  void blurFactorM() {
    blurFac--;
    constrain(blurFac,0,10);
  }
  
  void blurFactorP() {
    blurFac++;
    constrain(blurFac,0,10);
  }
}