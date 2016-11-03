<%-- 
    Document   : logout
    Created on : 02.nov.2016, 16:36:21
    Author     : Henrik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logging out</h1>
        
        
        <% if(session.getAttribute("uname")!=null) {
	session.invalidate();
	out.println("Successfully Logged out.");
	%>
    <script type="text/javascript">
function Redirect()
{
    window.location="index.jsp";
}
document.write("You will be redirected to main page in a few sec.");
setTimeout('Redirect()', 5000);
</script>
<%
}
else
{%>
You're logged out. 
Click <a href="index.jsp">here</a> to go to the home page.
<%}%>
</body>
</html>
        
    </body>
</html>
