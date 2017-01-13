// Declare MCP3008 class
// After GrumpyMike (2016) Processing Forum
class MCP3008 extends SPI {

  // Class constructor
  MCP3008(String dev) {
    super(dev);
    super.settings(1000000, SPI.MSBFIRST, SPI.MODE0);
  }
 
  // Declare method
  int getAnalog(int channel) {
    
    if (channel < 0 || channel > 7) {
      System.err.println("The channel needs to be from 0 to 7");
      throw new IllegalArgumentException("Unexpected channel");
    }
    
    byte[] out = { 0, 0, 0 };
    out[0] = (byte)(0x18 | channel);
    byte[] in = super.transfer(out);
    int val = ((in[1] & 0x3f)<< 4 ) | ((in[2] & 0xf0) >> 4);
    return int(val/1023);
  }
  
}