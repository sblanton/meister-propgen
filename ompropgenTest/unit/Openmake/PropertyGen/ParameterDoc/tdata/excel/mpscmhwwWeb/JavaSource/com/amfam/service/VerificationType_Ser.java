/**
 * VerificationType_Ser.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

public class VerificationType_Ser extends com.ibm.ws.webservices.engine.encoding.ser.BeanSerializer {
    /**
     * Constructor
     */
    public VerificationType_Ser(
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType, 
           com.ibm.ws.webservices.engine.description.TypeDesc _typeDesc) {
        super(_javaType, _xmlType, _typeDesc);
    }
    public void serialize(
        javax.xml.namespace.QName name,
        org.xml.sax.Attributes attributes,
        java.lang.Object value,
        com.ibm.ws.webservices.engine.encoding.SerializationContext context)
        throws java.io.IOException
    {
        context.startElement(name, addAttributes(attributes,value,context));
        addElements(value,context);
        context.endElement();
    }
    protected org.xml.sax.Attributes addAttributes(
        org.xml.sax.Attributes attributes,
        java.lang.Object value,
        com.ibm.ws.webservices.engine.encoding.SerializationContext context)
        throws java.io.IOException
    {
        return attributes;
    }
    protected void addElements(
        java.lang.Object value,
        com.ibm.ws.webservices.engine.encoding.SerializationContext context)
        throws java.io.IOException
    {
        VerificationType bean = (VerificationType) value;
        java.lang.Object propValue;
        javax.xml.namespace.QName propQName;
        {
          propQName = QName_0_10;
          propValue = bean.getComponentName();
          if (propValue != null && !context.shouldSendXSIType()) {
            context.simpleElement(propQName, null, propValue.toString()); 
          } else {
            context.serialize(propQName, null, 
              propValue, 
              QName_1_7,
              true,null);
          }
          propQName = QName_0_2;
          propValue = bean.getStatus();
          context.serialize(propQName, null, 
              propValue, 
              QName_0_6,
              true,null);
          propQName = QName_0_3;
          propValue = bean.getMessage();
          if (propValue != null && !context.shouldSendXSIType()) {
            context.simpleElement(propQName, null, propValue.toString()); 
          } else {
            context.serialize(propQName, null, 
              propValue, 
              QName_1_7,
              true,null);
          }
          propQName = QName_0_11;
          propValue = bean.getTimeTakenForComponentVerification();
          if (propValue != null && !context.shouldSendXSIType()) {
            context.simpleElement(propQName, null, propValue.toString()); 
          } else {
            context.serialize(propQName, null, 
              propValue, 
              QName_1_7,
              true,null);
          }
        }
    }
        public final static javax.xml.namespace.QName QName_0_2 = 
               com.ibm.ws.webservices.engine.utils.QNameTable.createQName(
                      "http://service.amfam.com",
                      "status");
        public final static javax.xml.namespace.QName QName_0_6 = 
               com.ibm.ws.webservices.engine.utils.QNameTable.createQName(
                      "http://service.amfam.com",
                      "StatusType");
        public final static javax.xml.namespace.QName QName_1_7 = 
               com.ibm.ws.webservices.engine.utils.QNameTable.createQName(
                      "http://www.w3.org/2001/XMLSchema",
                      "string");
        public final static javax.xml.namespace.QName QName_0_11 = 
               com.ibm.ws.webservices.engine.utils.QNameTable.createQName(
                      "http://service.amfam.com",
                      "timeTakenForComponentVerification");
        public final static javax.xml.namespace.QName QName_0_3 = 
               com.ibm.ws.webservices.engine.utils.QNameTable.createQName(
                      "http://service.amfam.com",
                      "message");
        public final static javax.xml.namespace.QName QName_0_10 = 
               com.ibm.ws.webservices.engine.utils.QNameTable.createQName(
                      "http://service.amfam.com",
                      "componentName");
}
