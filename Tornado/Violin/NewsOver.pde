class NewsOver {
  
  // Newscast Overlay
  int state; // Gamestate game over, intro screen, game play...
  PVector loc;
  PShape logo; // State screen graphics
  PShape anchorman; 
  PShape gameOver;
  int fCount=0; // Game Over screen duration
  
  int instructSelect = 2; //selects instruction text
  
  
  NewsOver() {
    state = 1;
    loc = new PVector(0,0);
    logo = loadShape("logo.svg");
    logo.scale(0.6);
    anchorman = loadShape("anchorman.svg");
    gameOver = loadShape("gameover.svg");
    gameOver.scale(0.6);
  }
  
  
  void run() {
    
    if (state == 1) {
      introScreen();
    } else if (state == 2) {
      instructions();
    } else if (state == 3) {
      inGame(); 
    } else if (state == 4) {
      gameOver(); 
    }
  }
  
  
  void introScreen() {
    
    background(252,245,0);
    shapeMode(CENTER);
    shape(logo,width/2,height/2.8);
  }
  
  
  void instructions() {
    
    background(252,245,0);
    
    fill(250);
    rect(60, 40, width-120, 220, 20);
    
    shapeMode(CENTER);
    shape(anchorman,width/2,height-anchorman.height/2);
    
    String[] instructs = {"(a) BACK",
                          "(d) NEXT",
                          "Steer the tornado towards cows, using the\nw, a, s, d keys to increase the cost of damage\nbut don’t forget to bring the tornado into the\njetstream wind so it can get strong again or else\nit will fizzle out.",
                          "Only the jetstream wind can give the tornado\nit’s power back which it otherwise slowly looses\nwhen it’s not in the jetstream.",
                          "The strength of the tornado is measured in an\nF scale. F5 being the strongest and and F0 being\nthe weakest. It it dips below F0, your tornado\nwill die. The tornado health will be displayed in\n the newscast",
                          "Press Spacebar to Play"
                          }; 
                          
    constrain(instructSelect,0,1);
    fill(0); textSize(18); 
    text(instructs[instructSelect],80,76);
    
    fill(80);
    text(instructs[0],80,230);
    text(instructs[1],width-160,230);
  }
  
  
  void inGame() {
    
    terrain.run();
    
    if (tornado.health <= 0) {
      
      // Game Over state if the tornado health is 0.
      // Change Tornado location for Game Over screen.
      state = 4; 
      tornado.loc = new PVector(0,height/1.3);
      tornado.health=5.9;
      tornado.size=1;
      tornado.score=0;
    }
    
    for (int i=0; i<terrain.cows.length; i++) {
      
      // Tornado, Cow interaction
      PVector force = tornado.attract(terrain.cows[i]);  // Calculate gravity.
      terrain.cows[i].applyForce(force, tornado);        // Apply gravity to cows and stick them to tornado.  
      terrain.cows[i].update();                          // Update cow location.
      terrain.cows[i].checkEdges();                      // Keep cows within terrain edges.
    }
    
    tornado.display();
    newsDisplay();
    
    tornado.health -= 0.005;
  }
  
  
  void gameOver() {
    
    // Show bg and graphic.
    background(115,149,113);
    shapeMode(CENTER);
    shape(gameOver,width/2,height/2.8);
    
    // Moves tornado accross screen.
    PVector torMov = new PVector(3.8,0);
    tornado.loc.add(torMov);
    tornado.display();
    
    fCount++;
    
    if (fCount > 200) {
      state=1;
      fCount=0;
      tornado.loc = new PVector(width/2,height/2);
    } 
  }
  
  
  void newsDisplay() {
    
    // Text boxes.
    noStroke();
    fill(220,0,0);
    rect(60,50,60,40); // LIVE Box.
    
    fill(220,0,0);
    rect(width-204,40,4,60);
    fill(250);
    rect(width-200, 40, 160, 60); // Has caused $ in damages
    
    fill(220,0,0);
    rect(60,450,208,30); // Breaking news.
    
    fill(255);
    rect(60,480,540,60); // Tornado wreaks havoc.
    
    fill(0);
    rect(60,540,80,30); // Time.
    
    fill(252,245,0);
    rect(140,540,460,30); // Yellow rect.
     
    // Text 
    String[] newsText = { "LIVE", 
                          tornado.score + "$",
                          "OF DAMAGE",
                          "BREAKING NEWS", 
                          "TORNADO WREAKS HAVOC",
                          str(hour()) + ":" + str(minute()), 
                          "Tornado now classified as an F" + int(tornado.health) };      
                          
    fill(255); textSize(24); 
    text(newsText[0],66,78);  // LIVE
    
    fill(220,0,0); textSize(24); 
    text(newsText[1],width-192,68);  // $$$$
    textSize(18); 
    text(newsText[2],width-192,92); // of damage
    
    fill(255);
    text(newsText[3],70,474);  // BREAKING NEWS
    
    fill(0); textSize(36);
    text(newsText[4],70,524); // TORNADO WREAKS HAVOC
    
    fill(255); textSize(20);
    text(newsText[5],70,562);  // 9 PM
    
    fill(0);
    text(newsText[6],160,562); // Tornado now classified as Fx
  } 
}