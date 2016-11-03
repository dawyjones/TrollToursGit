<%-- 
    Document   : AdminSiteReg
    Created on : 02.nov.2016, 14:12:05
    Author     : Henrik
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Administration addition communicator page</h1>


        <%
            ResultSet rs5 = null;
            ResultSet rsHeli = null;
            ResultSet rsDest = null;

            Connection c = null;

      
            if (request.getParameter("addHeli") != null) {
                String antPlass = request.getParameter("AntallPlasser");
                String heliType = request.getParameter("HeliType");
                try {

                    c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");

                    PreparedStatement stmtAddHeli = c.prepareStatement("INSERT INTO Helikopter values(?,?)");

                    stmtAddHeli.setString(1, antPlass);
                    stmtAddHeli.setString(2, heliType);
                    stmtAddHeli.execute();
                    out.println("Helikopter Added to database");

                } catch (Exception e) {
                    out.println("wrong entry2: " + e);
                }
            }

            if (request.getParameter("addReise") != null) {
                String dato = request.getParameter("Dato");
                String heliID = request.getParameter("HeliID");
                String status = request.getParameter("Status");
                try {

                    c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");

                    PreparedStatement stmtAddHeli = c.prepareStatement("INSERT INTO Reise values(?,?,?)");

                    stmtAddHeli.setString(1, dato);
                    stmtAddHeli.setString(2, heliID);
                    stmtAddHeli.setString(3, status);

                    stmtAddHeli.execute();
                    out.println("Reise Added to database");

                } catch (Exception e) {
                    out.println("wrong entry2: " + e);
                }
            }

        %>

        <a href="AdminSite.jsp">Back to database view</a>
    </body>
</html>
