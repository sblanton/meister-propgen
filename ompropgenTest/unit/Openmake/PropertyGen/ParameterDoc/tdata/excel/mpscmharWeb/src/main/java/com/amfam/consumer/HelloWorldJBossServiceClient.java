
package com.amfam.consumer;

import java.net.MalformedURLException;
import java.util.Collection;
import java.util.HashMap;

import javax.xml.namespace.QName;

import org.codehaus.xfire.XFireRuntimeException;
import org.codehaus.xfire.aegis.AegisBindingProvider;
import org.codehaus.xfire.annotations.AnnotationServiceFactory;
import org.codehaus.xfire.annotations.jsr181.Jsr181WebAnnotations;
import org.codehaus.xfire.client.XFireProxyFactory;
import org.codehaus.xfire.jaxb2.JaxbTypeRegistry;
import org.codehaus.xfire.service.Endpoint;
import org.codehaus.xfire.service.Service;
import org.codehaus.xfire.soap.AbstractSoapBinding;
import org.codehaus.xfire.transport.TransportManager;

public class HelloWorldJBossServiceClient {

    private static XFireProxyFactory proxyFactory = new XFireProxyFactory();
    private HashMap endpoints = new HashMap();
    private Service service0;

    public HelloWorldJBossServiceClient() {
        create0();
        Endpoint HelloWorldJBossServicePortTypeLocalEndpointEP = service0 .addEndpoint(new QName("http://service.amfam.com", "HelloWorldJBossServicePortTypeLocalEndpoint"), new QName("http://service.amfam.com", "HelloWorldJBossServicePortTypeLocalBinding"), "xfire.local://HelloWorldJBossService");
        endpoints.put(new QName("http://service.amfam.com", "HelloWorldJBossServicePortTypeLocalEndpoint"), HelloWorldJBossServicePortTypeLocalEndpointEP);
        Endpoint HelloWorldJBossServiceHttpPortEP = service0 .addEndpoint(new QName("http://service.amfam.com", "HelloWorldJBossServiceHttpPort"), new QName("http://service.amfam.com", "HelloWorldJBossServiceHttpBinding"), "http://localhost:8080/mpscmhar_service2/services/HelloWorldJBossService");
        endpoints.put(new QName("http://service.amfam.com", "HelloWorldJBossServiceHttpPort"), HelloWorldJBossServiceHttpPortEP);
    }

    public Object getEndpoint(Endpoint endpoint) {
        try {
            return proxyFactory.create((endpoint).getBinding(), (endpoint).getUrl());
        } catch (MalformedURLException e) {
            throw new XFireRuntimeException("Invalid URL", e);
        }
    }

    public Object getEndpoint(QName name) {
        Endpoint endpoint = ((Endpoint) endpoints.get((name)));
        if ((endpoint) == null) {
            throw new IllegalStateException("No such endpoint!");
        }
        return getEndpoint((endpoint));
    }

    public Collection getEndpoints() {
        return endpoints.values();
    }

    private void create0() {
        TransportManager tm = (org.codehaus.xfire.XFireFactory.newInstance().getXFire().getTransportManager());
        HashMap props = new HashMap();
        props.put("annotations.allow.interface", true);
        AnnotationServiceFactory asf = new AnnotationServiceFactory(new Jsr181WebAnnotations(), tm, new AegisBindingProvider(new JaxbTypeRegistry()));
        asf.setBindingCreationEnabled(false);
        service0 = asf.create((com.amfam.consumer.HelloWorldJBossServicePortType.class), props);
        {
            AbstractSoapBinding soapBinding = asf.createSoap11Binding(service0, new QName("http://service.amfam.com", "HelloWorldJBossServiceHttpBinding"), "http://schemas.xmlsoap.org/soap/http");
        }
        {
            AbstractSoapBinding soapBinding = asf.createSoap11Binding(service0, new QName("http://service.amfam.com", "HelloWorldJBossServicePortTypeLocalBinding"), "urn:xfire:transport:local");
        }
    }

    public HelloWorldJBossServicePortType getHelloWorldJBossServicePortTypeLocalEndpoint() {
        return ((HelloWorldJBossServicePortType)(this).getEndpoint(new QName("http://service.amfam.com", "HelloWorldJBossServicePortTypeLocalEndpoint")));
    }

    public HelloWorldJBossServicePortType getHelloWorldJBossServicePortTypeLocalEndpoint(String url) {
        HelloWorldJBossServicePortType var = getHelloWorldJBossServicePortTypeLocalEndpoint();
        org.codehaus.xfire.client.Client.getInstance(var).setUrl(url);
        return var;
    }

    public HelloWorldJBossServicePortType getHelloWorldJBossServiceHttpPort() {
        return ((HelloWorldJBossServicePortType)(this).getEndpoint(new QName("http://service.amfam.com", "HelloWorldJBossServiceHttpPort")));
    }

    public HelloWorldJBossServicePortType getHelloWorldJBossServiceHttpPort(String url) {
        HelloWorldJBossServicePortType var = getHelloWorldJBossServiceHttpPort();
        org.codehaus.xfire.client.Client.getInstance(var).setUrl(url);
        return var;
    }

    public static void main(String[] args) {
        

        HelloWorldJBossServiceClient client = new HelloWorldJBossServiceClient();
        
		//create a default service endpoint
        HelloWorldJBossServicePortType service = client.getHelloWorldJBossServiceHttpPort();
        
		//TODO: Add custom client code here
        		//
        		//service.yourServiceOperationHere();
        System.out.println(service.ping(null).getVerification().getVerificationType().size());
		System.out.println("test client completed");
        		System.exit(0);
    }

}
