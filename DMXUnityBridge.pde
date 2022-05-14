// Import DMX library
import com.jaysonh.dmx4artists.*;

// Import OSC libraries
import netP5.*;
import oscP5.*;

int numDmxChannels = 256;

UnityOSCBridge unityBridge;
DMXControl     dmxControl;

void setup()
{
  size(600,600);
  
  // Connect to the first dmx usb device available
  dmxControl  = new DMXControl( 0, numDmxChannels );
  unityBridge = new UnityOSCBridge( this, dmxControl );
  
}

void draw()
{
  
}
  
