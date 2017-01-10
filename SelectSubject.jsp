<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
<!--
.invisible {
clear: none;
border: 0px none;
float: none;
font-weight:bold;
background-color: #ffffff;
/* 배경을 투명하게 할경우에는 background-color: transparent; */
}
-->
</style> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강 조회</title>
</head>
<body>
<%

	String search_major = request.getParameter("major");
	String search_grade = request.getParameter("grade");
	String ID= request.getParameter("ID");
	String passwd= request.getParameter("passwd");
	session.getAttribute("ID");
	session.getAttribute("passwd");
	session.setMaxInactiveInterval(60*60); 
	
	if(search_major == null) search_major = "";
	if(search_grade == null) search_grade = "";
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
	Connection con = DriverManager.getConnection(connectionURL);
	
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
%>
<form name=search action="./index.jsp?page=SelectSubject.jsp&ID=<%=ID %>&paawd=<%=passwd %>" method = post>
<table>
<tr> 
<td>
<select name="major">
<option value="1"<%if (search_major.equals("1")) out.print("selected");%>>전공/교양 선택창</option>
<option value="2"<%if (search_major.equals("2")) out.print("selected");%>>전체</option>
<option value="컴공"<%if (search_major.equals("컴공")) out.print("selected");%>>컴퓨터공학부</option>
<option value="컴야"<%if (search_major.equals("컴야")) out.print("selected");%>>컴퓨터공학부(야)</option>
<option value="임베"<%if (search_major.equals("임베")) out.print("selected");%>>정보통신공학과</option>
<option value="정통"<%if (search_major.equals("정통")) out.print("selected");%>>임베디드시스템공학과</option>
<option value="교양"<%if (search_major.equals("교양")) out.print("selected");%>>교양</option>
</select>&nbsp;&nbsp;&nbsp;
<select name="grade">
<option value="0" <%if (search_major.equals("0")) out.print("selected");%>>전학년</option>
<option value="1" <%if (search_major.equals("1")) out.print("selected");%>>1학년</option>
<option value="2" <%if (search_grade.equals("2")) out.print("selected");%>>2학년</option>
<option value="3" <%if (search_grade.equals("3")) out.print("selected");%>>3학년</option>
<option value="4" <%if (search_grade.equals("4")) out.print("selected");%>>4학년</option></select>
&nbsp;&nbsp;&nbsp;<input type="submit" value="검색"></td></tr>
</table>
	<input type="text" name="ID"value="<%= ID %>" style="display:none" >
	<input type="text" name="passwd"value="<%= passwd %>" style="display:none">


<br>



<%

	String SQL2= "select * from [201101677].dbo.Timetable_Member where MemID = ? and MemPw = ?";
	pstmt = con.prepareStatement(SQL2);
	
	pstmt.setString(1, ID);
	pstmt.setString(2, passwd);
	rs2 = pstmt.executeQuery();
	
	%>

	<%
	
	
	if(rs2.next()==true){

		String pName = rs2.getString("MemName");
		%>
		<center><font size="10%"><b><%=pName %> 의 수강 조회</b></font></center>
<input type="text" name="ID"value="<%= ID %>" style="display:none" >
	<input type="text" name="passwd"value="<%= passwd %>" style="display:none">

	<table align="center" border="1">
<tr bgcolor="gray" align ="center">
<td width="50">학년</td><td width="50">구분</td><td width="70">이수구분</td><td width="300">교과목명</td>
<td width="50">학점</td><td width="100">교수명</td><td width="300">요일및 시간</td>
	
<%
	if(search_major.equals("2")&&search_grade.equals("0")) 
	{
		String SQL = "select * from [201101677].dbo.Subject ";
		rs = stmt.executeQuery(SQL);
	}
	else if(search_major.equals("2")){
		String SQL = "select * from [201101677].dbo.Subject ";
		SQL = SQL + "where 학년 like '"+search_grade+"'";
		rs = stmt.executeQuery(SQL);
	}
	else if(search_grade.equals("0")){
		String SQL = "select * from [201101677].dbo.Subject ";
		SQL = SQL + "where 구분 like '"+search_major+"'";
		rs = stmt.executeQuery(SQL);
	}
	else{
	String SQL = "select * from [201101677].dbo.Subject ";
	SQL = SQL + "where 구분 like '"+search_major+"' and ";
	SQL = SQL + "학년 like '"+search_grade+"'";
	SQL = SQL + "order by 학년 ";
	rs = stmt.executeQuery(SQL);
	}
	while(rs.next()){
		String sGrade = rs.getString("학년");
		String sDiv = rs.getString("구분");
		String sCDiv = rs.getString("이수구분");
		String sSub = rs.getString("교과목명");
		String sCre = rs.getString("학점");
		String sTe = rs.getString("교수명");
		String sDay = rs.getString("요일");
		%>
		
		
	
		
		<tr>
		<td><a href="./index.jsp?page=./SelectSubject_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>&sSub=<%=sSub %>&sTe=<%=sTe %>&sDay=<%=sDay %>&MemName=<%=pName %>" ><%= sGrade %></a></td>
		<td><a href="./index.jsp?page=./SelectSubject_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>&sSub=<%=sSub %>&sTe=<%=sTe %>&sDay=<%=sDay %>&MemName=<%=pName %>" ><%= sDiv %></a></td>
		<td><a href="./index.jsp?page=./SelectSubject_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>&sSub=<%=sSub %>&sTe=<%=sTe %>&sDay=<%=sDay %>&MemName=<%=pName %>" ><%= sCDiv %></a></td>
		<td><a href="./index.jsp?page=./SelectSubject_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>&sSub=<%=sSub %>&sTe=<%=sTe %>&sDay=<%=sDay %>&MemName=<%=pName %>" ><%= sSub %></a></td>
		<td><a href="./index.jsp?page=./SelectSubject_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>&sSub=<%=sSub %>&sTe=<%=sTe %>&sDay=<%=sDay %>&MemName=<%=pName %>" ><%= sCre %></a></td>
		<td><a href="./index.jsp?page=./SelectSubject_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>&sSub=<%=sSub %>&sTe=<%=sTe %>&sDay=<%=sDay %>&MemName=<%=pName %>" ><%= sTe %></a></td>
		<td><a href="./index.jsp?page=./SelectSubject_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>&sSub=<%=sSub %>&sTe=<%=sTe %>&sDay=<%=sDay %>&MemName=<%=pName %>" ><%= sDay %></a></td>
		</tr>
		
			
		<%
		
	}

%>
		
		</table>
</form>

<%
		stmt.close();
		rs.close();
		rs2.close();
		con.close();
	}
	%>

</body>
</html>


<!-- 
<script type="text/javascript">
function Submit(index){
	if(index==1){
		document.search.action='SelectSubject.jsp';
	}
	else if(index==2){
		document.search.action='SelectSubject_ok.jsp';
	}
	document.search.submit();
}
</script>

 -->