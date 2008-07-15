
package com.amfam.schema.xsd.automation.ping.v1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PingResultType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="PingResultType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="message" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="status" type="{http://v1.ping.automation.xsd.schema.amfam.com}StatusType"/>
 *         &lt;element name="timeTakenForPing" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="verification" type="{http://v1.ping.automation.xsd.schema.amfam.com}ArrayOfVerificationType"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PingResultType", propOrder = {
    "message",
    "status",
    "timeTakenForPing",
    "verification"
})
public class PingResultType {

    @XmlElement(required = true)
    protected String message;
    @XmlElement(required = true)
    protected StatusType status;
    @XmlElement(required = true)
    protected String timeTakenForPing;
    @XmlElement(required = true)
    protected ArrayOfVerificationType verification;

    /**
     * Gets the value of the message property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMessage() {
        return message;
    }

    /**
     * Sets the value of the message property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMessage(String value) {
        this.message = value;
    }

    /**
     * Gets the value of the status property.
     * 
     * @return
     *     possible object is
     *     {@link StatusType }
     *     
     */
    public StatusType getStatus() {
        return status;
    }

    /**
     * Sets the value of the status property.
     * 
     * @param value
     *     allowed object is
     *     {@link StatusType }
     *     
     */
    public void setStatus(StatusType value) {
        this.status = value;
    }

    /**
     * Gets the value of the timeTakenForPing property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTimeTakenForPing() {
        return timeTakenForPing;
    }

    /**
     * Sets the value of the timeTakenForPing property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTimeTakenForPing(String value) {
        this.timeTakenForPing = value;
    }

    /**
     * Gets the value of the verification property.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfVerificationType }
     *     
     */
    public ArrayOfVerificationType getVerification() {
        return verification;
    }

    /**
     * Sets the value of the verification property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfVerificationType }
     *     
     */
    public void setVerification(ArrayOfVerificationType value) {
        this.verification = value;
    }

}
