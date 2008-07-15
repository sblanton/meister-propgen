
package com.amfam.schema.xsd.automation.ping.v1;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.amfam.schema.xsd.automation.ping.v1 package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.amfam.schema.xsd.automation.ping.v1
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link VerificationType }
     * 
     */
    public VerificationType createVerificationType() {
        return new VerificationType();
    }

    /**
     * Create an instance of {@link ArrayOfVerificationType }
     * 
     */
    public ArrayOfVerificationType createArrayOfVerificationType() {
        return new ArrayOfVerificationType();
    }

    /**
     * Create an instance of {@link PingInputType }
     * 
     */
    public PingInputType createPingInputType() {
        return new PingInputType();
    }

    /**
     * Create an instance of {@link PingResultType }
     * 
     */
    public PingResultType createPingResultType() {
        return new PingResultType();
    }

}
