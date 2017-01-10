<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 

String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
	String GroupName = request.getParameter("GroupName");
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
	Connection con = DriverManager.getConnection(connectionURL);
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null; 


String SQL = "select * from [201101677].dbo.TimeTable_Group where MemID = '"+ID+"' and GroupName = '"+GroupName+"'";
ResultSet rs = stmt.executeQuery(SQL);

	if (rs.next() == true) {
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>한줄메모장 삭제하기</title>
</head>
<body>
	<form name="frm3" action="./index.jsp?page=./memo_delete_ok.jsp&counter=<%=GroupName%>&ID=<%=ID %>&passwd=<%=passwd %>"
		method="post">
		<table>


			<tr>
				<td colspan=2><h1><%=GroupName%>그룹에 탈퇴하시겠습니까?</h1></td>
			</tr>
			<tr>
				<td align="center"><br>
				<a href="./index.jsp?page=./Group_delete_ok.jsp&ID=<%=ID%>&passwd=<%=passwd%>&GroupName=<%=GroupName%>">예</a>&nbsp;&nbsp;
				<a href="./index.jsp?page=./SelectGroup.jsp&ID=<%=ID%>&passwd=<%=passwd%>">아니요</a></td>
			</tr>
			<br>
			<%
				}
				stmt.close();
				rs.close();
				con.close();
			%>
		</table>
	</form>
</body>
</html>