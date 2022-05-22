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
  unityBridge = new UnityOSCBridge( this, 0, dmxControl );
  
}

void draw()
{
     background(0);
     surface.setTitle("FPS: " + frameRate);
 
}

void mousePressed()
{ // Send the map  // Send the mapped value to the dmx channels 1 and 2 to control the light
    dmxControl.sendValue( 1, 255 );
    dmxControl.sendValue( 2, random(255) );
    dmxControl.sendValue( 3, random(255) );
    dmxControl.sendValue( 4, random(255) );
    
    dmxControl.sendValue( 11, 255);
    dmxControl.sendValue( 12, random(255) );
    dmxControl.sendValue( 13, random(255) );
    dmxControl.sendValue( 14,random(255) ); 
}
