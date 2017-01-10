<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>로그인</TITLE>
</HEAD>
<script language=javascript>
function valid_check()
{
if (document.member_login.ID.value == "")
{
alert("아이디를 입력하여 주시기 바랍니다.");
document.member_login.ID.focus();
return false;
}
if (document.member_login.passwd.value == "")
{
alert("비밀번호를 입력하여 주시기 바랍니다.");
document.member_login.passwd.focus();
return false;
}
document.member_login.submit();
}
 </script>
 
<h3 align="center">로그인</h3>

<%

	String ID = (String) session.getAttribute("ID");
	String passwd = (String) session.getAttribute("passwd");
	String MemName = (String) session.getAttribute("MemName");
	if (ID == null) {
		out.print(" &nbsp;&nbsp; GUEST님 반갑습니다.");
%> 
<BODY>
	<FORM NAME="member_login" ACTION="member_login_ok.jsp" METHOD="post">
	<center>
		<TABLE align="center" WIDTH="150"  CellPadding="0" CellSpacing="0" bgcolor="#e1e1e1" >
			<TR>
				<TD WIDTH="30%" ALIGN="left">아이디</TD>
				<TD width="70%" ALIGN="left"><INPUT TYPE="text" SIZE="10"
					MAXLENGTH="10" NAME="ID" bgcolor="#e1e1e1"  onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='white';"></TD>
			</TR>
			<TR>
				<TD WIDTH="30%" ALIGN="left">비밀번호</TD>
				<TD WIDTH="70%" ALIGN="left"><INPUT TYPE="password" SIZE="10"
					NAME="passwd" bgcolor="#e1e1e1"  onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='white';"></TD>
			</TR>
			<TR>
				<TD WIDTH="100%" ALIGN="center"><a href="./index.jsp?page=Home.jsp"> <INPUT
						TYPE="button" VALUE="회원가입">
				<TD WIDTH="100%" ALIGN="center"><INPUT TYPE="button"
					VALUE="로그인" onclick="valid_check()">
					</TD>
			</TR>
		</TABLE>
		</center>
	</FORM>
	<%
		} else {
			out.print(MemName);
			out.print("님 반갑습니다.");
			%>

			<BODY>
			<FORM NAME = "frmlogin"  METHOD = "post">
			<TABLE WIDTH = "90%" CellPadding = "0" CellSpacing = "0">
			<TR><TD WIDTH = "100%" ALIGN = "center" >
			<a href="member_logout.jsp"> 로그아웃</a>

			<a href="./index.jsp?ID=<%= ID %>&passwd=<%=passwd%>&page=member_update.jsp"> 정보수정</a>

			</TD></TR></TABLE>
			</FORM>
			 <% 
		}
			%>
	
</BODY>
</HTML>