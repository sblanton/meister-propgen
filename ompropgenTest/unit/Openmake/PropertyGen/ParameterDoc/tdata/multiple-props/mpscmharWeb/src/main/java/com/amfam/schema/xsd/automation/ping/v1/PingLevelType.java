
package com.amfam.schema.xsd.automation.ping.v1;

import javax.xml.bind.annotation.XmlEnum;


/**
 * <p>Java class for PingLevelType.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="PingLevelType">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="COMPONENT"/>
 *     &lt;enumeration value="NONE"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlEnum
public enum PingLevelType {

    COMPONENT,
    NONE;

    public String value() {
        return name();
    }

    public static PingLevelType fromValue(String v) {
        return valueOf(v);
    }

}
