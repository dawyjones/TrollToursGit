<%-- 
    Document   : logginnconf
    Created on : 28.okt.2016, 17:39:16
    Author     : Henrik
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <h1>Logged on</h1>

        <%
            PreparedStatement ps;
            Connection conn;
            // Connection conn2;
            ResultSet rs = null;
            conn = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");

            Statement st = conn.createStatement();
        %> 
        <%
            boolean flag = false;
            boolean admin = false;
            boolean adminRs = false;
            int brukerID = 0;
            String adminStrRs = null;
            String name = request.getParameter("brukernavn");
            String password = request.getParameter("passord");
        %>

        <%
            try {
                PreparedStatement statement3 = conn.prepareStatement("SELECT Bruker_ID FROM Bruker WHERE Username=? and Password= ?");
                statement3.setString(1, name);
                statement3.setString(2, password);
                ResultSet rs3 = statement3.executeQuery();

                if (rs3.next()) {

                    PreparedStatement statement4 = conn.prepareStatement("SELECT Admin FROM Bruker WHERE Username=? and Password= ?");
                    statement4.setString(1, name);
                    statement4.setString(2, password);
                    ResultSet rs4 = statement4.executeQuery();
                    while (rs4.next()) {
                        adminRs = rs4.getBoolean("Admin");
                    }
                    if (adminRs) {
                        admin = true;

                    } else {
                        flag = true;
                    }

                    session.setAttribute("uname", name);
                    //out.println("TP ID: " + tpID);
                } else {
                    request.setAttribute("err", "user name or password error!");
                }

                rs.close();
                statement3.close();
                conn.close();

            } catch (Exception e) {
                out.println(e);
            }
        %>


        <%           if (flag) {
        %>
        <jsp:forward page="bestillingskjema.jsp"/>
        <% } else if (admin) {
        %>
        <jsp:forward page="AdminSite.jsp"/> 
        <% } else {
        %>
        <jsp:forward page="login.jsp"/> 
        <% }
        %>
    </body> 
</html>
