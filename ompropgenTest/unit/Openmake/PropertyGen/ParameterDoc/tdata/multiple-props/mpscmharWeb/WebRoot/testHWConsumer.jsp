<%@ page language="java"
	import="org.codehaus.xfire.client.Client,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="ISO-8859-1"%>
<jsp:directive.page import="com.amfam.schema.xsd.automation.ping.v1.PingResultType"/>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>JBoss Test Consumer for JBoss WebService Provider</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>

		<%!ApplicationContext context = new ClassPathXmlApplicationContext(
			"com/amfam/consumer/HelloWorldService-consumer.xml");

	Client client = (Client) context
			.getBean("xfire.consumer.HelloWorldJBossService");%>

		<%
			System.out.println(" Invoking message on client ");
			Object[] results = client.invoke("message",
					new Object[] { "Test JBoss Consumer" });
			Object[] pingResults = client.invoke("ping", new Object[] { null });
			PingResultType resultType =null;
			if(pingResults[0]!=null){
				resultType = (PingResultType) pingResults[0];
				
			}
			System.out.println(" Results:" + results[0]);
		%>

		<br>

		<div align="center">
			<b> Message From Service: <br> <%=results[0]%> </b>
			<b> Ping Object From Service: <br> <%=resultType%> </b>
		</div>
	</body>
</html>
