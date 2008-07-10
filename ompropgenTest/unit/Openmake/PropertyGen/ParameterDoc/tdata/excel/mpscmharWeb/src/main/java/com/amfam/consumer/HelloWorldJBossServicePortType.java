
package com.amfam.consumer;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import com.amfam.schema.xsd.automation.ping.v1.PingInputType;
import com.amfam.schema.xsd.automation.ping.v1.PingResultType;

@WebService(name = "HelloWorldJBossServicePortType", targetNamespace = "http://service.amfam.com")
@SOAPBinding(use = SOAPBinding.Use.LITERAL, parameterStyle = SOAPBinding.ParameterStyle.WRAPPED)
public interface HelloWorldJBossServicePortType {

	@WebMethod(operationName = "message", action = "")
	@WebResult(name = "out", targetNamespace = "http://service.amfam.com")
	public String message(
			@WebParam(name = "in0", targetNamespace = "http://service.amfam.com")
			String in0);

	@WebMethod(operationName = "ping", action = "")
	@WebResult(name = "out", targetNamespace = "http://service.amfam.com")
	public PingResultType ping(
			@WebParam(name = "in0", targetNamespace = "http://service.amfam.com")
			PingInputType in0);

}
