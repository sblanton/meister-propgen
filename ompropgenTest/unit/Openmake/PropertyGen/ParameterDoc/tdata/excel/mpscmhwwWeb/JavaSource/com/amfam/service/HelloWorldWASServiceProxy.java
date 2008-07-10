package com.amfam.service;

public class HelloWorldWASServiceProxy implements com.amfam.service.HelloWorldWASService_Port {
  private boolean _useJNDI = true;
  private String _endpoint = null;
  private com.amfam.service.HelloWorldWASService_Port helloWorldWASService_Port = null;
  
  public HelloWorldWASServiceProxy() {
    _initHelloWorldWASServiceProxy();
  }
  
  private void _initHelloWorldWASServiceProxy() {
  
  if (_useJNDI) {
    try{
      javax.naming.InitialContext ctx = new javax.naming.InitialContext();
      helloWorldWASService_Port = ((com.amfam.service.HelloWorldWASService_Service)ctx.lookup("java:comp/env/service/HelloWorldWASService")).getHelloWorldWASService();
      }
    catch (javax.naming.NamingException namingException) {}
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (helloWorldWASService_Port == null) {
    try{
      helloWorldWASService_Port = (new com.amfam.service.HelloWorldWASService_ServiceLocator()).getHelloWorldWASService();
      }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (helloWorldWASService_Port != null) {
    if (_endpoint != null)
      ((javax.xml.rpc.Stub)helloWorldWASService_Port)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    else
      _endpoint = (String)((javax.xml.rpc.Stub)helloWorldWASService_Port)._getProperty("javax.xml.rpc.service.endpoint.address");
  }
  
}


public void useJNDI(boolean useJNDI) {
  _useJNDI = useJNDI;
  helloWorldWASService_Port = null;
  
}

public String getEndpoint() {
  return _endpoint;
}

public void setEndpoint(String endpoint) {
  _endpoint = endpoint;
  if (helloWorldWASService_Port != null)
    ((javax.xml.rpc.Stub)helloWorldWASService_Port)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
  
}

public com.amfam.service.HelloWorldWASService_Port getHelloWorldWASService_Port() {
  if (helloWorldWASService_Port == null)
    _initHelloWorldWASServiceProxy();
  return helloWorldWASService_Port;
}

public java.lang.String message(java.lang.String msg) throws java.rmi.RemoteException{
  if (helloWorldWASService_Port == null)
    _initHelloWorldWASServiceProxy();
  return helloWorldWASService_Port.message(msg);
}

public com.amfam.service.PingResultType ping(com.amfam.service.PingInputType pingInput) throws java.rmi.RemoteException{
  if (helloWorldWASService_Port == null)
    _initHelloWorldWASServiceProxy();
  return helloWorldWASService_Port.ping(pingInput);
}


}