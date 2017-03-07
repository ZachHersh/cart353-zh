/**
 * The Player is the entity the user controls, using the arrow keys to accelerate left or right.
 * @class Most of this class was derived from Shifmann's Nature of Code (Ch. 2), and class lectures.
 * TODO: add controls
 */

class Player extends FObject {

  public Player() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    mass = 10.0;
    topSpeed = 10.0;
  }

  void display() {
    stroke(255);
    fill(255);
    ellipse(location.x, location.y, 16, 16);
  }

  /**
   * void boundCheck - color based collision detection
   *
   */
  void boundCheck() {
    // can't bounce that far up, bud.
    if (location.y <= 0-velocity.y) {
      location.y = 30;
      velocity.y = 0;
    }
    // pass through bottom and reappear on top
    if (location.y >= height - abs(velocity.y) - mass - 16) {
      location.y = 10;
    }

    loadPixels();

    /*
     * this is a big one-liner, I know. It was built incrementally, and it's at least fairly efficient.
     * This check also conveniently works as my out-of-bounds logic. I was originally going to have a camera, but that's way out of scope.
     * Testing the colors at the location the player will be, we can easily reverse direction.
     * Normal forces were a little too wonky for the constantly oscillating slope shape.
     */
    if ( pixels[ floor(location.y + abs(velocity.y) + floor(mass)+16 ) * width + floor( location.x + abs(velocity.x) + floor(mass) + 16) ] == color(221, 109, 251) ) {
      background(238, 205, 105); // yellow
      velocity = velocity.mult(-(speed / 2)); // reverse direction add or sub the velocity with the track's speed.
    }
  }

  // @param {float} mass is the preformatted mass of a vaporobject
  void addMass(float mass) {
    this.mass += mass;
  }

  float getMass() {
    float m = mass;
    return m;
  }

  PVector getLocation() {
    return location;
  }

  /**
   * Use the arrow keys or WASD to move around the hill.
   * moving left or right will change the speed the track is played at.
   */
  void keyControl() {
    // TODO: WASD
    if (keyPressed == true && key == CODED) {
      if (keyCode == LEFT) {
        speed -= 0.001;
        speedControl.setValue(speed); // set waveform control

        PVector jedi = new PVector(-0.8, 0);
        this.applyForce(jedi);
      }

      if (keyCode == RIGHT) {
        speed += 0.001;
        speedControl.setValue(speed);

        PVector jedi = new PVector(0.8, 0);
        this.applyForce(jedi);
      }

      if (keyCode == UP) {
        PVector jedi = new PVector(0, -1);
        this.applyForce(jedi);
      }
      // get unstuck.
      if (keyCode == CONTROL) {
        location = new PVector(width/2, height/2);
        velocity = new PVector(0.0, 0.0);
        acceleration = new PVector(0.0, 0.0);
      }
    }
  }
}