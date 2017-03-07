/**
 * VapeMountain
 *
 * You, the playhead, navigate a waveform hill.
 * Set to the tune of リサフランク420 / 現代のコンピュー, you traverse the vaporwave landscape,
 * collecting mass from the gifs that rain above.
 *
 * @implements beads audio library
 * @see Beads @link{http://www.beadsproject.net/}
 *
 * @implements custom gifAnimation library by 01010101 for Processing 3.x
 * @see gifAnimation @link{https://github.com/01010101/GifAnimation}
 *
 * @see Vektroid (Music Source) {@link https://vektroid.bandcamp.com/album/floral-shoppe}
 *
 * @author Michael Hemingway | CART 353 - W2017
 */

import beads.*;
import gifAnimation.*;


// Audio settings
AudioContext ac;
Envelope speedControl;
SamplePlayer samplePlay;
float speed = 1.0;

// Essential o̶i̶l̶s̶ classes and constants
Player damancy;
Kontroller env;
PVector gravity = new PVector(0, 0.98);

String[] imageNames = {"00.gif", "01.gif", "02.gif", "03.gif", "04.gif", "06.gif", "07.gif"};
VaporItem[] vapes = new VaporItem[60]; // max number of objects to be collected

PApplet that = this;

void setup() {
  size(1280, 720);
  //fullScreen();
  setupAudio(); // hooks up the audio file and envelopes. => see Kontroller obj

  imageMode(CENTER);
  ellipseMode(CENTER);

  damancy = new Player();
  env = new Kontroller();
}

void draw() {
  env.drawWave();

  // comment out these lines to disable the top right corner debug overlay
  fill(0, 0, 255);
  text(str(speed) + " " + damancy.velocity, 20, 20); // debug, fun

  // Entities
  damancy.boundCheck();
  damancy.keyControl();
  damancy.update();
  damancy.display();


  for (int i = 0; i <  env.objCount; i++) {
    vapes[i].update();
    vapes[i].display();
  }

  env.generateItems();
}