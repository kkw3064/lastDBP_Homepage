<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
     String id = request.getParameter("id");
     boolean fnd = false;
     if (id == null)
          id = "";
     else
     {
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
     String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
     Connection con = DriverManager.getConnection(connectionURL);
     ResultSet rs = null;
     // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
// String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=kbs123;user=sa;password=11";
//  Connection con = DriverManager.getConnection(connectionURL);
// ResultSet rs = null;

Statement stmt= con.createStatement();
String strSQL= "SELECT MemID FROM [201101677].dbo.Timetable_Member WHERE MemID='" + id + "'";
rs = stmt.executeQuery(strSQL);

if (rs.next()) fnd = true;   // select 된 결과 행이 있으면

stmt.close();
con.close();
}
%>
<HTML><HEAD><TITLE>id check</TITLE></HEAD>
<script language="JavaScript">
function id_search() 
{
if(document.form_id_check.id.value=="") 
{
     alert("ID를 입력해 주세요.");
     document.form_id_check.id.focus();
}
else  {
document.form_id_check.submit();
}
}
function id_ok(a)
{
  opener.document.Home.ID.value=a;   
  self.close();   
}
</script>
<BODY><CENTER><BR>
<P align="center">사용하고자 하는 ID를 검색 버튼을 누르세요</P>
<FORM NAME = "form_id_check" ACTION = "id_check.jsp" METHOD = "POST" >
  <TABLE WIDTH="200">
    <TR>
      <TD WIDTH="150">ID</TD>
      <TD WIDTH="100"><INPUT TYPE="text"   NAME="id"  size="20" VALUE=<%= id %>></TD>
      <TD WIDTH="40" ><INPUT TYPE="button" VALUE="검색" onClick="javascript:id_search()"></TD>
    </TR>  </TABLE>
</FORM>
<% 
if (id != "" && fnd == false)  
{ 
%>
사용 가능한 ID 입니다<P>
확인을 누르시면 회원등록 화면으로 돌아갑니다.
<a href ="javascript:id_ok('<%= id %>')">  확인 </a>
<% 
}
else if (id != "" && fnd == true)
{ 
%>
이미 사용 중인 ID 입니다.
<%
}
%>
</CENTER></BODY></HTML>