<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*,java.util.*, javax.sql.*,java.io.*,java.net.* " %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList, java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC « -//W3C//DTD HTML 4.0 Transitional//EN >
<HTML><HEAD>
  <TITLE>게시판</TITLE>
</HEAD>
<script lanquage=javascript>
function chk()
{
	if (document.memo_write.Name.value == "")
	{
	alert("이름을 입력하여 주시기 바랍니다.");
	document.memo_write.Name.focus();
	return false;
	}
	if (document.memo_write.Passwd.value == "")
	{
	alert("비밀번호를 입력하여 주시기 바랍니다.");
	document.memo_write.Passwd.focus();
	return false;
	}
	if (document.memo_write.Title.value == "")
	{
	alert("머리말을 입력하여 주시기 바랍니다.");
	document.memo_write.Title.focus();
	return false;
	}
	document.memo_write.submit();
	}
</script>
<h1><center>게시판</h1>
<BODY>
<%		
		String ID= request.getParameter("ID");
		String passwd= request.getParameter("passwd");
		session.getAttribute("ID");
		session.getAttribute("passwd");
		session.setMaxInactiveInterval(60*60);
		%>
	<TABLE align="top" border = "2" cellspacing = "0" cellpadding = "0" width="100%">      
		<form action="./index.jsp?ID=<%= ID%>&passwd=<%=passwd %>&page=./memo_write_ok.jsp" method="post"name="memo_write">   
		
<TR>        
<th align="center" width="20%">닉네임</th>
<td width="30%"><input type="text" maxlength="25" size="27%" name="Name" ></td>
<th align="center" width="20%">비밀번호</th>
<td width="30%"><input type="password" size="27%" name="Passwd"></td>
</TR> 
<tr>
<th align="center" width="50">제  목</th>
<td width="100" colspan="3"><input type="text" name="Title" size="130"></td>
</tr>
<tr>
<td width="700" colspan="4"><center><input type="button" value="등록" onclick="chk()"></center></td>
</tr>
</table>
<p></p>
<TABLE align="center" border = "2" cellspacing = "0" cellpadding = "0">      
<tr ><th width="55">번호</th>
<th width="75">이름</th>
<th width="700">머리말</th>
<th width="100">비밀번호</th>
<th width="55">삭제</th>
</tr>
<%
 	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
  	Connection con = DriverManager.getConnection(connectionURL);
  	ResultSet rs = null;
  	Statement stmt = con.createStatement();
  	
     String SQL = "select ";
     SQL = SQL + "Num, ";
     SQL = SQL + "name, ";
     SQL = SQL + "Passwd, ";
     SQL = SQL + "Title ";
     SQL = SQL + "from [201101677].dbo.Memo order by Num DESC";
 	rs = stmt.executeQuery(SQL);
 	while (rs.next()) {
 		String Num = rs.getString("Num");
 		String Name = rs.getString("Name");
 		String Passwd = rs.getString("Passwd");
 		String Title = rs.getString("Title");
 		%>
      <TR onmouseover="this.style.backgroundColor='gray';" onmouseout="this.style.backgroundColor='white';">     
               <TD width="30"><font size = 2><center><%= Num%></TD>
               <TD width="50"><font size = 2><center><%= Name%></TD>      
               <TD width="650"><font size = 2><center> <%= Title %>
               </TD>
               <TD width="50"><font size = 2><center><input type="password" value="<%= Passwd%>" disabled="true"></TD>
               <TD width="30"><font size = 2><a href="./index.jsp?page=./memo_delete.jsp&pNum=<%=Num%>&ID=<%=ID%>&passwd=<%=passwd%>"><center><img src="http://blogfiles.naver.net/MjAxNjEyMThfMjA1/MDAxNDgyMDQzMzY5ODQy.hq5b4IL40RyH8z7-pvbHTC3o3lQ9sMqZXzPmrcVBds8g.4qY4682EFOQI_KJNsY--qnfERRkicYygTeSVIZFjy2Ug.GIF.double_k2/delete.gif"></a></TD>
               </TR>
   <%
   }
   stmt.close();
rs.close();
con.close();
%>
</TABLE> </BODY>