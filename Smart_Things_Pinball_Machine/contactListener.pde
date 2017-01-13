/*

 Example Processing sketch for Aesthetic code / Smart Things
 2017 Christopher von Nagy
 
 A sketch of a pinball game for Smart Things

 From Shiffman's The Nature of Code examples

*/

import org.jbox2d.callbacks.ContactImpulse;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.collision.Manifold;
import org.jbox2d.dynamics.contacts.Contact;

 class CustomListener implements ContactListener {
  CustomListener() {
  }

  // This function is called when a new collision occurs
   void beginContact(Contact cp) {
    // Get both fixtures
    Fixture f1 = cp.getFixtureA();
    Fixture f2 = cp.getFixtureB();
    // Get both bodies
    Body b1 = f1.getBody();
    Body b2 = f2.getBody();
    // Get our objects that reference these bodies
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();

    if (o1 == null || o2 == null) return;    
    else if (o1.getClass() == Obstacle.class) {
      Obstacle o = (Obstacle) o1;
      o.changeColorFlash();
      o.sound();
      o.incrementScore();
    }
    else if (o1.getClass() == Flipper.class) {
      Flipper f = (Flipper) o1;
      f.sound();
    }
    else if (o1.getClass() == Poly.class) {
    }
    else if (o1.getClass() == Circle.class) {
    }
    else if (o1.getClass() == Boundary.class) {
    }
  }

   void endContact(Contact contact) {
    // TODO Auto-generated method stub
  }

   void preSolve(Contact contact, Manifold oldManifold) {
    // TODO Auto-generated method stub
  }

   void postSolve(Contact contact, ContactImpulse impulse) {
    // TODO Auto-generated method stub
  }
}