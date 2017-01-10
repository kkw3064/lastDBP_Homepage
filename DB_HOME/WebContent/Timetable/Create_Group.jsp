<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function test(){
		if(document.Create_Group.GroupName.value == ""){
			alert("그룹명을 입력하여 주시기 바랍니다.");
			document.Create_Group.GroupName.focus();
			return false;
		}
		document.Create_Group.submit();
	}
	</script>
<%
// 단계1 : JDBC 드라이버 로드
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
// 단계2 : 커넥션 객체 생성
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
Connection con = DriverManager.getConnection(connectionURL);
Statement stmt = con.createStatement();

String ID = request.getParameter("ID");
String passwd = request.getParameter("passwd");
String GroupName = request.getParameter("GroupName");

String SQL = "select * from [201101677].dbo.Timetable_Member where MemID = '"+ID+"'";

ResultSet rs = stmt.executeQuery(SQL);


if(rs.next() == true){
	String dbMemName = rs.getString("MemName");
	String dbMemMajor = rs.getString("MemMajor");
	String dbMemGrade = rs.getString("MemGrade");
	%>
	
	<br><br><br>
	<form name=Create_Group action="./index.jsp" mathod=post>
	<center>
	<TABLE align="center" WIDTH="300"  bgcolor="#e1e1e1" >
	<tr><th>그룹명 </th><td><input type="text" name="GroupName" size="30"></tr>
	<tr><td></td><td align="center"><input type="button" value="만들기" onclick="test()"></tr>
	</TABLE>
	</center>
				<input type="text" name="ID" value="<%=ID%>" style="display: none">
				<input type="text" name="passwd" value="<%=passwd%>" style="display: none">
				<input type="text" name="page" value="Create_Group_ok.jsp" style="display: none">
	</form>
	<%
}
%></body></html>