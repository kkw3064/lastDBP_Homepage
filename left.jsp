<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
// 단계1 : JDBC 드라이버 로드
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
// 단계2 : 커넥션 객체 생성
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
Connection con = DriverManager.getConnection(connectionURL);
Statement stmt = con.createStatement();
PreparedStatement pstmt = null;

String ID = request.getParameter("ID");
String passwd = request.getParameter("passwd");

String SQL3 = "select * from [201101677].dbo.Timetable_Group where MemID= '"+ID+"'";

pstmt = con.prepareStatement(SQL3);

ResultSet rs2 = pstmt.executeQuery();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML> <HEAD>
<%
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);

%>

  <TITLE>로그인</TITLE> </HEAD><BODY>
<TABLE WIDTH = "100%" height="250" CellPadding = "0" CellSpacing = "0">
<TR>
   <TD  ALIGN = "center" ><jsp:include page="member_login.jsp"></jsp:include>     
   </TD></TR>
</TABLE><br>

<table width="100%"><tr><th>가입된 그룹</th></tr>
<%
if(rs2.next()==true){
	rs2 = pstmt.executeQuery();
	while(rs2.next()){
		String GroupName = rs2.getString("GroupName");
		%>
		<tr><td align="center"><%=GroupName %></td></tr>
		<%
	}
}
else{
	%>
	가입된 그룹이 없습니다.
	<%
}

%>
</table>
<table><tr><td><p></p></td></tr>
<tr><td><br></td></tr>
<tr><td><br></td></tr></table>
<table>
<tr><td><a href="http://www.naver.com">
<img src="http://blogfiles.naver.net/MjAxNjEyMTlfNTMg/MDAxNDgyMTMwMzYyMDAz.ghVxAgiONJzTS81dd_ynIwY3h_EwQKj-ytrXhKGQ9Gsg.YUXxCj72sPm6srq4iBqwud4H6c9DhxBa9hBpu1MZ7Rwg.JPEG.double_k2/naver.jpg" style="display:block" width="100%" height="100%"></a></td>
</tr>
<tr><td><a href="http://www.google.co.kr">
<img src="http://blogfiles.naver.net/MjAxNjEyMTlfMjM1/MDAxNDgyMTMwODM1MTc0.Q5MA7S9sbM-ypAutrVh_7d4JkaFIm9dhopu3aSnbI2Ig.zEYv0peewkbO1xTMgw4yaDBh31Fx-xrUpLxU5cPVDX4g.JPEG.double_k2/Google.jpg" style="display:block" width="100%" height="65%"></a></td>
</tr> 
<tr><td><a href="http://inu.ac.kr">
<img src="http://blogfiles.naver.net/MjAxNjEyMTlfMTU0/MDAxNDgyMTMxNjI4MDk0.ATKodJ0Zv7OYc-rgNj1rsd3sMfRRihBiXQLIhxRXjRAg.zV2wPw2Usf94apqNc6yTDg2njiCKRo-RxtDp2oZ1k54g.JPEG.double_k2/INU.jpg" style="display:block" width="100%" height="30%"></a></td>
</tr> 
</table>
</BODY></HTML>
