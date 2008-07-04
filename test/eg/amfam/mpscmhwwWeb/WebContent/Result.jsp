<%@page contentType="text/html;charset=UTF-8"%><HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="HelloWorldWASServiceProxyid" scope="session" class="com.amfam.service.HelloWorldWASServiceProxy" />

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        String useJNDI_0id=  request.getParameter("useJNDI5");
        boolean useJNDI_0idTemp  = Boolean.valueOf(useJNDI_0id).booleanValue();
        HelloWorldWASServiceProxyid.useJNDI(useJNDI_0idTemp);
break;
case 7:
        gotMethod = true;
        java.lang.String getEndpoint7mtemp = HelloWorldWASServiceProxyid.getEndpoint();
if(getEndpoint7mtemp == null){
%>
<%=getEndpoint7mtemp %>
<%
}else{
        String tempResultreturnp8 = String.valueOf(getEndpoint7mtemp);
        %>
        <%= tempResultreturnp8 %>
        <%
}
break;
case 10:
        gotMethod = true;
        String endpoint_1id=  request.getParameter("endpoint13");
        java.lang.String endpoint_1idTemp  = endpoint_1id;
        HelloWorldWASServiceProxyid.setEndpoint(endpoint_1idTemp);
break;
case 15:
        gotMethod = true;
        com.amfam.service.HelloWorldWASService_Port getHelloWorldWASService15mtemp = HelloWorldWASServiceProxyid.getHelloWorldWASService_Port();
if(getHelloWorldWASService15mtemp == null){
%>
<%=getHelloWorldWASService15mtemp %>
<%
}else{
        if(getHelloWorldWASService15mtemp!= null){
        String tempreturnp16 = getHelloWorldWASService15mtemp.toString();
        %>
        <%=tempreturnp16%>
        <%
        }}
break;
case 18:
        gotMethod = true;
        String msg_2id=  request.getParameter("msg21");
        java.lang.String msg_2idTemp  = msg_2id;
        java.lang.String message18mtemp = HelloWorldWASServiceProxyid.message(msg_2idTemp);
if(message18mtemp == null){
%>
<%=message18mtemp %>
<%
}else{
        String tempResultreturnp19 = String.valueOf(message18mtemp);
        %>
        <%= tempResultreturnp19 %>
        <%
}
break;
case 23:
        gotMethod = true;
        %>
        <jsp:useBean id="com1amfam1service1PingLevelType_4id" scope="session" class="com.amfam.service.PingLevelType" />
        <%
        %>
        <jsp:useBean id="com1amfam1service1PingInputType_3id" scope="session" class="com.amfam.service.PingInputType" />
        <%
        com1amfam1service1PingInputType_3id.setPingLevel(com1amfam1service1PingLevelType_4id);
        com.amfam.service.PingResultType ping23mtemp = HelloWorldWASServiceProxyid.ping(com1amfam1service1PingInputType_3id);
if(ping23mtemp == null){
%>
<%=ping23mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">status:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">value:</TD>
<TD>
<%
if(ping23mtemp != null){
com.amfam.service.StatusType tebece0=ping23mtemp.getStatus();
if(tebece0 != null){
java.lang.String typevalue28 = tebece0.getValue();
        String tempResultvalue28 = String.valueOf(typevalue28);
        %>
        <%= tempResultvalue28 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">verification:</TD>
<TD>
<%
if(ping23mtemp != null){
com.amfam.service.VerificationType[] typeverification30 = ping23mtemp.getVerification();
        java.util.List listverification30= java.util.Arrays.asList(typeverification30);
		java.util.Iterator  it = listverification30.iterator();
		int counter=0;
								while (it.hasNext()) {
									counter++;
									com.amfam.service.VerificationType v = (com.amfam.service.VerificationType)it.next();
					%>
					<Table border='1' cellpadding="0" cellspacing="0" bordercolor="navy">
						<tr>
							<td>
								VerificationType<b>[<%=counter%>]</b>
							</td>
							<td>
								&nbsp;		
							</td>
						</tr>
						<tr>
							<td>
								Componenet Name:
							</td>
							<td>
								<%=v.getComponentName()%>
							</td>
						</tr>
						<tr>
							<td>
								Status :
							</td>
							<td>
								<%=v.getStatus().getValue()%>
							</td>
						</tr>
						<tr>
							<td>
								Message :
							</td>
							<td>
								<%=v.getMessage()%>
							</td>
						</tr>
						<tr>
							<td>
								Time Taken :
							</td>
							<td>
								<%=v
														.getTimeTakenForComponentVerification()%>
							</td>
						</tr>
					</Table>



					<%
					}


}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">message:</TD>
<TD>
<%
if(ping23mtemp != null){
java.lang.String typemessage32 = ping23mtemp.getMessage();
        String tempResultmessage32 = String.valueOf(typemessage32);
        %>
        <%= tempResultmessage32 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">timeTakenForPing:</TD>
<TD>
<%
if(ping23mtemp != null){
java.lang.String typetimeTakenForPing34 = ping23mtemp.getTimeTakenForPing();
        String tempResulttimeTakenForPing34 =String.valueOf(typetimeTakenForPing34);
        %>
        <%= tempResulttimeTakenForPing34 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
}
} catch (Exception e) { 
%>
exception: <%= e %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>