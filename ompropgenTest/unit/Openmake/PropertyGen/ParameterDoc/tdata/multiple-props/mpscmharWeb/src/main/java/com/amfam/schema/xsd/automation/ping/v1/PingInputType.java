
package com.amfam.schema.xsd.automation.ping.v1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PingInputType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="PingInputType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="pingLevel" type="{http://v1.ping.automation.xsd.schema.amfam.com}PingLevelType"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PingInputType", propOrder = {
    "pingLevel"
})
public class PingInputType {

    @XmlElement(required = true)
    protected PingLevelType pingLevel;

    /**
     * Gets the value of the pingLevel property.
     * 
     * @return
     *     possible object is
     *     {@link PingLevelType }
     *     
     */
    public PingLevelType getPingLevel() {
        return pingLevel;
    }

    /**
     * Sets the value of the pingLevel property.
     * 
     * @param value
     *     allowed object is
     *     {@link PingLevelType }
     *     
     */
    public void setPingLevel(PingLevelType value) {
        this.pingLevel = value;
    }

}
