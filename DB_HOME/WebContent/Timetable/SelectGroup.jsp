<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<HTML><HEAD>
  <TITLE>가입된 그룹 리스트</TITLE>
</HEAD>

<H3><center>가입된 그룹 리스트</H3>

<BODY>



<%
String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);
%>

<center><a href="./index.jsp?ID=<%=ID%>&passwd=<%=passwd%>&page=./Timetable_Group.jsp"><h>그룹가입하기</h></a></center>
<br>

	<TABLE border = "1" cellspacing = "1" cellpadding = "2" width = "80%">      

<TR  width="15%" bgcolor = "cccccc">      
<TH><font size = 2><center><b>그룹명</b></center></font></TH>      
<TH><font size = 2><center><b>회원ID</b></center></font></TH> 
<TH><font size = 2><center><b>회원명</b></center></font></TH>     
<TH><font size = 2><center><b>회원학과</b></center></font></TH>
<TH><font size = 2><center><b>회원학년</b></center></font></TH>
<TH><font size = 2><center><b>탈 퇴</b></center></font></TH>
</TR> 
<%
 	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
  	Connection con = DriverManager.getConnection(connectionURL);
  	ResultSet rs = null;

  	Statement stmt = con.createStatement();


     String SQL = "select * from [201101677].dbo.Timetable_Group where MemID = '"+ID+"'";

 	
 	rs = stmt.executeQuery(SQL);
 	while (rs.next()) {
 		String MemID = rs.getString("MemID");
 		String GroupName = rs.getString("GroupName");
 		String MemName = rs.getString("MemName");
 		String MemMajor = rs.getString("MemMajor");
 		if(MemMajor.equals("computer")){MemMajor="컴퓨터공학부";}
 		else if(MemMajor.equals("computer(N)")){MemMajor="컴퓨터공학부(야)";}
 		String MemGrade = rs.getString("MemGrade");
 		
 		
 %>
      <TR height = "50">  
      			<TD width="100"><font size = 2><center><a href="./index.jsp?page=./G_Timetable.jsp&ID=<%=ID%>&passwd=<%=passwd%>&GroupName=<%=GroupName%>"><%= GroupName%></a></TD>      
               <TD width="60"><font size = 2><center><%= MemID%></TD>      
               <TD width="100"><font size = 2><center><%= MemName%></TD>      
               <TD width="100"><font size = 2><center><%= MemMajor%></TD>
               <TD width="100"><font size = 2><center><%= MemGrade%></TD>
               <TD width="60"><font size = 2><center><a href="./index.jsp?page=./Group_delete.jsp&ID=<%=ID%>&passwd=<%=passwd%>&GroupName=<%=GroupName%>">탈 퇴</center></font>
               
   <%
   }
   stmt.close();
rs.close();
con.close();
%>
</TABLE> </BODY>