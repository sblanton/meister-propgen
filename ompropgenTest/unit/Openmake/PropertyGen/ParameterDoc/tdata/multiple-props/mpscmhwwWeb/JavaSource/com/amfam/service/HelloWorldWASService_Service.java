/**
 * HelloWorldWASService_Service.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

public interface HelloWorldWASService_Service extends javax.xml.rpc.Service {
    public java.lang.String getHelloWorldWASServiceAddress();

    public com.amfam.service.HelloWorldWASService_Port getHelloWorldWASService() throws javax.xml.rpc.ServiceException;

    public com.amfam.service.HelloWorldWASService_Port getHelloWorldWASService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
