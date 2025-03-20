<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %><%--
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

</body>
</html>
