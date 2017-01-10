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
String GroupName = request.getParameter("GroupName");

String SQL = "select * from [201101677].dbo.TimeTable_Group where MemID = '"+ID+"' and GroupName = '"+GroupName+"'";

ResultSet rs = stmt.executeQuery(SQL);


if(rs.next() == true){

	SQL = "DELETE FROM [201101677].dbo.Timetable_Group WHERE MemID = '"+ID+"' and GroupName = '"+GroupName+"'";	
	stmt.executeUpdate(SQL);
    out.print(GroupName + "그룹에서 탈퇴되었습니다.");
    %><center><a href="./index.jsp?page=./SelectGroup.jsp&ID=<%=ID%>&passwd=<%=passwd%>">그룹 리스트로 돌아가기</a></center>
    <%
	}
	else{
	}

rs.close();
stmt.close();
con.close();
%>

