/**
 * PingResultType.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

public class PingResultType  implements java.io.Serializable {
    private com.amfam.service.StatusType status;
    private java.lang.String message;
    private com.amfam.service.VerificationType[] verification;
    private java.lang.String timeTakenForPing;

    public PingResultType() {
    }

    public com.amfam.service.StatusType getStatus() {
        return status;
    }

    public void setStatus(com.amfam.service.StatusType status) {
        this.status = status;
    }

    public java.lang.String getMessage() {
        return message;
    }

    public void setMessage(java.lang.String message) {
        this.message = message;
    }

    public com.amfam.service.VerificationType[] getVerification() {
        return verification;
    }

    public void setVerification(com.amfam.service.VerificationType[] verification) {
        this.verification = verification;
    }

    public com.amfam.service.VerificationType getVerification(int i) {
        return verification[i];
    }

    public void setVerification(int i, com.amfam.service.VerificationType value) {
        this.verification[i] = value;
    }

    public java.lang.String getTimeTakenForPing() {
        return timeTakenForPing;
    }

    public void setTimeTakenForPing(java.lang.String timeTakenForPing) {
        this.timeTakenForPing = timeTakenForPing;
    }

    private transient java.lang.ThreadLocal __history;
    public boolean equals(java.lang.Object obj) {
        if (obj == null) { return false; }
        if (obj.getClass() != this.getClass()) { return false;}
        PingResultType other = (PingResultType) obj;
        boolean _equals;
        _equals = true
            && ((this.message==null && other.getMessage()==null) || 
             (this.message!=null &&
              this.message.equals(other.getMessage())))
            && ((this.timeTakenForPing==null && other.getTimeTakenForPing()==null) || 
             (this.timeTakenForPing!=null &&
              this.timeTakenForPing.equals(other.getTimeTakenForPing())));
        if (!_equals) { return false; }
        if (__history == null) {
            synchronized (this) {
                if (__history == null) {
                    __history = new java.lang.ThreadLocal();
                }
            }
        }
        PingResultType history = (PingResultType) __history.get();
        if (history != null) { return (history == obj); }
        if (this == obj) return true;
        __history.set(obj);
        _equals = true
            && ((this.status==null && other.getStatus()==null) || 
             (this.status!=null &&
              this.status.equals(other.getStatus())))
            && ((this.verification==null && other.getVerification()==null) || 
             (this.verification!=null &&
              java.util.Arrays.equals(this.verification, other.getVerification())));
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
        PingResultType history = (PingResultType) __hashHistory.get();
        if (history != null) { return 0; }
        __hashHistory.set(this);
        int _hashCode = 1;
        if (getStatus() != null) {
            _hashCode += getStatus().hashCode();
        }
        if (getMessage() != null) {
            _hashCode += getMessage().hashCode();
        }
        if (getVerification() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getVerification());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getVerification(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getTimeTakenForPing() != null) {
            _hashCode += getTimeTakenForPing().hashCode();
        }
        __hashHistory.set(null);
        return _hashCode;
    }

}
