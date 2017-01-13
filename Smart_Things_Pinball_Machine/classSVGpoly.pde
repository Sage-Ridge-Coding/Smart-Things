/*

 Example Processing sketch for Aesthetic code / Smart Things
 2017 Christopher von Nagy
 
 A sketch of a pinball game for Smart Things

*/

// Currently generates an exception.
class SVGPoly {

  // Declare objects and variables
  Body body;
  PolygonShape ps;
  Vec2[] vertices;
  PShape svg;
  String s;
  int x;
  int y;

  // Class constructor
  SVGPoly(String s_, int x_, int y_) {

    s = s_;
    x = x_;
    y = y_;
    
    // Read svg and convert to an array of vertices
    svg = loadShape(s);
    PShape svg_1 = svg.getChild( 0 );
    Vec2[] vertices = new Vec2[svg_1.getVertexCount()];
    for (int i=0; i < svg_1.getVertexCount(); i++) { 
      PVector v = svg_1.getVertex(i);
      vertices[i] = box2d.vectorPixelsToWorld(new Vec2(v.x, v.y));
    }
    
    // Create Box2D polygon shape from svg vertices
    PolygonShape ps = new PolygonShape();
    for (int i=0; i < vertices.length; i++) {println(vertices[i]);}
    ps.set(vertices,vertices.length);
    
    
    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);

    body.createFixture(ps, 1.0);

  }

void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
 
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
 
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    // rotate(-a);
    fill(175);
    stroke(0);
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x,v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }

}