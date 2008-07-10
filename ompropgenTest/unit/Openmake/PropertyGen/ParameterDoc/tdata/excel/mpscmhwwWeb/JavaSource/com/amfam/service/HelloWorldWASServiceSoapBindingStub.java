/**
 * HelloWorldWASServiceSoapBindingStub.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

public class HelloWorldWASServiceSoapBindingStub extends com.ibm.ws.webservices.engine.client.Stub implements com.amfam.service.HelloWorldWASService_Port {
    public HelloWorldWASServiceSoapBindingStub(java.net.URL endpointURL, javax.xml.rpc.Service service) throws com.ibm.ws.webservices.engine.WebServicesFault {
        if (service == null) {
            super.service = new com.ibm.ws.webservices.engine.client.Service();
        }
        else {
            super.service = service;
        }
        super.engine = ((com.ibm.ws.webservices.engine.client.Service) super.service).getEngine();
        initTypeMapping();
        super.cachedEndpoint = endpointURL;
        super.connection = ((com.ibm.ws.webservices.engine.client.Service) super.service).getConnection(endpointURL);
        super.messageContexts = new com.ibm.ws.webservices.engine.MessageContext[2];
    }

    private void initTypeMapping() {
        javax.xml.rpc.encoding.TypeMapping tm = super.getTypeMapping(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
        java.lang.Class javaType = null;
        javax.xml.namespace.QName xmlType = null;
        com.ibm.ws.webservices.engine.encoding.SerializerFactory sf = null;
        com.ibm.ws.webservices.engine.encoding.DeserializerFactory df = null;
        javaType = com.amfam.service.VerificationType.class;
        xmlType = com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "VerificationType");
        sf = com.ibm.ws.webservices.engine.encoding.ser.BaseSerializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanSerializerFactory.class, javaType, xmlType);
        df = com.ibm.ws.webservices.engine.encoding.ser.BaseDeserializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanDeserializerFactory.class, javaType, xmlType);
        if (sf != null || df != null) {
            tm.register(javaType, xmlType, sf, df);
        }

        javaType = com.amfam.service.PingLevelType.class;
        xmlType = com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "PingLevelType");
        sf = com.ibm.ws.webservices.engine.encoding.ser.BaseSerializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanSerializerFactory.class, javaType, xmlType);
        df = com.ibm.ws.webservices.engine.encoding.ser.BaseDeserializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanDeserializerFactory.class, javaType, xmlType);
        if (sf != null || df != null) {
            tm.register(javaType, xmlType, sf, df);
        }

        javaType = com.amfam.service.PingResultType.class;
        xmlType = com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "PingResultType");
        sf = com.ibm.ws.webservices.engine.encoding.ser.BaseSerializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanSerializerFactory.class, javaType, xmlType);
        df = com.ibm.ws.webservices.engine.encoding.ser.BaseDeserializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanDeserializerFactory.class, javaType, xmlType);
        if (sf != null || df != null) {
            tm.register(javaType, xmlType, sf, df);
        }

        javaType = com.amfam.service.StatusType.class;
        xmlType = com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "StatusType");
        sf = com.ibm.ws.webservices.engine.encoding.ser.BaseSerializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanSerializerFactory.class, javaType, xmlType);
        df = com.ibm.ws.webservices.engine.encoding.ser.BaseDeserializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanDeserializerFactory.class, javaType, xmlType);
        if (sf != null || df != null) {
            tm.register(javaType, xmlType, sf, df);
        }

        javaType = com.amfam.service.PingInputType.class;
        xmlType = com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "PingInputType");
        sf = com.ibm.ws.webservices.engine.encoding.ser.BaseSerializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanSerializerFactory.class, javaType, xmlType);
        df = com.ibm.ws.webservices.engine.encoding.ser.BaseDeserializerFactory.createFactory(com.ibm.ws.webservices.engine.encoding.ser.BeanDeserializerFactory.class, javaType, xmlType);
        if (sf != null || df != null) {
            tm.register(javaType, xmlType, sf, df);
        }

    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _messageOperation0 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getmessageOperation0() {
        if (_messageOperation0 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "msg"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
            };
            _messageOperation0 = new com.ibm.ws.webservices.engine.description.OperationDesc("message", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "messageReturn"));
            _messageOperation0.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"));
            _messageOperation0.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "message"));
            _messageOperation0.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _messageOperation0;
    }

    private int _messageIndex0 = 0;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getmessageInvoke0(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_messageIndex0];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getmessageOperation0());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_messageIndex0] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public java.lang.String message(java.lang.String msg) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getmessageInvoke0(new java.lang.Object[] {msg}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return (java.lang.String) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue();
        } catch (java.lang.Exception _exception) {
            return (java.lang.String) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), java.lang.String.class);
        }
    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _pingOperation1 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getpingOperation1() {
        if (_pingOperation1 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "pingInput"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "PingInputType"), com.amfam.service.PingInputType.class, false, false), 
            };
            _pingOperation1 = new com.ibm.ws.webservices.engine.description.OperationDesc("ping", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "pingReturn"));
            _pingOperation1.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "PingResultType"));
            _pingOperation1.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://service.amfam.com", "ping"));
            _pingOperation1.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _pingOperation1;
    }

    private int _pingIndex1 = 1;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getpingInvoke1(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_pingIndex1];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getpingOperation1());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_pingIndex1] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public com.amfam.service.PingResultType ping(com.amfam.service.PingInputType pingInput) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getpingInvoke1(new java.lang.Object[] {pingInput}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return (com.amfam.service.PingResultType) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue();
        } catch (java.lang.Exception _exception) {
            return (com.amfam.service.PingResultType) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), com.amfam.service.PingResultType.class);
        }
    }

}
