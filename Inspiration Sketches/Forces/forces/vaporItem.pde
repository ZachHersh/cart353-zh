/**
 * @class These are the falling objects the katamari playhead collects, held in vapes[].
 * @implements gifAnimation
 *
 * @var {Gif} sprite -
 * @var {boolean} attached - whether it has katamari'd itself on to the player.
 */

class VaporItem extends FObject {

  Gif sprite;
  boolean attached = false;

  public VaporItem() {
    location = new PVector(random(width - width/2, width), random(0, 80));
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);

    topSpeed = 15.0 + random(-5.0,5.0);

    sprite = new Gif(that, chooseImage());
    sprite.loop();
    mass = sprite.width / 2;
  }

  // TODO: build void update () => usual things, attract, delete self if below screen

  void display() {
    image(sprite,location.x,location.y);
  }

  void update() {
    if (!attached) {
      // this is a small performance optimization, disabling the gif
      if (location.y > height + 200) {
        sprite.stop();
        return;
      }

      else {
        PVector playerLoc = damancy.getLocation();
        if (PVector.dist(playerLoc, location) < 200.0 && damancy.getMass() >= mass - 20) {
          PVector attraction = PVector.sub(playerLoc, location);
          attraction.normalize();
          attraction.mult(PVector.dist(playerLoc, location));
          this.applyForce(attraction);

          if (PVector.dist(playerLoc, location) < 10.0) {
            damancy.addMass(mass/2);
            attached = true;
          }
        }
        super.update();
      }
    }
    // the attached, katamari state
    else {
      location = damancy.getLocation();
    }
  }


  private String chooseImage() {
    int imgNum = floor(random(0, imageNames.length));
    String imageName = imageNames[imgNum];
    return imageName;
  }

}