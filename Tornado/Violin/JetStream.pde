class JetStream{
  
  ArrayList<Jet> jets;
  PVector origin;
  float oMovInc = 0; // for moving origin of jetstream.
  
  
  JetStream() {
    origin = new PVector(-100,3100);
    jets = new ArrayList<Jet>();
  }
  
  void addParticle(Jet inJet) {
    jets.add(inJet); 
  }
  
  void run() {
    
    float oMov = noise(oMovInc)*1600+1400;
    origin.x = oMov;
    oMovInc+=0.004;
    
    
    if (frameCount % 8 == 0) { 
      //if (jets.size() < 2) "{
      // add jets to Jet arraylist
      addParticle(new Jet(origin));
    }
    
    Iterator<Jet> it = jets.iterator();
    
    while(it.hasNext()) {
      Jet n = it.next();
      n.run();
      
      if(n.isDead()) {
        it.remove();
      }
    }
  
     
  }
  
}