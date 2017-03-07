/**
 * The 'Katamari' world controller, this class builds the viewport and game.
 * @class It's effectively a game manager.
 * @var {int} objCount - number of vaporItems currently instantiated.
 * Also included below are the utility methods and functions for tidiness.
 */

class Kontroller {

  int objCount = 0;

  Kontroller() {}

  /**
   * void drawWave - draws a vertex shape, informed by the audio waveform.
   * For some quick parallax, the shape is transposed ever so slightly based on mouse position.
   * vaporwave colors via @link{http://www.color-hex.com/color-palette/23057}
   */
  void drawWave() {
    background(111,234,230);
    fill(221,109,251);
    stroke(221,109,251);
    pushMatrix();
    beginShape();
    vertex(0,height+10);
    for (int i = 0; i < width; i++) {
      int bufferIndex = i * ac.getBufferSize() / (width);
      int wavePos = (int)((1 + ac.out.getValue(0, bufferIndex)) * height);

      vertex(i,i - (wavePos/12)); // magic numbers, fam (adjusts where the wave is).
    }
    vertex(width, height+10);
    endShape();

    translate(map(mouseX, 0, width, 0, 30),map(mouseY, 0, height, 0, 50));
    popMatrix();
  }

  // Magic number 200 - a good balance in pace.
  void generateItems() {
    if (objCount < vapes.length) {
      if (frameCount % 150 == 0) {
        vapes[objCount] = new VaporItem();
        objCount += 1;
      }
    }
  }
}

// UTILITY ____________________________________

/**
 * void setupAudio - loads the audio sample and begins playback
 * @implements Beads AudioContext, SampleManager, SamplePlayer, Bead (Gain, Envelope)
 */
void setupAudio () {
  ac = new AudioContext();
  samplePlay = new SamplePlayer(ac, SampleManager.sample(sketchPath("") + "data/vape.mp3"));

  Gain g = new Gain(ac, 2, 0.2);
  g.addInput(samplePlay);
  ac.out.addInput(g);
  ac.start();

  speedControl = new Envelope(ac, 1);
  samplePlay.setRate(speedControl);
}