/*

 Example Processing sketch for Aesthetic code / Smart Things
 2017 Christopher von Nagy
 
 A sketch of a pinball game for Smart Things

*/

class Obstacle {

  // Declare objects and variables
  Body body;
  PImage o_img;
  color col;
  float x;
  float y;
  float r;
  float b;
  int score;

  // Class constructor
  Obstacle(float x_, float y_, float r_, float b_) {

    x = x_;
    y = y_;
    r = r_;
    b = b_;
    score = 0;

    makeBody(x, y, r);
    body.setUserData(this);
    col = color(0,0,255);    
    
  }

  // Draw the obstacle, if it were at an angle we'd have to do something fancier
  void display() {
    stroke(0);
    strokeWeight(0.5);
    fill(col);
    ellipse(x, y, r*2, r*2);
  }
  
  // Vsually signal the ball colliding with the obstacle.
  void changeColorFlash() {
    col = color(255, 0, 0); // test color change
  }
  
  void changeColorRest() {
    col = color(0, 0, 255); // test color change
  }
  

  // Sound collision.
  void sound() {
    // Put sound code here
  }

  // Increment the score.
  void incrementScore() {
    score =+ 1;
  }
  
   
  // Here's our function that adds the ball to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.STATIC;
    bd.angularDamping = 0.9;
    
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = b;

    // Attach fixture to body
    body.createFixture(fd);

    body.setAngularVelocity(0);
  }
}