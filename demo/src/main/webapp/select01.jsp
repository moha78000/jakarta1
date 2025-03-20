    <%@ page import="java.sql.*" %><%--
      Created by IntelliJ IDEA.
      User: 22302683
      Date: 20/03/2025
      Time: 14:13
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <title>Title</title>
        <style>
            body {
                background-color: #f4f7f6;
                font-family: 'Arial', sans-serif;
                padding: 20px;
            }



            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }






            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }


            }
        </style>
    </head>
    <body>
    <h1> Select 01</h1>
    <%
        Connection conn=null;
        PreparedStatement st=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){e.printStackTrace();}

        try{
            String jdbc="jdbc:mysql://localhost:3306/student";
            String root="root";
            String mdp="";
            conn= DriverManager.getConnection(jdbc,root,mdp);
            System.out.println("ok");
        }catch(Exception e){e.printStackTrace();}
    %>

    // SELECT PREPARE
    <h2>Select Préparé</h2>
    <%
        String sel="SELECT * from student WHERE id >= ?";
        st=conn.prepareStatement(sel);
        st.setString(1,"2");
        ResultSet res=st.executeQuery();
    %>
    <table>
        <%
            while (res.next()) {
                id = res.getString("id");
                login = res.getString("login");
                mdp = res.getString("mdp");

        %>
        <tr><td><%= id%></td><td><%= login%></td><td><%= mdp%></td></tr>
        <%
            }
        %>
    </table>


    <form action="" method="post">
        <label for="login">Login:</label>
        <input type="text" id="login" name="login" />
        <label for="mdp">Mot de passe</label>
        <input type="password" id="mdp" name="mdp" />
        <input type="submit" value="Insérer">
    </form>

    <%
        if (request.getMethod().equals("POST")){
            String login = request.getParameter("login");
            String mdp = request.getParameter("mdp");
        String ins = "INSERT INTO user (login,mdp) VALUES ('"+ login + "','"+ mdp + "')";
        Statement stInsert = conn.createStatement();
        stInsert.executeUpdate(ins);

        }
    %>


    <h2>Select simple</h2>
    <%!
        String id;
        String login;
        String mdp;
    %>



    <table>
        <%
            while (res.next()) {
                id = res.getString("id");
                login = res.getString("login");
                mdp = res.getString("mdp");

        %>
        <tr><td><%= id%></td><td><%= login%></td><td><%= mdp%></td></tr>
        <%
            }
        %>
    </table>

    </body>
    </html>
