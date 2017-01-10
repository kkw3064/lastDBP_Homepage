<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
Connection con = java.sql.DriverManager.getConnection(connectionURL);
Statement stmt = con.createStatement();
String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);
String sname= request.getParameter("Name");
String spasswd= request.getParameter("Passwd");
String stitle= request.getParameter("Title");
%>
	<input type="text" name="ID"value="<%= ID %>" style="display:none" >
	<input type="text" name="passwd"value="<%= passwd %>" style="display:none">
<%
ResultSet rs = null;
    	String SQL = "insert into [201101677].dbo.memo(name,passwd,title) values (";
    	SQL= SQL + "'" + sname  + "', ";
    	SQL= SQL + "'" + spasswd  + "', ";
    	SQL= SQL + "'" +  stitle  + "')";

    	
    	stmt.executeUpdate(SQL);

   
    	%>
    	<center><h1>글이 작성되었습니다.</h1></center>
    	<center><a href="./index.jsp?page=./Memo_write.jsp&ID=<%=ID%>&passwd=<%=passwd%>">익명 게시판으로</a></center>
    	<%

    	
    	
    	stmt.close();
    	con.close();
    	%>