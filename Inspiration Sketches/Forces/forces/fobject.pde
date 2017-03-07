/**
 * A force-sensitive object, Luke.
 * @class is the template both the player and the items are built upon
 * @var {PVector} location - the x/y place the object is currently in
 * @var {PVector} velocity - the speed (and direction) the object is travelling in
 * @var {PVector} acceleration - the forces acted upon its velocity.
 * @var {float} topSpeed - a limit on the maximum velocity.
 * @var {float} mass - An artificial measure to simulate gravitational attraction
 */

abstract class FObject {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float topSpeed;
  float mass;

  public FObject() {
  }

  /**
   * void applyForce - lifted directly from mix-master Shiff.
   * @param {PVector} force - the vector to be applied
   */
  void applyForce(PVector force) {
    PVector f = PVector.div(force.get(), mass);
    acceleration.add(f);
  }


  /**
   * void update - a single tick in game time
   */
  void update() {
    this.applyForce(gravity);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {}

}