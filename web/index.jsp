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
<%@ page import="java.sql.DriverManager.*" %>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TrollTours homepage</title>
    </head>
    <header>Hei eg heitte Henrik
    HOla que pasas</header>
    <body>
        
        <h1>Welcome to TrollTours</h1>
        <p>TrollTours tilbyr fantastiske reiser  til minneverdige steder.  Vi kan tilby gode priser og ekslusive reiser. 
            Turene vi tilbyr passer perfekt for mindre firmaer, vennegjenger og familiturer. Vi tar 5-6 passasjerer.
        Reisen er anført Gullingsen og medpilot Konradsen, 
        Gullingsen har 10 års erfaring som helikopterpilot. Gullingsen og Konradsen har b.a. 5 års erfaring fra å fly uttrykkshelikopter i ambulansen.
        Vi tilbyr sightseeing i noe av den flotteste naturen Norge har å by på, nemlig Geiranger. Forfriskninger er tilgjenglig under reisen. Helikopteret vårt Eurocopter AS350 Ecureuil er et enmotors lettere turbinhelikopter.</p>
        
        <p>TrollTours historie
        TrollTours startet opp i år 2006 og var de første årene et ekslusivt passasjerfly for innenlandsreiser.
        Gründerne er ekteparet Reidar Gullingsen og Sigrund Gullingsen. Sigrund er økonomansvarlig og Reidar en av pilotene. Ved overgangen til fjell-sightseeing
        kjøpte TrollTours et Eurocopter AS350 Ecureuil og ansatte den erfarne medpiloten Konradsen.</p>
        <%ResultSet resultset = null;%>
        <%

            //DataSource ds = InitialContext.doLookup("jdbc/Test");
            Connection c = null;
            try {
                //c = DriverManager.getConnection("jdbc:derby://localhost:1527/Test","TESTTEST","123123");
                
                c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2","Henke","troll123");
                Statement st = c.createStatement();
                ResultSet rs = st.executeQuery(
                        "SELECT * FROM Kunde");
                //Class.forName("com.mysql.jdbc.Driver").newInstance();
                //Connection c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=TrollTours2","Henke","troll123");
                //Connection c = DriverManager.getConnection("jdbc:sqlserver://158.38.101.112:1433;databaseName=Hobbyhuset", "bigjokke", "123123");

        %>
    <center>
        <h1>TEST Drop down box Kunder</h1>
        <select>
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
        c.close();
    %>
    
    <form action="login.jsp">
        
          <input type="submit" value="Login"/>
        
    </form>


    <form action="register.jsp"><table><b>
                

                
            <input type="submit" value="Register"/>



    </form>


</body>
</html>

