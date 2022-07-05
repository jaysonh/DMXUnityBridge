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
 
     int brightness = (int)map(mouseX,0,width,0,255);
     
    dmxControl.sendValue( 1, brightness );
    dmxControl.sendValue( 2, 255 );
    dmxControl.sendValue( 3, 0 );
    dmxControl.sendValue( 4, 0 );
    
    dmxControl.sendValue( 11, brightness );
    dmxControl.sendValue( 12, 0 );
    dmxControl.sendValue( 13, 255 );
    dmxControl.sendValue( 14, 0 );
    
    dmxControl.sendValue( 21, brightness );
    dmxControl.sendValue( 22, 0 );
    dmxControl.sendValue( 23, 255 );
    dmxControl.sendValue( 24, 255 );
    
}

void mousePressed()
{ // Send the map  // Send the mapped value to the dmx channels 1 and 2 to control the light
   
}
