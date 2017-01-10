<%@ page language="java" import="java.sql.*"  import="java.util.StringTokenizer" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
 %>

<form name="Timetable" action="./index.jsp?page=SelectSubject.jsp&ID=<%=ID %>&passwd=<%=passwd %>" method=post>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인 시간표</title>
</head>
<body>
<%
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
     Connection con = DriverManager.getConnection(connectionURL);
     PreparedStatement pstmt = null;
     PreparedStatement pstmt2 = null;
     ResultSet rs = null;
     ResultSet rs2 = null;



	String sSub = request.getParameter("pSub");
	String sTe = request.getParameter("pTe");
	String sDay = request.getParameter("pDay");

String SQL= "select * from Timetable_Member where MemID = ? and MemPw = ?";
String SQL2 = "select * from [201101677].dbo.Timetable_Person where MemID = ?";

pstmt = con.prepareStatement(SQL);
pstmt.setString(1, ID);
pstmt.setString(2, passwd);
rs = pstmt.executeQuery();

if (rs.next() == true)
{
	String sName = rs.getString("MemName");
	session.setAttribute("ID", ID);
	session.setAttribute("passwd", passwd);
    session.setMaxInactiveInterval(60*60);  
    
    
%><input type="text" name="ID"value="<%= ID %>" style="display:none" >
<input type="text" name="passwd"value="<%= passwd %>" style="display:none">
<p></p>
<center><font size="10%"><b><%=sName %> 의 시간표</b></font></center>
<p></p>
<center><input type="submit" value="수강 조회"></center>
<br>
<%
	pstmt2 = con.prepareStatement(SQL2);
	pstmt2.setString(1, ID);
    rs2 = pstmt2.executeQuery();
    if(rs2.next() != true){ %><center><b><%out.print("시간표가 등록되어있지 않습니다."); %></b></center><%
    }
    else{
    	
    	String[][] Sub= new String[20][5];
    	
    	for(int i =0;i<20;i++){
    		for(int j=0;j<5;j++){
    		Sub[i][j] = "";
    		}
    	}
    	
    	int i = 0, j = 0, cnt=0;
    	
    	rs2 = pstmt2.executeQuery();
		while(rs2.next()){
			String dbSub = rs2.getString("교과목명");
	    	String dbTe = rs2.getString("교수명");
	    	String dbDay = rs2.getString("요일");
		String day = dbDay.substring(0, dbDay.length());
		
		String[] txtArr = day.split(",");
    		
    		if(txtArr[0].equals("월")&&((txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1")))) Sub[0][0] = dbSub;
    		if(txtArr[0].equals("월")&&((txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2")))) Sub[1][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][0] = dbSub;
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][0] = dbSub;
    		
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][1] = dbSub;
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][1] = dbSub;
    		
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][2] = dbSub;
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][2] = dbSub;
    		
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][3] = dbSub;
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][3] = dbSub;
    		
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][4] = dbSub;
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][4] = dbSub;
		}

    %>
<table align="center" border="외각굵은선">
<tr align="center">
<th width = "100" height="20"></th><th width = "100"  bgcolor="gray"><font color="white">월</font></th><th width = "100"  bgcolor="gray"><font color="white">화</font></th>
<th width = "100"  bgcolor="gray"><font color="white">수</font></th><th width = "100"  bgcolor="gray"><font color="white">목</font></th><th width = "100"  bgcolor="gray"><font color="white">금</font></th>
</tr>

<!-- 1교시 -->
<tr align="center" >
<td width = "100" height="30"  bgcolor="gray"><font color="white">1교시<br>09:00~09:50</font></td> 
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[0][0]%>"> <%=Sub[0][0] %></a></td> 
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[0][1]%>"> <%=Sub[0][1] %></a> </td>
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[0][2]%>"> <%=Sub[0][2] %></a> </td>
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[0][3]%>"> <%=Sub[0][3] %></a> </td>
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[0][4]%>"> <%=Sub[0][4] %></a> </td>
</tr>

<!-- 2교시 -->
<tr align="center" >
<td width = "100" height="30"  bgcolor="gray"><font color="white">2교시<br>10:00~10:50</font></td> 
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[1][0]%>"> <%=Sub[1][0] %></a> </td>
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[1][1]%>"> <%=Sub[1][1] %></a> </td>
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[1][2]%>"> <%=Sub[1][2] %></a> </td>
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[1][3]%>"> <%=Sub[1][3] %></a> </td>
 <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[1][4]%>"> <%=Sub[1][4] %></a> </td>
</tr>

<!-- 3교시 -->
<tr align="center" >
<td width = "100" height="30"  bgcolor="gray"><font color="white">3교시<br>11:00~11:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[2][0]%>"> <%=Sub[2][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[2][1]%>"> <%=Sub[2][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[2][2]%>"> <%=Sub[2][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[2][3]%>"> <%=Sub[2][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[2][4]%>"> <%=Sub[2][4] %></a> </td>
 </tr>
 
 <!-- 4교시 -->
<tr align="center" >
<td width = "100" height="30"  bgcolor="gray"><font color="white">4교시<br>12:00~12:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[3][0]%>"> <%=Sub[3][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[3][1]%>"> <%=Sub[3][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[3][2]%>"> <%=Sub[3][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[3][3]%>"> <%=Sub[3][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[3][4]%>"> <%=Sub[3][4] %></a> </td>
 </tr>
 
 <!-- 5교시 -->
<tr align="center" >
<td width = "100" height="30"  bgcolor="gray"><font color="white">5교시<br>13:00~13:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[4][0]%>"> <%=Sub[4][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[4][1]%>"> <%=Sub[4][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[4][2]%>"> <%=Sub[4][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[4][3]%>"> <%=Sub[4][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[4][4]%>"> <%=Sub[4][4] %></a> </td>
 </tr>
 
 <!-- 6교시 -->
<tr align="center" >
<td width = "100" height="30"  bgcolor="gray"><font color="white">6교시<br>14:00~14:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[5][0]%>"> <%=Sub[5][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[5][1]%>"> <%=Sub[5][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[5][2]%>"> <%=Sub[5][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[5][3]%>"> <%=Sub[5][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[5][4]%>"> <%=Sub[5][4] %></a> </td>
 </tr>
 
 <!-- 7교시 -->
<tr align="center" >
<td width = "100" height="30"  bgcolor="gray"><font color="white">7교시<br>15:00~15:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[6][0]%>"> <%=Sub[6][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[6][1]%>"> <%=Sub[6][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[6][2]%>"> <%=Sub[6][2] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[6][3]%>"> <%=Sub[6][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[6][4]%>"> <%=Sub[6][4] %> </a></td>
 </tr>
 
 <!-- 8교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">8교시<br>16:00~16:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[7][0]%>"> <%=Sub[7][0] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[7][1]%>"> <%=Sub[7][1] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[7][2]%>"> <%=Sub[7][2] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[7][3]%>"> <%=Sub[7][3] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[7][4]%>"> <%=Sub[7][4] %></a> </td>
 </tr>
 
 <!-- 9교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">9교시<br>17:00~17:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[8][0]%>"> <%=Sub[8][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[8][1]%>"> <%=Sub[8][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[8][2]%>"> <%=Sub[8][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[8][3]%>"> <%=Sub[8][3] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[8][4]%>"> <%=Sub[8][4] %></a> </td>
 </tr>
 
 <!-- 야간1교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">10교시<br>18:00~18:50</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[9][0]%>"> <%=Sub[9][0] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[9][1]%>"> <%=Sub[9][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[9][2]%>"> <%=Sub[9][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[9][3]%>"> <%=Sub[9][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[9][4]%>"> <%=Sub[9][4] %></a> </td>
 </tr>
 
 <!-- 야간2교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">11교시<br>18:55~19:45</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[10][0]%>"> <%=Sub[10][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[10][1]%>"> <%=Sub[10][1] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[10][2]%>"> <%=Sub[10][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[10][3]%>"> <%=Sub[10][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[10][4]%>"> <%=Sub[10][4] %></a> </td>
 </tr>
 
 <!-- 야간3교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">12교시<br>19:50~20:40</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[11][0]%>"> <%=Sub[11][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[11][1]%>"> <%=Sub[11][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[11][2]%>"> <%=Sub[11][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[11][3]%>"> <%=Sub[11][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[11][4]%>"> <%=Sub[11][4] %></a> </td>
</tr>

<!-- 야간4교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">13교시<br>20:45~21:35</font></td> 
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID %>&passwd=<%=passwd %>&Sub=<%=Sub[12][0] %>"> <%=Sub[12][0] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[12][1]%>"> <%=Sub[12][1] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[12][2]%>"> <%=Sub[12][2] %> </a></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[12][3]%>"> <%=Sub[12][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[12][4]%>"> <%=Sub[12][4] %> </a></td>
</tr>

<!-- 야간5교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">14교시<br>21:40~22:30</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[13][0]%>"> <%=Sub[13][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[13][1]%>"> <%=Sub[13][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[13][2]%>"> <%=Sub[13][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[13][3]%>"> <%=Sub[13][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[13][4]%>"> <%=Sub[13][4] %></a> </td>
</tr>

<!-- 야간6교시 -->
<tr align="center" >
<td width = "100" height="30" bgcolor="gray"><font color="white">15교시<br>22:35~23:25</font></td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[14][0]%>"> <%=Sub[14][0] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[14][1]%>"> <%=Sub[14][1] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[14][2]%>"> <%=Sub[14][2] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[14][3]%>"> <%=Sub[14][3] %></a> </td>
  <td width = "100" ><a href="./index.jsp?page=./Delete_Subject.jsp&ID=<%=ID%>&passwd=<%=passwd%>&Sub=<%=Sub[14][4]%>"> <%=Sub[14][4] %> </a></td>
</tr>


</table>

<%
    	
    
   
    	}
    	 
    }

    else
    {%><center><%
    	out.print("로그인이 되어있지 않습니다.");
    	%></center>
    <%
    }






pstmt.close();
rs.close();
con.close();
%>
 <input type="text" name="ID"value="<%= ID %>" style="display:none" >
<input type="text" name="passwd"value="<%= passwd %>" style="display:none">
</form>
</body>
</html>