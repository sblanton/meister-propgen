package com.amfam.consumer;

import org.codehaus.xfire.client.Client;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.amfam.schema.xsd.automation.ping.v1.PingResultType;

public class HelloWorldJBossServicePureJavaClient {
	public static void main(String[] args) {
		try {
			ApplicationContext context = new ClassPathXmlApplicationContext(
					"com/amfam/consumer/HelloWorldService-consumer.xml");

			System.out.println(" Creating Client... ");
			Client client = (Client) context
					.getBean("xfire.consumer.HelloWorldJBossService");
			// Client client =
			// Client.getInstance(context.getBean("HelloWorldService"));

			System.out.println(" Invoking message on client ");
			Object[] results = client.invoke("ping", new Object[] { null });
			PingResultType resultType = (PingResultType)results[0];
			System.out.println(" Returned message = " + resultType);

		} catch (Exception pe) {
			pe.printStackTrace();

		}
	}

}
