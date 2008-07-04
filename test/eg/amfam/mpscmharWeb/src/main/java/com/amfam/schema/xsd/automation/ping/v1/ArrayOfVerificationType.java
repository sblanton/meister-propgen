
package com.amfam.schema.xsd.automation.ping.v1;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ArrayOfVerificationType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ArrayOfVerificationType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="VerificationType" type="{http://v1.ping.automation.xsd.schema.amfam.com}VerificationType" maxOccurs="unbounded"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfVerificationType", propOrder = {
    "verificationType"
})
public class ArrayOfVerificationType {

    @XmlElement(name = "VerificationType", required = true)
    protected List<VerificationType> verificationType;

    /**
     * Gets the value of the verificationType property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the verificationType property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getVerificationType().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link VerificationType }
     * 
     * 
     */
    public List<VerificationType> getVerificationType() {
        if (verificationType == null) {
            verificationType = new ArrayList<VerificationType>();
        }
        return this.verificationType;
    }

}
