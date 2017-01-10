<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language=javascript>
	// 자바 스크립트 시작

	function deleteCheck() {
		if (document.frm3.passwd1.value=="") { 
			alert("비밀번호를 입력하세요");
			frm3.passwd1.focus();    
			return;
		}
		document.frm3.submit();
	}
</script>
<% 

String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
	String counters = request.getParameter("pNum");
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
	Connection con = DriverManager.getConnection(connectionURL);
	PreparedStatement pstmt = null; 
	ResultSet rs = null;

	String SQL = "select Passwd from [201101677].dbo.memo where Num= ?";
	pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, counters);

	rs = pstmt.executeQuery();
	if (rs.next() == true) {
		String passwd2 = rs.getString("passwd");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>한줄메모장 삭제하기</title>
</head>
<body>
	<form name="frm3" action="./index.jsp?page=./memo_delete_ok.jsp&counter=<%=counters%>&ID=<%=ID %>&passwd=<%=passwd %>"
		method="post">
		<table>


			<tr>
				<td colspan=2><h1><%=counters%>번 글 정말로 삭제하시겠습니까?</h1></td>
			</tr>
			<br>
			<tr>
				<td align="center">비밀번호: <input type="text" name="passwd1"></td>
				<br>
				<br>
			<tr>
				<td align="center"><br><input type="button" value="삭제하기" maxlength="4"
					Onclick="deleteCheck()"></td>
			</tr>
			<br>
			<%
				}
				pstmt.close();
				rs.close();
				con.close();
			%>
		</table>
	</form>
</body>
</html>