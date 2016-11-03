<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 14.okt.2016, 12:28:09
    Author     : Henrik
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TrollTours bestilling</title>
    </head>
    <body><%
        String m = null, mn = null;
        //  String s0 = request.getParameter("fnr");
        String s1 = request.getParameter("fornavn");
        String s2 = request.getParameter("etternavn");
        String s3 = request.getParameter("epost");
        String s4 = request.getParameter("telefon");
        String s5 = request.getParameter("brukernavn");
        String s6 = request.getParameter("passord");
        PreparedStatement ps;
        PreparedStatement ps2;
        int kundeID = 0;

        // DataSource ds = InitialContext.doLookup("jdbc/sample");
        Connection c = null;
        try {
            c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");

//c = ds.getConnection();
            Statement st = c.createStatement();

            ps = c.prepareStatement("insert into KUNDE values (?,?,?,?)");
            // ps.setString(1, s0);
            ps.setString(1, s1);
            ps.setString(2, s2);
            ps.setString(3, s3);
            ps.setString(4, s4);

            int insertResult = ps.executeUpdate();
            if (insertResult != 0) {
                //out.println("Successfully registered");
            }

            String id = null;
            String userId = null;
            int adminBool = 0;
            String sql = "SELECT Kunde_ID FROM Kunde where Telefon='" + s4 + "'";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                kundeID = rs.getInt("Kunde_ID");

            }
            ps2 = c.prepareStatement("insert into Bruker values (?,?,?,?)");
            ps2.setString(1, s5);
            ps2.setString(2, s6);
            ps2.setInt(3, kundeID);
            ps2.setInt(4, adminBool);
            ps2.executeUpdate();

        } catch (Exception e) {
            out.println("wrong entry: " + e);
        }

        %>

        <form action="login.jsp">



            <center>

                <table border="1">
                    <thead>
                        <tr>
                            <th>Fornavn</th>
                            <th>Etternavn</th>
                            <th>Epost</th>
                            <th>Telefon</th>
                            <th>Brukernavn</th>
                            <th>Passord</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%=request.getParameter("fornavn")%></td>
                            <td><%=request.getParameter("etternavn")%></td>
                            <td><%=request.getParameter("epost")%></td>
                            <td><%=request.getParameter("telefon")%></td>
                            <td><%=request.getParameter("brukernavn")%></td>
                            <td><%=request.getParameter("passord")%></td>
                        </tr>
                    </tbody>
                </table>
            </center>



            <input type="submit" value="Login"/>

        </form>


    </body>
</html>