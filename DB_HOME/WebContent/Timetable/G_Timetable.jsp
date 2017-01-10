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
String GroupName = request.getParameter("GroupName");
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);
 %>

<form name="Timetable" action="./index.jsp?ID=<%=ID%>&passwd=<%=passwd%>&page=./SelectGroup.jsp" method=post>
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
     PreparedStatement pstmt3 = null;
     ResultSet rs = null;
     ResultSet rs2 = null;
     ResultSet rs3 = null;



	String sSub = request.getParameter("pSub");
	String sTe = request.getParameter("pTe");
	String sDay = request.getParameter("pDay");

String SQL= "select * from Timetable_Member where MemID = ? and MemPw = ?";
String SQL2 = "select * from [201101677].dbo.Timetable_Person where MemID = ?";
String SQL3 = "select * from [201101677].dbo.Timetable_Group where GroupName = ?";

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
<center><font size="10%"><b><%=GroupName %> 그룹 의 시간표</b></font></center>
<p></p>
<center><input type="submit" value="이전 페이지로"></center>
<br>
<%
String[][] Sub= new String[20][5];

for(int i =0;i<20;i++){
	for(int j=0;j<5;j++){
	Sub[i][j] = "";
	}
}
pstmt3 = con.prepareStatement(SQL3);
pstmt3.setString(1,GroupName);
rs3=pstmt3.executeQuery();
while(rs3.next()){
	String dbID = rs3.getString("MemID");
	pstmt2 = con.prepareStatement(SQL2);
	pstmt2.setString(1, dbID);
    sName = rs3.getString("MemName");	
    	rs2 = pstmt2.executeQuery();
		while(rs2.next()){
			String dbSub = rs2.getString("교과목명");
	    	String dbTe = rs2.getString("교수명");
	    	String dbDay = rs2.getString("요일");
	    	
		String day = dbDay.substring(0, dbDay.length());
		
		String[] txtArr = day.split(",");
    		
    		if(txtArr[0].equals("월")&&((txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1")))) Sub[0][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&((txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2")))) Sub[1][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][0] += sName+"<br>";
    		if(txtArr[0].equals("월")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][0] += sName+"<br>";
    		
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][1] += sName+"<br>";
    		if(txtArr[0].equals("화")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][1] += sName+"<br>";
    		
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][2] += sName+"<br>";
    		if(txtArr[0].equals("수")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][2] += sName+"<br>";
    		
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][3] += sName+"<br>";
    		if(txtArr[0].equals("목")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][3] += sName+"<br>";
    		
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("1")||txtArr[2].equals("1")||txtArr[3].equals("1"))) Sub[0][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("2")||txtArr[2].equals("2")||txtArr[3].equals("2"))) Sub[1][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("3")||txtArr[2].equals("3")||txtArr[3].equals("3"))) Sub[2][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("4")||txtArr[2].equals("4")||txtArr[3].equals("4"))) Sub[3][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("5")||txtArr[2].equals("5")||txtArr[3].equals("5"))) Sub[4][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("6")||txtArr[2].equals("6")||txtArr[3].equals("6"))) Sub[5][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("7")||txtArr[2].equals("7")||txtArr[3].equals("7"))) Sub[6][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("8")||txtArr[2].equals("8")||txtArr[3].equals("8"))) Sub[7][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("9")||txtArr[2].equals("9")||txtArr[3].equals("9"))) Sub[8][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("10")||txtArr[2].equals("10")||txtArr[3].equals("10"))) Sub[9][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("11")||txtArr[2].equals("11")||txtArr[3].equals("11"))) Sub[10][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("12")||txtArr[2].equals("12")||txtArr[3].equals("12"))) Sub[11][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("13")||txtArr[2].equals("13")||txtArr[3].equals("13"))) Sub[12][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("14")||txtArr[2].equals("14")||txtArr[3].equals("14"))) Sub[13][4] += sName+"<br>";
    		if(txtArr[0].equals("금")&&(txtArr[1].equals("15")||txtArr[2].equals("15")||txtArr[3].equals("15"))) Sub[14][4] += sName+"<br>";
		}


    }


    %>
<table align="center" border="외각굵은선">
<tr align="center" bgcolor="gray">
<td width = "100" height="20"></td><td width = "100">월</td><td width = "100">화</td><td width = "100">수</td><td width = "100">목</td><td width = "100">금</td>
</tr>	

<!-- 1교시 -->
<tr align="center" >
<td width = "100" height="30">1교시<br>09:00~09:50</td> 
 <td width = "100"> <%=Sub[0][0] %></td> 
 <td width = "100"> <%=Sub[0][1] %> </td>
 <td width = "100"> <%=Sub[0][2] %> </td>
 <td width = "100"> <%=Sub[0][3] %> </td>
 <td width = "100"> <%=Sub[0][3] %> </td>
</tr>

<!-- 2교시 -->
<tr align="center" >
<td width = "100" height="30">2교시<br>10:00~10:50</td> 
 <td width = "100"> <%=Sub[1][0] %> </td>
 <td width = "100"> <%=Sub[1][1] %> </td>
 <td width = "100"> <%=Sub[1][2] %> </td>
 <td width = "100"> <%=Sub[1][3] %> </td>
 <td width = "100"> <%=Sub[1][4] %> </td>
</tr>

<!-- 3교시 -->
<tr align="center" >
<td width = "100" height="30">3교시<br>11:00~11:50</td>
  <td width = "100"> <%=Sub[2][0] %> </td>
  <td width = "100"> <%=Sub[2][1] %> </td>
  <td width = "100"> <%=Sub[2][2] %> </td>
  <td width = "100"> <%=Sub[2][3] %> </td>
  <td width = "100"> <%=Sub[2][4] %> </td>
 </tr>
 
 <!-- 4교시 -->
<tr align="center" >
<td width = "100" height="30">4교시<br>12:00~12:50</td>
  <td width = "100"> <%=Sub[3][0] %> </td>
  <td width = "100"> <%=Sub[3][1] %> </td>
  <td width = "100"> <%=Sub[3][2] %> </td>
  <td width = "100"> <%=Sub[3][3] %> </td>
  <td width = "100"> <%=Sub[3][4] %> </td>
 </tr>
 
 <!-- 5교시 -->
<tr align="center" >
<td width = "100" height="30">5교시<br>13:00~13:50</td>
  <td width = "100"> <%=Sub[4][0] %> </td>
  <td width = "100"> <%=Sub[4][1] %> </td>
  <td width = "100"> <%=Sub[4][2] %> </td>
  <td width = "100"> <%=Sub[4][3] %> </td>
  <td width = "100"> <%=Sub[4][4] %> </td>
 </tr>
 
 <!-- 6교시 -->
<tr align="center" >
<td width = "100" height="30">6교시<br>14:00~14:50</td>
  <td width = "100"> <%=Sub[5][0] %> </td>
  <td width = "100"> <%=Sub[5][1] %> </td>
  <td width = "100"> <%=Sub[5][2] %> </td>
  <td width = "100"> <%=Sub[5][3] %> </td>
  <td width = "100"> <%=Sub[5][4] %> </td>
 </tr>
 
 <!-- 7교시 -->
<tr align="center" >
<td width = "100" height="30">7교시<br>15:00~15:50</td>
  <td width = "100"> <%=Sub[6][0] %> </td>
  <td width = "100"> <%=Sub[6][1] %> </td>
  <td width = "100"> <%=Sub[6][2] %> </td>
  <td width = "100"> <%=Sub[6][3] %> </td>
  <td width = "100"> <%=Sub[6][4] %> </td>
 </tr>
 
 <!-- 8교시 -->
<tr align="center" >
<td width = "100" height="30">8교시<br>16:00~16:50</td>
  <td width = "100"> <%=Sub[7][0] %> </td>
  <td width = "100"> <%=Sub[7][1] %> </td>
  <td width = "100"> <%=Sub[7][2] %> </td>
  <td width = "100"> <%=Sub[7][3] %> </td>
  <td width = "100"> <%=Sub[7][4] %> </td>
 </tr>
 
 <!-- 9교시 -->
<tr align="center" >
<td width = "100" height="30">9교시<br>17:00~17:50</td>
  <td width = "100"> <%=Sub[8][0] %> </td>
  <td width = "100"> <%=Sub[8][1] %> </td>
  <td width = "100"> <%=Sub[8][2] %> </td>
  <td width = "100"> <%=Sub[8][3] %> </td>
  <td width = "100"> <%=Sub[8][4] %> </td>
 </tr>
 
 <!-- 야간1교시 -->
<tr align="center" >
<td width = "100" height="30">10교시<br>18:00~18:50</td>
  <td width = "100"> <%=Sub[9][0] %> </td>
  <td width = "100"> <%=Sub[9][1] %> </td>
  <td width = "100"> <%=Sub[9][2] %> </td>
  <td width = "100"> <%=Sub[9][3] %> </td>
  <td width = "100"> <%=Sub[9][4] %> </td>
 </tr>
 
 <!-- 야간2교시 -->
<tr align="center" >
<td width = "100" height="30">11교시<br>18:55~19:45</td>
  <td width = "100"> <%=Sub[10][0] %> </td>
  <td width = "100"> <%=Sub[10][1] %> </td>
  <td width = "100"> <%=Sub[10][2] %> </td>
  <td width = "100"> <%=Sub[10][3] %> </td>
  <td width = "100"> <%=Sub[10][4] %> </td>
 </tr>
 
 <!-- 야간3교시 -->
<tr align="center" >
<td width = "100" height="30">12교시<br>19:50~20:40</td>
  <td width = "100"> <%=Sub[11][0] %> </td>
  <td width = "100"> <%=Sub[11][1] %> </td>
  <td width = "100"> <%=Sub[11][2] %> </td>
  <td width = "100"> <%=Sub[11][3] %> </td>
  <td width = "100"> <%=Sub[11][4] %> </td>
</tr>

<!-- 야간4교시 -->
<tr align="center" >
<td width = "100" height="30">13교시<br>20:45~21:35</td> 
  <td width = "100"> <%=Sub[12][0] %> </td>
  <td width = "100"> <%=Sub[12][1] %> </td>
  <td width = "100"> <%=Sub[12][2] %> </td>
  <td width = "100"> <%=Sub[12][3] %> </td>
  <td width = "100"> <%=Sub[12][4] %> </td>
</tr>

<!-- 야간5교시 -->
<tr align="center" >
<td width = "100" height="30">14교시<br>21:40~22:30</td>
  <td width = "100"> <%=Sub[13][0] %> </td>
  <td width = "100"> <%=Sub[13][1] %> </td>
  <td width = "100"> <%=Sub[13][2] %> </td>
  <td width = "100"> <%=Sub[13][3] %> </td>
  <td width = "100"> <%=Sub[13][4] %> </td>
</tr>

<!-- 야간6교시 -->
<tr align="center" >
<td width = "100" height="30">15교시<br>22:35~23:25</td>
  <td width = "100"> <%=Sub[14][0] %> </td>
  <td width = "100"> <%=Sub[14][1] %> </td>
  <td width = "100"> <%=Sub[14][2] %> </td>
  <td width = "100"> <%=Sub[14][3] %> </td>
  <td width = "100"> <%=Sub[14][4] %> </td>
</tr>


</table>

<%

}

pstmt.close();
rs.close();
con.close();
%>
</body>
</html>