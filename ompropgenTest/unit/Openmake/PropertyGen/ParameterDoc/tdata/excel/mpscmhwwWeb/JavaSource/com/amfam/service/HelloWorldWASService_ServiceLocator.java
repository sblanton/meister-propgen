/**
 * HelloWorldWASService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

import java.io.InputStream;
import java.util.Properties;

public class HelloWorldWASService_ServiceLocator extends com.ibm.ws.webservices.engine.client.Service implements com.amfam.service.HelloWorldWASService_Service {

    // Use to get a proxy class for helloWorldWASService
    private final java.lang.String helloWorldWASService_address = getServiceAddress();
    
//"http://localhost:9080/mpscmwhw_service/services/HelloWorldWASService";

    public java.lang.String getHelloWorldWASServiceAddress() {
        return helloWorldWASService_address;
    }

    // The WSDD port name defaults to the port name.
    private java.lang.String helloWorldWASServiceWSDDPortName = "HelloWorldWASService";

    public java.lang.String getHelloWorldWASServiceWSDDPortName() {
        return helloWorldWASServiceWSDDPortName;
    }

    public void setHelloWorldWASServiceWSDDPortName(java.lang.String name) {
        helloWorldWASServiceWSDDPortName = name;
    }

    public com.amfam.service.HelloWorldWASService_Port getHelloWorldWASService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(helloWorldWASService_address);
        }
        catch (java.net.MalformedURLException e) {
            return null; // unlikely as URL was validated in WSDL2Java
        }
        return getHelloWorldWASService(endpoint);
    }

    public com.amfam.service.HelloWorldWASService_Port getHelloWorldWASService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.amfam.service.HelloWorldWASServiceSoapBindingStub _stub = new com.amfam.service.HelloWorldWASServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getHelloWorldWASServiceWSDDPortName());
            return _stub;
        }
        catch (com.ibm.ws.webservices.engine.WebServicesFault e) {
            return null;
        }
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.amfam.service.HelloWorldWASService_Port.class.isAssignableFrom(serviceEndpointInterface)) {
                com.amfam.service.HelloWorldWASServiceSoapBindingStub _stub = new com.amfam.service.HelloWorldWASServiceSoapBindingStub(new java.net.URL(helloWorldWASService_address), this);
                _stub.setPortName(getHelloWorldWASServiceWSDDPortName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("WSWS3273E: Error: There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        String inputPortName = portName.getLocalPart();
        if ("HelloWorldWASService".equals(inputPortName)) {
            return getHelloWorldWASService();
        }
        else  {
            throw new javax.xml.rpc.ServiceException();
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "HelloWorldWASService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://service.amfam.com","HelloWorldWASService"));
        }
        return ports.iterator();
    }

    public javax.xml.rpc.Call[] getCalls(javax.xml.namespace.QName portName) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            throw new javax.xml.rpc.ServiceException("WSWS3062E: Error: portName should not be null.");
        }
        if  (portName.getLocalPart().equals("HelloWorldWASService")) {
            return new javax.xml.rpc.Call[] {
                createCall(portName, "message"),
                createCall(portName, "ping"),
            };
        }
        else {
            throw new javax.xml.rpc.ServiceException("WSWS3062E: Error: portName should not be null.");
        }
    }
	public java.lang.String getServiceAddress() {
		ClassLoader cl = this.getClass().getClassLoader();
		InputStream is = null;
		try {
			System.out.println("creating file input stream ...");
			is = cl.getResourceAsStream("consumers.properties");												  
			System.out.println("created file input stream!");
		} catch (Exception fe) {
			System.out.println("File Not Found! \n");
			fe.printStackTrace();
		}
		
		// load properties 
		Properties prop = new Properties();
		try {
			System.out.println("Loading the properties ...");
			prop.load(is);
			System.out.println("Loaded the properties!");
		} catch(Exception ie) {
			System.out.println("Could not load Properties!" + ie.getStackTrace());
		}
		
		// get the service address from properties
		String myHelloWorldService_address = prop.getProperty("helloWorld.serviceAddress");
		System.out.println("Hello World WAS Service Address is:" + myHelloWorldService_address);
		return myHelloWorldService_address;
	}
}

