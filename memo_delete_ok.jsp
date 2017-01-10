<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
Connection con = DriverManager.getConnection(connectionURL);

ResultSet rs = null;

Statement stmt = con.createStatement();

int counterss = Integer.parseInt(request.getParameter("counter"));

String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
String passw="";
String password="";
passw= request.getParameter("passwd1");
String SQL = "select  Passwd from [201101677].dbo.memo where Num="+counterss;

rs = stmt.executeQuery(SQL);

if (rs.next()) {
	 password = rs.getString(1);
}
    if(password.equals(passw)){
			
	SQL = "DELETE FROM [201101677].dbo.memo WHERE Num=" + counterss;	
	stmt.executeUpdate(SQL);	 
%>
	<center><h1><%=counterss %>번글이 삭제되었습니다.</h1></center>
	<center><a href="./index.jsp?page=./Memo_write.jsp&ID=<%=ID%>&passwd=<%=passwd%>">익명 게시판으로</a></center>

<%
rs.close();
stmt.close();
con.close();
 } 
 else { 
%>

	<center><h1>비밀번호가 틀렸습니다.</h1></center>
	<center><a href="./index.jsp?page=./Memo_write.jsp&ID=<%=ID%>&passwd=<%=passwd%>">익명 게시판으로</a></center>
<% 
}
%>