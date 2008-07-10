package com.amfam.consumer;

import org.codehaus.xfire.client.Client;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.amfam.schema.xsd.automation.ping.v1.PingInputType;
import com.amfam.schema.xsd.automation.ping.v1.PingResultType;

public class ClientFacade {
	private Client client = null;

	public ClientFacade() {
		try{
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/amfam/consumer/HelloWorldService-consumer.xml");

		System.out.println(" Creating Client... ");
		client = (Client) context
				.getBean("xfire.consumer.HelloWorldJBossService");
		}catch(Throwable te){
			te.printStackTrace();
		}

	}

	public String message(String message) throws Exception {
		Object[] results = client.invoke("message", new Object[] { message });
		return results[0].toString();
	}

	public PingResultType ping(PingInputType inputType) throws Exception {
		Object[] results = client.invoke("ping", new Object[] { inputType });
		return (PingResultType) results[0];
	}

}
