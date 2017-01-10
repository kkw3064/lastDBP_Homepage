<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
// 단계1 : JDBC 드라이버 로드
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
// 단계2 : 커넥션 객체 생성
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
Connection con = DriverManager.getConnection(connectionURL);

// 단계3 : PreparedStatement 객체 생성
//PreparedStatement pstmt = null;
Statement stmt = con.createStatement();
// 단계4 :폼에서 입력한 값을 받아서 각각의 메모리 변수에 저장
String suserid= request.getParameter("ID");
String spasswd= request.getParameter("passwd1");
String susernm= request.getParameter("name");
String sbirth= request.getParameter("year") + request.getParameter("month") + request.getParameter("day");
String smail= request.getParameter("E-MAIL");
String suniv= request.getParameter("univ");
String smajor= request.getParameter("major");
String sgrade= request.getParameter("grade");
String sphon= request.getParameter("PHON") + request.getParameter("phon2") + request.getParameter("phon3");


// 단계5 : ID 중복 체크를 위하여 입력한 ID로 members를 select
String SQL = "select count(*) cnt from [201101677].dbo.Timetable_Member where MemID = '" + suserid + "'";
ResultSet rs = stmt.executeQuery(SQL);
rs.next() ;

if (rs != null) {
if (rs.getInt("cnt") > 0) {// 입력한 ID로 members를 select한 결과가 있다면
out.println("이 아이디는 이미 다른 사람이 사용하고 있으므로 사용할 수 없습니다.");
}
    else
{
    	SQL = "insert into [201101677].dbo.Timetable_Member(MemID, MemPw, MemName, MemBirth, MemEmail, MemUniv, MemMajor, MemGrade, MemPhone) values (";
    	SQL= SQL + "'" + suserid  + "', ";
    	SQL= SQL + "'" + spasswd  + "', ";
    	SQL= SQL + "'" + susernm  + "', ";
    	SQL= SQL + "'" + sbirth  + "', ";
    	SQL= SQL + "'" + smail   + "', ";
    	SQL= SQL + "'" + suniv  + "', ";
    	SQL= SQL + "'" + smajor  + "', ";
    	SQL= SQL + "'" + sgrade  + "', ";
    	SQL= SQL + "'" + sphon  + "') ";
    	stmt.executeUpdate(SQL);
    	%><br>
    	<h>가입되었습니다.</h><%
}
// 단계7 :객체 종료
    	stmt.close();
    	con.close();
    
    	}
    	
%>