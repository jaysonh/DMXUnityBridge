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
     background(0);
     // take the mouse pos and convert it to a number between 0 - 255
    int brightness = ( int ) map( mouseX, 0, width, 0, 255 ); 
    
    // Send the mapped value to the dmx channels 1 and 2 to control the light
    dmxControl.sendValue( 1, brightness );
    dmxControl.sendValue( 2, brightness );

}
  
