/**
 * PingInputType.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

public class PingInputType  implements java.io.Serializable {
    private com.amfam.service.PingLevelType pingLevel;

    public PingInputType() {
    }

    public com.amfam.service.PingLevelType getPingLevel() {
        return pingLevel;
    }

    public void setPingLevel(com.amfam.service.PingLevelType pingLevel) {
        this.pingLevel = pingLevel;
    }

    private transient java.lang.ThreadLocal __history;
    public boolean equals(java.lang.Object obj) {
        if (obj == null) { return false; }
        if (obj.getClass() != this.getClass()) { return false;}
        if (__history == null) {
            synchronized (this) {
                if (__history == null) {
                    __history = new java.lang.ThreadLocal();
                }
            }
        }
        PingInputType history = (PingInputType) __history.get();
        if (history != null) { return (history == obj); }
        if (this == obj) return true;
        __history.set(obj);
        PingInputType other = (PingInputType) obj;
        boolean _equals;
        _equals = true
            && ((this.pingLevel==null && other.getPingLevel()==null) || 
             (this.pingLevel!=null &&
              this.pingLevel.equals(other.getPingLevel())));
        if (!_equals) {
            __history.set(null);
            return false;
        };
        __history.set(null);
        return true;
    }

    private transient java.lang.ThreadLocal __hashHistory;
    public int hashCode() {
        if (__hashHistory == null) {
            synchronized (this) {
                if (__hashHistory == null) {
                    __hashHistory = new java.lang.ThreadLocal();
                }
            }
        }
        PingInputType history = (PingInputType) __hashHistory.get();
        if (history != null) { return 0; }
        __hashHistory.set(this);
        int _hashCode = 1;
        if (getPingLevel() != null) {
            _hashCode += getPingLevel().hashCode();
        }
        __hashHistory.set(null);
        return _hashCode;
    }

}
