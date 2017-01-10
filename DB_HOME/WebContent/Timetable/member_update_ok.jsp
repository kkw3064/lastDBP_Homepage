<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
Connection con = DriverManager.getConnection(connectionURL);
Statement stmt = con.createStatement();
ResultSet rs = null;


String suserid= request.getParameter("ID");
String spasswd= request.getParameter("passwd1");
String susernm= request.getParameter("name");
String sbirth= request.getParameter("year") + request.getParameter("month") + request.getParameter("day");
String smail= request.getParameter("E-MAIL");
String suniv= request.getParameter("univ");
String smajor= request.getParameter("major");
String sgrade= request.getParameter("grade");
String sphon= request.getParameter("PHON") + request.getParameter("phon2") + request.getParameter("phon3");

String SQL2 = "select * from [201101677].dbo.Timetable_member where MemID= '"+suserid+"'";
rs = stmt.executeQuery(SQL2);
if(rs.next()==true){
String SQL= "update [201101677].dbo.Timetable_member set ";
SQL= SQL + "MemID = '" + suserid  + "', ";
SQL= SQL + "MemPw = '" + spasswd  + "', ";
SQL= SQL + "MemName = '" + susernm  + "', ";
SQL= SQL + "MemBirth = '" + sbirth  + "', ";
SQL= SQL + "MemEmail = '" + smail   + "', ";
SQL= SQL + "MemUniv = '" + suniv  + "', ";
SQL= SQL + "MemMajor = '" + smajor  + "', ";
SQL= SQL + "MemGrade = '" + sgrade  + "', ";
SQL= SQL + "MemPhone = '" + sphon  + "' ";
SQL= SQL + "where MemID = '"+suserid+"' and MemPw = '"+spasswd+"'";

int cnt = stmt.executeUpdate(SQL);
stmt.close();
con.close();     
if (cnt > 0) 
{
out.println("<script language=javascript>");
out.println("alert('변경이 완료 되었습니다.');");
out.println("</script>");
}
else 
{
out.println("<script language=javascript>");
out.println("alert('비밀번호가 다릅니다..');");
out.println("</script>");
}
}

// response.sendRedirect("index.jsp");   // 나중에 주석문 풀것
%>