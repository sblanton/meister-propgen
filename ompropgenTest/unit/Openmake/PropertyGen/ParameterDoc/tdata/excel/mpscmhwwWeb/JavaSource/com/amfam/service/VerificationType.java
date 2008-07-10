/**
 * VerificationType.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package com.amfam.service;

public class VerificationType  implements java.io.Serializable {
    private java.lang.String componentName;
    private com.amfam.service.StatusType status;
    private java.lang.String message;
    private java.lang.String timeTakenForComponentVerification;

    public VerificationType() {
    }

    public java.lang.String getComponentName() {
        return componentName;
    }

    public void setComponentName(java.lang.String componentName) {
        this.componentName = componentName;
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

    public java.lang.String getTimeTakenForComponentVerification() {
        return timeTakenForComponentVerification;
    }

    public void setTimeTakenForComponentVerification(java.lang.String timeTakenForComponentVerification) {
        this.timeTakenForComponentVerification = timeTakenForComponentVerification;
    }

    private transient java.lang.ThreadLocal __history;
    public boolean equals(java.lang.Object obj) {
        if (obj == null) { return false; }
        if (obj.getClass() != this.getClass()) { return false;}
        VerificationType other = (VerificationType) obj;
        boolean _equals;
        _equals = true
            && ((this.componentName==null && other.getComponentName()==null) || 
             (this.componentName!=null &&
              this.componentName.equals(other.getComponentName())))
            && ((this.message==null && other.getMessage()==null) || 
             (this.message!=null &&
              this.message.equals(other.getMessage())))
            && ((this.timeTakenForComponentVerification==null && other.getTimeTakenForComponentVerification()==null) || 
             (this.timeTakenForComponentVerification!=null &&
              this.timeTakenForComponentVerification.equals(other.getTimeTakenForComponentVerification())));
        if (!_equals) { return false; }
        if (__history == null) {
            synchronized (this) {
                if (__history == null) {
                    __history = new java.lang.ThreadLocal();
                }
            }
        }
        VerificationType history = (VerificationType) __history.get();
        if (history != null) { return (history == obj); }
        if (this == obj) return true;
        __history.set(obj);
        _equals = true
            && ((this.status==null && other.getStatus()==null) || 
             (this.status!=null &&
              this.status.equals(other.getStatus())));
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
        VerificationType history = (VerificationType) __hashHistory.get();
        if (history != null) { return 0; }
        __hashHistory.set(this);
        int _hashCode = 1;
        if (getComponentName() != null) {
            _hashCode += getComponentName().hashCode();
        }
        if (getStatus() != null) {
            _hashCode += getStatus().hashCode();
        }
        if (getMessage() != null) {
            _hashCode += getMessage().hashCode();
        }
        if (getTimeTakenForComponentVerification() != null) {
            _hashCode += getTimeTakenForComponentVerification().hashCode();
        }
        __hashHistory.set(null);
        return _hashCode;
    }

}
