class OSCConnection
{  
    OSCConnection(PApplet appRef)
    {
      oscP5 = new OscP5(appRef,7000);  
      
      // Address of computer running unity
      myRemoteLocation = new NetAddress( "127.0.0.1", UNITY_PORT);
    }
    
    int UNITY_PORT = 7001;
    OscP5 oscP5;
    NetAddress myRemoteLocation;
}
