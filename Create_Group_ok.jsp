<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
String GroupName = request.getParameter("GroupName");

String SQL = "select * from [201101677].dbo.Timetable_Member where MemID = '"+ID+"'";
String SQL3 = "select * from [201101677].dbo.Timetable_Group where GroupName= '"+GroupName+"'";

ResultSet rs = stmt.executeQuery(SQL);
rs.next();

	String dbMemName = rs.getString("MemName");
	String dbMemMajor = rs.getString("MemMajor");
	String dbMemGrade = rs.getString("MemGrade");
	
	pstmt = con.prepareStatement(SQL3);
	
	ResultSet rs2 = pstmt.executeQuery();
	
	if(rs2.next() == true){

		out.print("이미 존재하는 그룹명입니다.");
		%>
		<br>
		<a href="./index.jsp?page=./Create_Group.jsp&ID=<%=ID%>&passwd=<%=passwd%>"> <h>그룹만들기 페이지 이동 </h></a>
		<%
		
	}
	else{

		String SQL2 = "insert into [201101677].dbo.Timetable_Group (GroupName,MemID,MemName,MemMajor,MemGrade) values(";
		SQL2 = SQL2+"'"+GroupName+"', ";
		SQL2 = SQL2+"'"+ID+"',";
		SQL2 = SQL2+"'"+dbMemName+"',";
		SQL2 = SQL2+"'"+dbMemMajor+"',";
		SQL2 = SQL2+"'"+dbMemGrade+"')";
		stmt.executeUpdate(SQL2);
		
		%><br>
		<center><h>그룹이 만들어졌습니다.<h></center>
		<br>
		<center><a href="./index.jsp?page=./Timetable_Group.jsp&ID=<%=ID%>&passwd=<%=passwd%>"> <h>그룹 페이지로 이동 </h></a></center>
		<%
	}

%>
</body></html>