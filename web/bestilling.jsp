<%@page import="java.sql.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : bestilling
    Created on : 16.okt.2016, 16:05:19
    Author     : Henrik
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TrollTours kvittering</title>
    </head>
    <body>
        <h1>Bestilling</h1>
        Receipt for user: <b> <%=session.getAttribute("uname")%>.</b>
        <%

            // String s0 = session.getAttribute("product")
            String s0 = request.getParameter("telefon");
            String s1 = request.getParameter("dato");
            String s2 = request.getParameter("destinasjon");
            String s3 = request.getParameter("tillegg");
            String username = session.getAttribute("uname").toString();

            int reiseID = 0;
            int kundeID = 0;
            int tpID = 0;
            int bID = 0;
            int destID = 0;
            bID++;
            //String[] s1Array = s1.split("-");
            // int year = new Integer(s1Array[0]);
            //int month = new Integer(s1Array[1]);
            //  int day = new Integer(s1Array[2]);
            //  Date s1Date = new Date(year, month, day);
            PreparedStatement ps;

            Connection c = null;
            try {

                c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2", "Henke", "troll123");

                PreparedStatement statement = c.prepareStatement("SELECT Reise_ID FROM Reise WHERE dato = ?");
               
                PreparedStatement statementUpStatus = c.prepareStatement("UPDATE Reise SET Status = 0 WHERE dato = ?");
                statementUpStatus.setString(1, s1);
               statementUpStatus.execute();
               
               statement.setString(1, s1);
                ResultSet rs1 = statement.executeQuery();
                if (rs1.next()) {
                    reiseID = rs1.getInt(1);
                    //  out.println("REISE ID: "+ reiseID);
                }
                PreparedStatement statement2 = c.prepareStatement("SELECT Kunde_ID FROM Bruker WHERE Username = ?");
                statement2.setString(1, username);
                ResultSet rs2 = statement2.executeQuery();
                if (rs2.next()) {
                    kundeID = rs2.getInt(1);
                    //  out.println("KUNDE ID:   " + kundeID);
                }
                PreparedStatement statement3 = c.prepareStatement("SELECT Tilleggspakke_ID FROM Tilleggspakke WHERE pris = ?");
                statement3.setString(1, s3);
                ResultSet rs3 = statement3.executeQuery();

                if (rs3.next()) {
                    tpID = rs3.getInt(1);
                    rs3.next();
                    //out.println("TP ID: " + tpID);
                }

                PreparedStatement statement4 = c.prepareStatement("SELECT Destinasjon_ID FROM Destinasjon WHERE DestinasjonsNavn = ?");
                statement4.setString(1, s2);
                ResultSet rs4 = statement4.executeQuery();

                if (rs4.next()) {
                    destID = rs4.getInt(1);
                    rs4.next();
                    //out.println("TP ID: " + tpID);
                }

                String sql = "INSERT INTO Bestilling (Kunde_ID, Reise_ID, Tilleggspakke_ID, Destinasjon_ID) VALUES (?, ?, ?, ?)";

                ps = c.prepareStatement(sql);
                ps.setInt(1, kundeID);
                ps.setInt(2, reiseID);
                ps.setInt(3, tpID);
                ps.setInt(4, destID);

                /**
                 * ps = c.prepareStatement("insert into BESTILLING values
                 * (?,?,?)"); ps.setInt(1, kundeID); ps.setInt(2, reiseID);
                 * ps.setInt(3, tpID);*
                 */
                //  ps.executeQuery();
                int insertResult = ps.executeUpdate();
                if (insertResult != 0) {
                    out.println("Successfully registered a BESTILLING");
                }

                //**Should I input the codes here?**
                // dGD8QhQkoGev - joakikn pw
                // ZT8s1tbxlelJ - henrikvt pw
            } catch (Exception e) {
                out.println("wrong entry2: " + e);
            }
        %>

        <%
            PreparedStatement statement2 = c.prepareStatement("SELECT Kunde_ID FROM Bruker WHERE Username = ?");
            statement2.setString(1, username);
            ResultSet rs2 = statement2.executeQuery();
            if (rs2.next()) {
                kundeID = rs2.getInt(1);
                //  out.println("KUNDE ID:   " + kundeID);
            }

            PreparedStatement statement5 = c.prepareStatement("SELECT * FROM Kunde WHERE Kunde_ID = ?");
            statement5.setInt(1, kundeID);
            ResultSet rs5 = statement5.executeQuery();

            PreparedStatement statement6 = c.prepareStatement("SELECT * FROM Reise WHERE Reise_ID = ?");
            statement6.setInt(1, reiseID);
            ResultSet rsReise = statement6.executeQuery();

            PreparedStatement statement7 = c.prepareStatement("SELECT * FROM Destinasjon WHERE Destinasjon_ID = ?");
            statement7.setInt(1, destID);
            ResultSet rsDest = statement7.executeQuery();


        %>

        <table>
            <thead>
                <tr>
                    <th>Kontaktinformasjon</th>
                </tr>
            </thead>
            <tbody>
                <%                    while (rs5.next()) {%>
                <tr> 
                    <td>
                        Fornavn: 
                    </td>
                    <td>
                        <%= rs5.getString(2)%>
                    </td>
                </tr>

                <tr>
                    <td>
                        Etternavn: 
                    </td>
                    <td>  <%= rs5.getString(3)%></td>
                </tr>

                <tr>
                    <td>
                        Epost: 
                    </td>
                    <td>  <%= rs5.getString(4)%></td>
                </tr>

                <tr>
                    <td>
                        Telefon: 
                    </td>
                    <td>   <%= rs5.getString(5)%></td>
                </tr>
                <% }%>
            </tbody>
        </table>


        <table>
            <thead>
                <tr>
                    <th>Din reise</th>

                </tr>
            </thead>

            <tbody>
                <%                    while (rsReise.next()) {%>
                <tr>
                    <td>Dato: </td>
                    <td> <%= rsReise.getString(2)%></td>
                </tr>
                <tr>
                    <td>Helikopter ID: </td>
                    <td> <%= rsReise.getString(3)%></td>
                </tr>
                <% }%>
                <%                    while (rsDest.next()) {%>
                <tr>
                    <td>Destinasjon: </td>
                    <td> <%= rsDest.getString(2)%></td>
                </tr>

                <% }%>
            </tbody>
        </table>










    </body>
</html>
