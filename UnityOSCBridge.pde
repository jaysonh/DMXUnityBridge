class UnityOSCBridge
{
    UnityOSCBridge( PApplet appRef, DMXControl dmx )
    {
        oscConn = new OSCConnection( appRef );
        
        numDmxChannels = dmx.MAX_CHANNELS;
        dmxVals = new int[ numDmxChannels ];
        
        for(int i= 0; i < numDmxChannels;i++)
        {
          dmxVals[i] = 0;
        }
        
    }
    
    void update()
    {
      int [] newData = dmxConn.getData();
      
      for( int i= 0; i < numDmxChannels; i++ )
      {
        if(newData[i]>0)
          println(i + ": " + newData[i]);
        
      }
    }
    int []dmxVals;
    int numDmxChannels; // number of channels we will use

    DMXControl    dmxConn;
    OSCConnection oscConn;
}
