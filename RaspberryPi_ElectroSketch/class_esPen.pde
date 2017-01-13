// Declare the esPen class
class esPen {
 
 // Class variables 
 int x;
 int y;
 int xPrev;
 int yPrev;
 int hueValue;
 int satValue;
 int brightnessValue;
 color esHSB; 

 // Class constructor
 esPen (int xpos, int ypos, int hV) {
 x = xpos;
 y = ypos;
 xPrev = xpos;
 yPrev = ypos;
 hueValue = hV; 
 satValue = 50; 
 brightnessValue = 50; 
 esHSB = color(hueValue,satValue,brightnessValue);

 }

 // Class Methods
 void ink() {
   esHSB = color(hueValue,50,50);   
   stroke( esHSB );
   line(x, y, xPrev, yPrev);
 }
}