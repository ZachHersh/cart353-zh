class Twirler {
 float rot;
  
  Twirler() {
  rot = 0;
  }  
  
  void twirlIt() {
    twirl.rot += 0.5;
    art.save("data/Blend.jpg");
  }
  
}