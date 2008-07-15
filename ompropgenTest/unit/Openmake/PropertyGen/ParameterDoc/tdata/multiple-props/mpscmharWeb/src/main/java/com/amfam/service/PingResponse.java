
package com.amfam.service;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

import com.amfam.schema.xsd.automation.ping.v1.PingResultType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="out" type="{http://v1.ping.automation.xsd.schema.amfam.com}PingResultType"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "out"
})
@XmlRootElement(name = "pingResponse")
public class PingResponse {

    @XmlElement(required = true, nillable = true)
    protected PingResultType out;

    /**
     * Gets the value of the out property.
     * 
     * @return
     *     possible object is
     *     {@link PingResultType }
     *     
     */
    public PingResultType getOut() {
        return out;
    }

    /**
     * Sets the value of the out property.
     * 
     * @param value
     *     allowed object is
     *     {@link PingResultType }
     *     
     */
    public void setOut(PingResultType value) {
        this.out = value;
    }

}
