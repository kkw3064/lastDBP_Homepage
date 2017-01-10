<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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

if (rs.next() == true)
{
	String MemName = rs.getString("MemName");
	session.setAttribute("ID", ID);
	session.setAttribute("passwd", passwd);
	session.setAttribute("MemName",MemName);
    session.setMaxInactiveInterval(60*60);  
    out.print(MemName + "님의 로그인이 성공되었습니다.");
    response.sendRedirect("./index.jsp?ID="+ID+"&passwd="+passwd);
}
else
{
	out.print("로그인을 실패하였습니다.");
    response.sendRedirect("./index.jsp");
}
pstmt.close();
rs.close();
con.close();
%>