/*

 Example Processing sketch for Aesthetic code / Smart Things
 
 Christopher von Nagy
 
 ElectroSketch using a RaspberryPi, MCP3008 ADC, and two potentiometers. The first potentiometer
 controls the x position of the stylus, the second the y poisiton. Two classes are declared here, 
 an extension of the SPI class to provide support for the MCP3008 analog to digital conversion IC, 
 and a second class to define the stylus.
 Compare the Example 6 which runs on any Processing supported device and requires an Arduino.

 Exercises
 
 1) Alter the code such that the initial position of the stylus is random (hint: use the random function
 2) Change the color scheme of the canvas and stylus to closely match an actual etch-a-sketch.
 3) Add analog or digital controls to change the color of the canvas, stylus, or both.
 4) Add a digital control to turn off the stylus while it is repositioned.
 5) Make the canvas look like an etch-a-sketch restricting the drawing area to a part of the 
    total canvas.

*/

// Import libraries
import processing.io.*;

// Declare variables and objects
// We define two classes below
MCP3008 adc0;
esPen myPen;
color initColor = color(50,50,50);

// Set things up 
void setup() {
  fullScreen();
  frameRate(25);
  colorMode(HSB, 100);
  noSmooth();
  strokeWeight(3);
  background(0,0,100);
  adc0 = new MCP3008(SPI.list()[0]);
  myPen = new esPen(width/2,height/2,initColor);
  GPIO.pinMode(21, GPIO.INPUT);
}

// and Run
void draw() {
      if (GPIO.digitalRead(21) == GPIO.HIGH) {
        background(0,0,100);
        myPen.xPrev = myPen.x;
        myPen.yPrev = myPen.y;
    } else {
      myPen.xPrev = myPen.x;
      myPen.yPrev = myPen.y;
      // myPen.x = int(map(adc0.getAnalog(0), 0, 1023, 0, width));
      // myPen.y = int(map(adc0.getAnalog(0), 0, 1023, 0, height));
      myPen.x = mouseX;
      myPen.y = mouseY;
      myPen.ink();
    }
}