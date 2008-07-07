/**
 * HelloWorldWASService_Port.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

public interface HelloWorldWASService_Port extends java.rmi.Remote {
    public java.lang.String message(java.lang.String msg) throws java.rmi.RemoteException;
    public com.amfam.service.PingResultType ping(com.amfam.service.PingInputType pingInput) throws java.rmi.RemoteException;
}
