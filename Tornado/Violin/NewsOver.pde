class NewsOver {
  // Newscast Overlay
  
  PVector loc;
  
  NewsOver() {
    loc = new PVector(0,0);
    
  }
  
  void display() {
   noStroke();
   
   // Text boxes.
   fill(220,0,0);
   rect(60,50,60,40); // LIVE
   
   fill(220,0,0);
   rect(60,450,208,30); // red rect
   fill(255);
   rect(60,480,540,60); // white rect
   fill(0);
   rect(60,540,120,30); // black rect
   fill(252,245,0);
   rect(180,540,420,30); // yellow rect
   
   // Text
   String[] newsText = {"LIVE", "BREAKING NEWS", "TORNADO WREAKS HAVOC",
                        "9 PM", "JUST DESTROYED ANOTHER BUILDING",
                        tornado.score + "$" + "\nIN DAMAGES"};
   
   fill(255); textSize(24); 
   text(newsText[0],66,78);  // LIVE
   fill(255); textSize(24); 
   text(newsText[5],366,78);  // MILLIONS IN DAMAGE
   text(newsText[1],70,474);  //BREAKING NEWS
   fill(0); textSize(36);
   text(newsText[2],70,524); // TORNADO WREAKS HAVOC
   fill(255); textSize(20);
   text(newsText[3],70,562);  // 9 PM
   fill(0);
   text(newsText[4],190,562); // JUST DESTROYED ANOTHER BUILDING AND 2 CARS
   
  }
  
}