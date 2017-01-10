<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<style type="text/css">
<!--
.invisible {
clear: none;
border: 0px none;
float: none;
background-color: #ffffff;
/* 배경을 투명하게 할경우에는 background-color: transparent; */
}
-->
</style> 
<%
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
     Connection con = DriverManager.getConnection(connectionURL);
     PreparedStatement pstmt = null;
     ResultSet rs = null;

String SQL= "select * from [201101677].dbo.Timetable_Member";
pstmt = con.prepareStatement(SQL);


rs = pstmt.executeQuery();

while(rs.next()){

	String userid = rs.getString("MemID");
	
	%>
	<%= userid %>
	<p></p>
	<%
}


	%>
<p></p>
<a href="member_login.jsp">	<INPUT TYPE="button"  VALUE="로그인" class="invisible"></a> &nbsp;&nbsp;&nbsp;
<a href="Home.jsp">	<INPUT TYPE="button" VALUE="회원가입" class="invisible"></a>
<%
pstmt.close();
rs.close();
con.close();
%>