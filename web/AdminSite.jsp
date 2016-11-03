<%-- 
    Document   : AdminSite
    Created on : 31.okt.2016, 01:06:59
    Author     : Henrik
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>



    <%
        ResultSet rs5 = null;
        ResultSet rsHeli = null;
        ResultSet rsDest = null;

        Connection c = null;

        try {

            c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");

            PreparedStatement statement5 = c.prepareStatement("SELECT * FROM Reise");
            rs5 = statement5.executeQuery();

            PreparedStatement statementDest = c.prepareStatement("SELECT * FROM Destinasjon");
            rsDest = statementDest.executeQuery();

            PreparedStatement statementHeli = c.prepareStatement("SELECT * FROM Helikopter");
            rsHeli = statementHeli.executeQuery();

        } catch (Exception e) {
            out.println("wrong entry2: " + e);
        }
    %>
    <table name="reiseTable" border="1">
        <thead>
            <tr>
                <th>ReiseID</th>
                <th>Dato</th>
                <th>HelikopterID</th>
                <th>Status/ledig</th>
            </tr>
        </thead>
        <tbody>
            <%                    while (rs5.next()) {%>
            <tr>

                <td><%= rs5.getString(1)%></td>
                <td><%= rs5.getString(2)%></td>
                <td><%= rs5.getString(3)%></td>
                <td><%= rs5.getString(4)%></td>
            </tr>
            <% }%>
        </tbody>
    </table>


    <table border="1"> 
        <thead>
            <tr>
                <th>DestinasjonsID</th>
                <th>Destinasjons navn</th>
            </tr>
        </thead>
        <tbody>
            <%                    while (rsDest.next()) {%>
            <tr>
                <td><%= rsDest.getString(1)%></td>
                <td><%= rsDest.getString(2)%></td>
            </tr>
            <% }%>
        </tbody>
    </table>


    <table border="1">
        <thead>
            <tr>
                <th>Helikopter ID</th>
                <th>Antall plasser</th>
                <th>Helikopter type</th>
            </tr>
        </thead>
        <tbody>
            <%                    while (rsHeli.next()) {%>
            <tr>
                <td><%= rsHeli.getString(1)%></td>
                <td><%= rsHeli.getString(2)%></td>
                <td><%= rsHeli.getString(3)%></td>
            </tr>
            <% }%>
        </tbody>
    </table>

    <form  action="AdminSiteReg.jsp"   method="get">

 <h2>Legge til Helikopter</h2>
        Antall plasser:<br>
        <input type="text" name="AntallPlasser" ><br>
        Helikopter type:<br>
        <input type="text" name="HeliType">
        <input type="submit" name="addHeli" value="Registrer Helikopter"></input><br>




    </form>

    <form  action="AdminSiteReg.jsp"   method="get">

        <h2>Legge til Reise</h2>
        Dato: <br>
        <input type="text" name="Dato" ><br>
        Helikopter ID: (må eksistere i entitet Helikopter)<br>
        <input type="text" name="HeliID"><br>
        Status/ledig: <br>
        <input type="text" name="Status" >
        <input type="submit" name="addReise" value="Registrer Reise"></input><br>




    </form>

</html>
