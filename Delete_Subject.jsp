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
String Sub = request.getParameter("Sub");

String SQL = "select * from [201101677].dbo.Timetable_Person where MemID = '"+ID+"' and 교과목명 = '"+Sub+"'";

ResultSet rs = stmt.executeQuery(SQL);


if(rs.next() == true){

	SQL = "DELETE FROM [201101677].dbo.Timetable_Person WHERE MemID = '"+ID+"' and 교과목명 = '"+Sub+"'";	
	stmt.executeUpdate(SQL);
    out.print(Sub + "과목이 삭제되었습니다.");
    %><center><a href="./index.jsp?page=./Timetable.jsp&ID=<%=ID%>&passwd=<%=passwd%>">개인 시간표로 돌아가기</a></center>
    <%
	}
	else{
	}

rs.close();
stmt.close();
con.close();
%>

