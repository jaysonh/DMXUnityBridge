class UnityOSCBridge extends Thread
{
  // Create the object and start it's thread 
    UnityOSCBridge( PApplet appRef, int deviceID, DMXControl dmx )
    {
        this.oscConn  = new OSCConnection( appRef );
        this.dmxConn  = dmx;
        this.deviceID = deviceID;
        
        numDmxChannels = dmx.getNumChannels();
        dmxVals = new int[ numDmxChannels ];
        
        for(int i= 0; i < numDmxChannels;i++)
        {
          dmxVals[i] = 0;
        }
        
        // send initi message to add device to list in Unity
        //oscConn.sendInitMsg( deviceID );
        
        start();
    }
    
    // start running the thread
    public void start()
    {
      
      super.start();
      
      threadRunning = true;
    }
    
    // Main thread function
    // runs in the background so is abstracted away from the user as much as possible
    public void run()
    {
        while( threadRunning ) {
          
            // get DMX data and pack into an OSC message to send
            int [] sendData = getDMXData();
            
            // pack data into an osc message and send
            sendOSCdata( sendData );
          
            // Sleep the thread 
            try{
              Thread.sleep( SLEEP_TIME );
            }catch(InterruptedException e)
            {
                e.printStackTrace();
            }            
        }
    }
    
    // Send int data via OSC
    void sendOSCdata( int [] sendData )
    {
        OscMessage msg = new OscMessage( OSC_MESSAGE_ADDR );
        
        msg.add( deviceID );
        
        for( int i = 0; i < numDmxChannels;i++)
        {
          msg.add( sendData[i] );
        }
        
        oscConn.sendMsg( msg );
    }
    
    // get the array of the data
    int [] getDMXData()
    {
      int [] newData = dmxConn.getData();
      
      return newData;
    }
    
    // Constants
    private final int    SLEEP_TIME       = 33;         // 1000/ 33 = 30fps
    private final String OSC_MESSAGE_ADDR = "/DMXData"; // OSC message address
    
    private boolean threadRunning = false;
    
    int []dmxVals;
    int numDmxChannels; // number of channels we will use
    int deviceID = -1;
    
    DMXControl    dmxConn;
    OSCConnection oscConn;
}
