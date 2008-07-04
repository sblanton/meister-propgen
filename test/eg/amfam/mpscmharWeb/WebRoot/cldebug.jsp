<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<html>
<head>
	<title>ClassLoader Debugger</title>	
</head>

<body>

<form action="cldebug.jsp">
fully qualified class name:<input type="text" size=100 name="class"><p>
<input type="submit">
</form>


<%

        String className= "";

        className= request.getParameter("class");

        if (className == null) {
            out.print("You must specify a fully qualified class name (e.g. java.lang.String)<p>");
        } else {
            out.print("You specified class [" + className + "]<p>");

            
            URL url = this.getClass().getClassLoader().getResource( className.replace('.','/') + ".class" );
            out.print( "Resource location: " + url + "<p>" );
            
            try {
                Class requestedClass = Class.forName(className);
                if (requestedClass != null) {
                    if (Serializable.class.isAssignableFrom(requestedClass)) {
                        ObjectStreamClass osc = ObjectStreamClass.lookup(requestedClass);
                        if (osc != null) {
                        
                            out.print("The class is Serializable, and the serialVersionUID is [" + osc.getSerialVersionUID() + "]<p>");
                        } else {
                            out.print("The class is Serializable, but I cannot determine the serialVersionUID<p>");
                        }
                    } else {
                        out.print("The class is not Serializable<p>");
                    } 
                    ClassLoader directClassLoader = requestedClass.getClassLoader();
                    if (directClassLoader != null) {
                        List hierarchy = new ArrayList();
                        hierarchy.add(directClassLoader);  
                        ClassLoader currentClassLoader = directClassLoader;
                        while (currentClassLoader.getParent() != null) { 
                            currentClassLoader = currentClassLoader.getParent();
                            hierarchy.add(currentClassLoader);
                        }
                        String indent = "";
                        out.print("The result is:<p><table>");
                        for (int i = 0; i < hierarchy.size(); i++) {
                           currentClassLoader = (ClassLoader) hierarchy.get(hierarchy.size() - 1 - i);
                           out.print("<tr><td>");
                           if (i == hierarchy.size() - 1) {
                               out.print("<b>");
                           }
                           out.print(indent + currentClassLoader.toString());
                           if (i == hierarchy.size() - 1) {
                               out.print("</b>");
                           }
                           out.print("</td></tr>");
                           indent = "&nbsp;&nbsp;&nbsp;&nbsp;" + indent;
                        }
                        out.print("</table>");

                    } else {
                        out.print("Class.getClassLoader() was null.  This may mean the bootstrap classloader was used [" + ClassLoader.getSystemClassLoader() + "]");
                    }
                } else {
                    out.print("class was null");
                }
            } catch (ClassNotFoundException e) {
                out.print("Class could not be found");
            } catch (Exception e) {
                out.print("Exception:" + e.toString());
            }
        }

%>



</body>
</html>


