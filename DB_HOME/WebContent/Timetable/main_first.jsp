<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*,java.util.*, javax.sql.*,java.io.*,java.net.* " %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList, java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
  	Connection con = DriverManager.getConnection(connectionURL);
  	ResultSet rs = null;
  	Statement stmt = con.createStatement();
%>
<HTML><HEAD> 
 <TITLE>Main</TITLE>
</HEAD>
<BODY>
<%session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60); %>
<br><br>
<table width="100%">
<tr><td width="100%" colspan=2><table width="100%">
<img src="http://blogfiles.naver.net/MjAxNjEyMjBfMjM5/MDAxNDgyMjExNzY4MTQy.QZDHRMUyuxOZe7N2HPk4X1J0E99CbkWBTlZc8yrTaZwg.kf4PaHL1Tqt9mP5YmuTtTUImd2Sveh-Kh_XuHc46UYUg.JPEG.double_k2/asd.jpg" style="display:block" width="100%" height="100%">
</table></td></tr>
<tr><td width="50%">
<TABLE  border = "2" width="100%">      
<tr ><th width="55">번호</th>
<th width="75">이름</th>
<th width="100">머리말</th>
</tr>
<%
 	
  	
     String SQL = "select top 5 ";
     SQL = SQL + "Num, ";
     SQL = SQL + "name, ";
     SQL = SQL + "Passwd, ";
     SQL = SQL + "Title ";
     SQL = SQL + "from [201101677].dbo.Memo order by Num DESC";
 	rs = stmt.executeQuery(SQL);
 	while (rs.next()) {
 		String Num = rs.getString("Num");
 		String Name = rs.getString("Name");
 		String Passwd = rs.getString("Passwd");
 		String Title = rs.getString("Title");
 		%>
      <TR onmouseover="this.style.backgroundColor='gray';" onmouseout="this.style.backgroundColor='white';">     
               <TD width="30"><font size = 2><center><%= Num%></TD>
               <TD width="50"><font size = 2><center><%= Name%></TD>      
               <TD width="650"><font size = 2><center> <%= Title %>
               </TD></TR>
   <%
   }

%>
</TABLE>
<td width="50%">
<table border = "2" width="100%">
<tr ><th width="55">번호</th>
<th width="75">이름</th>
<th width="100">공지사항</th>
<th width="100">게시날짜</th>
</tr>
<%
String SQL2 = "select top 5 * from [201101677].dbo.Notice order by num desc";
ResultSet rs2 = stmt.executeQuery(SQL2);
while(rs2.next()){
	String num = rs2.getString("num");
	String name = rs2.getString("name");
	String coment = rs2.getString("coment");
	String dat = rs2.getString("dat");
	%>
	<TR onmouseover="this.style.backgroundColor='gray';" onmouseout="this.style.backgroundColor='white';">     
               <TD width="30"><font size = 2><center><%= num%></TD>
               <TD width="50"><font size = 2><center><%= name%></TD>      
               <TD width="400"> <font size = 2><center> <%= coment %></TD>
               <TD width="100"><font size = 2><center> <%= dat %></TD></TR>
	<%
}
stmt.close();
rs.close();
con.close();
%>
</table></td>
</tr>
<tr><td>
<table width="100%" align="left"><tr><td align=center><a href="http://haksa.inu.ac.kr:7790/iesns/pnotice/pnotice.jsp">
<img src="http://www.inu.ac.kr/user/inu/upload/popup_temp_20161214_1481701300894100.jpg" style="display:block" width="100%" height="75%"></a></td>
<td align=center><a href="http://www.inu.ac.kr/cop/campusTour/tourGroupTimeTable.do?siteId=inu&tourMin=Y&id=inu_070301000000">
<img src="http://www.inu.ac.kr/mbshome/mbs/inu/images/main_potalStreet2_1.jpg" style="display:block" width="100%" height="75%"></a></td>
<td align=center><a href="http://www.inu.ac.kr/cop/haksa/haksaScheduleRecordList.do?handle=140774&siteId=inu&year=2016&id=inu_050201000000">
<img src="http://www.inu.ac.kr/mbshome/mbs/inu/images/main_potalStreet1_1.jpg" style="display:block" width="100%" height="75%"></a></td>
</tr></table>
</td>
<td><a href="http://isis.inu.ac.kr/">
<img src="http://www.inu.ac.kr/user/isis/mycodyimages/isis_logo.png" style="display:block" width="100%" height="75%"></a></td></tr>
</table>

 </BODY>