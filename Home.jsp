<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*,java.util.*, javax.sql.*,java.io.*,java.net.* " %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList, java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC « -//W3C//DTD HTML 4.0 Transitional//EN >
<html>
<head>
<title>회원가입</title>
</head>
<script lanquage=javascript>
function check_ID(){
	var char_ASCII = event.keyCode;
	 if (char_ASCII >= 48 && char_ASCII <= 57 )
		   return 1;
		 //영어
		 else if ((char_ASCII>=65 && char_ASCII<=90) || (char_ASCII>=97 && char_ASCII<=122))
		    return 2;
		 else 
		    return 0;
		
}
function nonHangulSpecialKey() {

	 if(check_ID() != 1 && check_ID() != 2) {
	  event.returnValue = false;   
	  alert("숫자나 영문자만 입력하세요!");
	  document.Home.ID.value=""
	  return;
	 }
	}
function valid_check()
{

if (document.Home.ID.value == "")
{
alert("아이디를 입력하여 주시기 바랍니다.");
document.Home.ID.focus();
return false;
}
if (document.Home.ID.value.length < 4)
{
alert("아이디는 4자 이상입니다.");
document.Home.ID.focus();
return false;
}
if (document.Home.passwd1.value == "")
{
alert("비밀번호를 입력하여 주시기 바랍니다.");
document.Home.passwd.focus();
return false;
}
if (document.Home.passwd1.value != document.Home.passwd2.value)
{
alert("비밀번호를 확인하여 주시기 바랍니다.");
document.Home.passwd.focus();
return false;
}
if (document.Home.name.value == "")
{
alert("이름을 입력하여 주시기 바랍니다.");
document.Home.name.focus();
return false;
}
document.Home.submit();
}


function KeyNumber()
{
var event_key = event.keyCode;

if((event_key < 48 || event_key > 57) && (event_key != 8 && event_key != 46))
{
event.returnValue=false;
}
}


function cursor_move(a)
{
	if(a==4)
	{
	var str = document.Home.phon2.value.length;
	if(str==4){
		document.Home.phon3.focus();
	}
	}

}


function check_id() 
{
   var JSPName = "id_check.jsp";
  browsing_window = window.open(JSPName, "_idcheck",
"height=220,width=520, menubar=no,directories=no,resizable=no,status=yes,scrollbars=no , toolbar=no");
   browsing_window.focus();
}

</script>

<body>
	<TABLE align="center" border="외각굵은선"  >
		<form action="./index.jsp?page=./member_join_ok.jsp" method="post" name="Home">
			<tr>

				<td align="center" colspan="2" BGCOLOR="GRAY" height="100"><font size ="20"><b>회원 가입</b></font></td>
			</tr>
		<tr>
			<td align="center" WIDTH="15%" BGCOLOR="GRAY"  name="ID">* 아이디</td>
			<td WIDTH="800"><input type="text" style="ime-mode:disabled" name="ID" size="18"maxlength="16"
			onkeypress="nonHangulSpecialKey()" readonly>
			<INPUT TYPE=button VALUE="아이디 중복확인" onclick="check_id()"  
      onmouseover="this.style.cursor='hand';"></td>
		</tr>
		<tr>
			<td align="center" BGCOLOR=GRAY>* 비밀번호</td>
			<td><input type="password" name="passwd1" size="20"maxlength="18"> 
			&nbsp; &nbsp;&nbsp; &nbsp; 
			비밀번호 확인
			<input type="password" name="passwd2" size="20"maxlength="18"></td>
		</tr>
		
		<tr>
			<td align="center" BGCOLOR=GRAY>* 이름</td>
			<td><input type="text" name="name" "size="10"maxlength="10"></td>
		</tr>
				<tr>
			<td align="center" BGCOLOR=GRAY>* 생년월일</td>
			<td>
			<input type="number" size="4" maxlength="4"name="year">년 
			<input type="number" size="2" maxlength="2"name="month">월 
			<input type="number" size="2" maxlength="2"name="day">일 
			</td>
		</tr>
		
		<tr>
			<td align="center" BGCOLOR=GRAY>* 이메일</td>
			<td><input type="text" name="E-MAIL" "size=8></td>
		</tr>
		
		<tr>
			<td align="center" BGCOLOR=GRAY>* 학교</td>
			<td><input type="text" name="univ" "size=8></td>
		</tr>
		
		<tr>
			<td align="center" BGCOLOR=GRAY>* 단 대</td>
			<td>
			<SELECT NAME="college">
					<OPTION VALUE="">==단대 선택하세요==</OPTION>
					<OPTION VALUE="CLA" >인문대학</OPTION>
					<OPTION VALUE="CNS">자연과학대학</OPTION>
					<OPTION VALUE="CSS">사회과학대학</OPTION>
					<OPTION VALUE="LAW">글로벌법정경대학</OPTION>
					<OPTION VALUE="CIT">공과대학</OPTION>
					<OPTION VALUE="CSE" onclick = "test_click(1)">정보기술대학</OPTION>
					<OPTION VALUE="CA">경영대학</OPTION>
					<OPTION VALUE="CAD">예술체육대학</OPTION>
					<OPTION VALUE="TCE">사범대학</OPTION>
					<OPTION VALUE="UOS">도시과학대학</OPTION>
					<OPTION VALUE="CLS">생명과학기술대학</OPTION>
					<OPTION VALUE="SONAS">동북아국제통상학부</OPTION>
					
			</SELECT></td>
		</tr>


		<tr>
			<td align="center" BGCOLOR=GRAY>학과</td>
			<td>
			<SELECT NAME="major">
					<OPTION VALUE="">==학과 선택하세요==</OPTION>
					<OPTION VALUE="computer">컴퓨터공학부</OPTION>
					<OPTION VALUE="computer(N)">컴퓨터공학부(야)</OPTION>
					<OPTION VALUE="embedded">임베디드시스템공학과</OPTION>
					<OPTION VALUE="info">정보통신학과</OPTION>
			</SELECT>
			</td>
		</tr>

		<tr>
			<td align="center" BGCOLOR=GRAY>* 핸드폰번호</td>
			<td><SELECT NAME="PHON">
					<OPTION VALUE="010">010</OPTION>
					<OPTION VALUE="011">011</OPTION>
					<OPTION VALUE="016">016</OPTION>
					<OPTION VALUE="018">018</OPTION>
			</SELECT> 
			-  <input type="number"size="2"name="phon2"maxlength="4" onKeyup="cursor_move(4) ">
		    - <input type="number" size="2"name="phon3"maxlength="4" onKeyup="cursor_move(5) ">
		    </td>
		</tr>


		
				<tr>
			<td align="center" BGCOLOR=GRAY>학년</td>
			<td>
			<SELECT NAME="grade">
					<OPTION VALUE="1">1</OPTION>
					<OPTION VALUE="2">2</OPTION>
					<OPTION VALUE="3">3</OPTION>
					<OPTION VALUE="4">4</OPTION>
			</SELECT></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2" bgcolor="gray">
			<INPUT TYPE="hidden" Name="admin"Value="관리자버튼"> 
			&nbsp; &nbsp;&nbsp; &nbsp; 
			<!-- <INPUT TYPE="submit" VALUE="전송"> -->
			 <INPUT TYPE = "button" VALUE = "가입" onclick="valid_check()">
			&nbsp; &nbsp;&nbsp; &nbsp; 
			<INPUT TYPE="reset" VALUE="초기화"></td>
		</tr>
	</table>

</body>
</html>