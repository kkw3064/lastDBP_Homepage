       <%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<% session.removeAttribute("ID");%>
<HTML>
<HEAD>
<title>로그아웃</title>
</HEAD>
<body>
 <h3>로그아웃</h3>
 <% request.setCharacterEncoding("utf-8"); %>
<%
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
     Connection con = DriverManager.getConnection(connectionURL);
     PreparedStatement pstmt = null;
     ResultSet rs = null;
String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
String SQL= "select * from [201101677].dbo.Timetable_Member where MemID = ? and MemPw = ?";
pstmt = con.prepareStatement(SQL);

pstmt.setString(1, ID);
pstmt.setString(2, passwd);
rs = pstmt.executeQuery();
if(rs.next()!=true){

    response.sendRedirect("./index.jsp");
}
else{
}

pstmt.close();
rs.close();
con.close();%>
</body>

       
</HTML>