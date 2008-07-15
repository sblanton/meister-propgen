<%@page contentType="text/html;charset=UTF-8"%>
<jsp:directive.page
	import="com.amfam.schema.xsd.automation.ping.v1.PingInputType" />
<jsp:directive.page
	import="com.amfam.schema.xsd.automation.ping.v1.PingLevelType" />
<jsp:directive.page
	import="com.amfam.schema.xsd.automation.ping.v1.StatusType" />
<jsp:directive.page
	import="com.amfam.schema.xsd.automation.ping.v1.VerificationType" />
<jsp:directive.page
	import="com.amfam.schema.xsd.automation.ping.v1.ArrayOfVerificationType" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Iterator" />
<HTML>
	<HEAD>
		<TITLE>Result</TITLE>
	</HEAD>
	<BODY>
		<H1>
			Result
		</H1>

		<jsp:useBean id="helloWorldId" scope="session"
			class="com.amfam.consumer.ClientFacade" />

		<%
			String method = request.getParameter("method");
			int methodID = 0;
			if (method == null)
				methodID = -1;

			if (methodID != -1)
				methodID = Integer.parseInt(method);

			boolean gotMethod = false;

			try {
				switch (methodID) {
				case 18:
					gotMethod = true;
					String in0_2id = request.getParameter("message");

					java.lang.String message18mtemp = helloWorldId
					.message(in0_2id);
					if (message18mtemp != null) {
		%>
		Output Message :
		<b><%=message18mtemp%> </b>
		<%
					}
					break;
				case 23:
					gotMethod = true;
					com.amfam.schema.xsd.automation.ping.v1.PingResultType ping23mtemp = helloWorldId
					.ping(null);
					if (ping23mtemp == null) {
		%>
		<%=ping23mtemp%>
		<%
		} else {
		%>
		<TABLE>
			<TR>
				<TD COLSPAN="3" ALIGN="LEFT">
					PingResultType:
				</TD>
			<TR>
				<TD WIDTH="5%"></TD>
				<TD COLSPAN="2" ALIGN="LEFT">
					verification:
				</TD>
			<TR>
				<TD WIDTH="5%"></TD>
				<TD WIDTH="5%"></TD>
				<TD COLSPAN="1" ALIGN="LEFT">
					verificationType:
				</TD>
				<TD>
					<%
								if (ping23mtemp != null) {
								ArrayOfVerificationType type = (ArrayOfVerificationType) ping23mtemp.getVerification();
								List list = type.getVerificationType();
								int counter = 0;
								Iterator it = list.iterator();

								while (it.hasNext()) {
									counter++;
									VerificationType v = (VerificationType)it.next();
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
								<%=v.getStatus()%>
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
					%>
				</TD>
			<TR>
				<TD WIDTH="5%"></TD>
				<TD COLSPAN="2" ALIGN="LEFT">
					message:
				</TD>
				<TD>
					<%
									if (ping23mtemp != null) {
									java.lang.String typemessage30 = (String) ping23mtemp.getMessage();
					%>
					<b><%=typemessage30%> </b>
					<%
					}
					%>
				</TD>
			<TR>
				<TD WIDTH="5%"></TD>
				<TD COLSPAN="2" ALIGN="LEFT">
					timeTakenForPing:
				</TD>
				<TD>
					<%
									if (ping23mtemp != null) {
									java.lang.String typetimeTakenForPing32 = (String) ping23mtemp.getTimeTakenForPing();
					%>
					<b><%=typetimeTakenForPing32%> </b>
					<%
					}
					%>
				
			<TR>
				<TD WIDTH="5%"></TD>
				<TD COLSPAN="2" ALIGN="LEFT">
					Status:
				</TD>
				<TD>
					<%
									if (ping23mtemp != null) {
									StatusType st = (StatusType) ping23mtemp.getStatus();
					%>
					<b><%=st%> </b>
					<%
					}
					%>
				</TD>
				
		</TABLE>
		<%
					}
					}
					break;
				}
			} catch (Exception e) {
		%>
		exception:
		<%=e%>
		<%
			return;
			}
			if (!gotMethod) {
		%>
		result: N/A
		<%
		}
		%>
	</BODY>
</HTML>
