/*

 Example Processing sketch for Aesthetic code / Smart Things
 2017 Christopher von Nagy
 
 A sketch of a pinball game for Smart Things

*/

void setupGUI() {
  
  f = createFont("Georgia", 24);
  textFont(f);                    

}

void drawGUI() {
  
  int total_score = 0;
  for (Obstacle bumper: obstacles) {
    total_score =+ bumper.score;
  }

  
  textAlign(LEFT);
  fill(0);
  text("Score: ", width*0.5, height*0.1);
  text(total_score, width*0.7, height*0.1);
  
}

void mousePressed() {
  
  if (ball == null){setupFurniture(); setupFlippers();}
  else if(!ball.in_bounds()){setupFurniture(); setupFlippers();}
  
}

void doInteraction() {
  
  if (keyPressed && ball == null) { if (key == 'b' || key == 'B') { releaseBall(random(100,200)); }}
  if (keyPressed && ball != null) { if ((key == 'b' || key == 'B') && !ball.in_bounds()) { releaseBall(random(100,200)); }}
  if (keyPressed) { if (key == 'a' || key == 'A') { flipperL.toggleMotor(); }}
  if (keyPressed) { if (key == 'd' || key == 'D') { flipperR.toggleMotor(); }}

}