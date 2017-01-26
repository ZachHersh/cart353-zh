class RGBMixer{
  int r;
  int g;
  int b;
  int tinted;

  RGBMixer() {
   r = 255;
   g = 255;
   b = 255;
   tinted = 0;
  }

  void mixIt() {
    tinted++;
    println(tinted);
    if(tinted > 3) {
      tinted = 0;
    } 
  }

}