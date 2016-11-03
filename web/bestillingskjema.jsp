<%-- 
    Document   : bestillingskjema
    Created on : 28.okt.2016, 17:29:04
    Author     : Henrik
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="style.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page language="java" %>

        <% if (session.getAttribute("uname") == null) {
           %>Click here to<a href="/index.jsp" >logout</a><%
               response.sendRedirect("logout.jsp");
        } else {
        %> Welcome, <%=session.getAttribute("uname")%> 

      . Click here to <a href="logout.jsp">Logout</a>
        <%}%>
        <form action="bestilling.jsp">
            <%
                PreparedStatement ps;
                PreparedStatement ps2;
                int kundeID = 0;

                // DataSource ds = InitialContext.doLookup("jdbc/sample");
                Connection c = null;

                try {
                    c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");
                    Statement st = c.createStatement();
                    ResultSet rs = st.executeQuery(
                            "SELECT * FROM REISE where Status=1");

            %>
            <center>
                <h1 name="DDL_TITLE"> Dato</h1>
                <select name="dato">
                    <%  while (rs.next()) {%>
                    <option><%= rs.getString(2)%></option>
                    <% } %>

                </select>
            </center>

            <%

            } catch (Exception e) {
                out.println("wrong entry: " + e);
                c.close();
}
            %>

            <%
                // selecting destinasjon for reise
                Connection c3 = null;
                try {
                    c3 = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");
                    Statement st = c3.createStatement();
                    ResultSet rs = st.executeQuery(
                            "SELECT * from DESTINASJON");
                    //Class.forName("com.mysql.jdbc.Driver").newInstance();
                    //Connection c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2","Henke","troll123");
                    //Connection c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=Hobbyhuset", "bigjokke", "123123");

            %>
            <center>
                <h1> Destinasjon</h1>
                <select name="destinasjon">
                    <%  while (rs.next()) {%>
                    <option><%= rs.getString(2)%></option>
                    <% } %>

                </select>
            </center>

            <%
                 //**Should I input the codes here?**
                    // dGD8QhQkoGev - joakikn pw
                    // ZT8s1tbxlelJ - henrikvt pw
                } catch (Exception e) {
                    out.println("wrong entry: " + e);
                    c3.close();
                }
                
            %>

            <%
                // selecting destinasjon for reise
                Connection c4 = null;
                try {
                    c4 = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");
                    Statement st = c.createStatement();
                    ResultSet rs = st.executeQuery(
                            "SELECT * from Tilleggspakke");
                    //Class.forName("com.mysql.jdbc.Driver").newInstance();
                    //Connection c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2","Henke","troll123");
                    //Connection c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=Hobbyhuset", "bigjokke", "123123");

            %>
            <center>
                <h1> Tilleggspakke</h1>
                <select name="tillegg">
                    <%  while (rs.next()) {%>
                    <option><%= rs.getString(2)%></option>
                    <% } %>

                </select>
            </center>

            <%
                    //**Should I input the codes here?**
                    // dGD8QhQkoGev - joakikn pw
                    // ZT8s1tbxlelJ - henrikvt pw
                } catch (Exception e) {
                    out.println("wrong entry: " + e);
                }
                c4.close();
            %>




            <input type="submit" value="Bestill"/>
        </form>

    </body>
</html>
