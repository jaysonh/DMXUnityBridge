class OSCConnection
{  
    OSCConnection(PApplet appRef)
    {
      oscP5 = new OscP5(appRef,7000);  
      
      // Address of computer running unity
      unityAddr = new NetAddress( UNITY_IP, UNITY_PORT);
    }
    
    void sendMsg( OscMessage msg )
    {
        oscP5.send( msg, unityAddr );
    }
    
    void sendInitMsg( int deviceID )
    {
        OscMessage msg = new OscMessage( INIT_DEVICE_ADDR );
        
        msg.add( deviceID );      
        oscP5.send( msg, unityAddr );
    }
    
    final String INIT_DEVICE_ADDR = "/DMXInit";
    
    int    UNITY_PORT = 7001;
    String UNITY_IP   = "127.0.0.1";
    
    OscP5 oscP5;
    NetAddress unityAddr;
}
