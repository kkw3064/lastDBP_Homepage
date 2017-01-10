<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*,java.util.*, javax.sql.*,java.io.*,java.net.* " %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList, java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC « -//W3C//DTD HTML 4.0 Transitional//EN >
<html>
<head>
<title>회원 정보 수정</title>
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
	  document.member_update.ID.value=""
	  return;
	 }
	}
function valid_check()
{

if (document.member_update.ID.value == "")
{
alert("아이디를 입력하여 주시기 바랍니다.");
document.member_update.ID.focus();
return false;
}
if (document.member_update.ID.value.length < 4)
{
alert("아이디는 4자 이상입니다.");
document.member_update.ID.focus();
return false;
}
if (document.member_update.passwd1.value == "")
{
alert("비밀번호를 입력하여 주시기 바랍니다.");
document.member_update.passwd.focus();
return false;
}
if (document.member_update.passwd1.value != document.member_update.passwd2.value)
{
alert("비밀번호를 확인하여 주시기 바랍니다.");
document.member_update.passwd.focus();
return false;
}
if (document.member_update.name.value == "")
{
alert("이름을 입력하여 주시기 바랍니다.");
document.member_update.name.focus();
return false;
}
document.member_update.submit();
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
	var str = document.member_update.phon2.value.length;
	if(str==4){
		document.member_update.phon3.focus();
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

<%


String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);
  // 세션 값 받아서 저장
  
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
Connection con = DriverManager.getConnection(connectionURL);
PreparedStatement pstmt = null;
ResultSet rs = null;

String SQL = "select * from [201101677].dbo.Timetable_Member where MemID = ?";
pstmt = con.prepareStatement(SQL);
pstmt.setString(1, ID);
rs = pstmt.executeQuery();
if (rs.next() == false)
out.print("등록되지 않은 회원입니다.");
else
{
String MemName= rs.getString("MemName");
String MemBirth = rs.getString("MemBirth");
String MemBirth1 = MemBirth.substring(0,4);
String MemBirth2 = MemBirth.substring(4,6);
String MemBirth3 = MemBirth.substring(6,8);
String MemEmail = rs.getString("MemEmail");
String MemUniv = rs.getString("MemUniv");
String MemMajor = rs.getString("MemMajor");
String MemGrade = rs.getString("MemGrade");
String MemPhone = rs.getString("MemPhone");
String MemPhone1 = MemPhone.substring(0,2);
String MemPhone2 = MemPhone.substring(2,6);
String MemPhone3 = MemPhone.substring(6,10);

%>
<body>
<br><br>
	<TABLE align="center" border="외각굵은선"  >
		<form action="./index.jsp?page=./member_update_ok.jsp&ID=<%=ID %>&passwd=<%=passwd %>" method="post" name="member_update">
			<tr>

				<td align="center" colspan="2" BGCOLOR="GRAY" height="100"><font size ="20"><b>회원 정보 수정</b></font></td>
			</tr>
		<tr>
			<td align="center" WIDTH="15%" BGCOLOR="GRAY"  name="ID">* 아이디</td>
			<td WIDTH="800"><input type="text" style="ime-mode:disabled" name="ID" size="18"maxlength="16"
			onkeypress="nonHangulSpecialKey()" readonly value="<%=ID%>"></td>
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
			<td><input type="text" name="name" size="10"maxlength="10" value="<%=MemName%>"></td>
		</tr>
				<tr>
			<td align="center" BGCOLOR=GRAY>* 생년월일</td>
			<td>
			<input type="number" size="4" maxlength="4"name="year" value="<%=MemBirth1%>">년 
			<input type="number" size="2" maxlength="2"name="month"value="<%=MemBirth2%>">월 
			<input type="number" size="2" maxlength="2"name="day"value="<%=MemBirth3%>">일 
			</td>
		</tr>
		
		<tr>
			<td align="center" BGCOLOR=GRAY>* 이메일</td>
			<td><input type="text" name="E-MAIL" "size=8 value="<%=MemEmail%>"></td>
		</tr>
		
		<tr>
			<td align="center" BGCOLOR=GRAY>* 학교</td>
			<td><input type="text" name="univ" "size=8 value="<%=MemUniv%>"></td>
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
					<OPTION VALUE="computer"<%if (MemMajor.equals("computer"))
					out.print(" selected");%>>컴퓨터공학부</OPTION>
					<OPTION VALUE="computer(N)"<%if (MemMajor.equals("computer(N)"))
					out.print(" selected");%>>컴퓨터공학부(야)</OPTION>
					<OPTION VALUE="embedded"<%if (MemMajor.equals("embedded"))
					out.print(" selected");%>>임베디드시스템공학과</OPTION>
					<OPTION VALUE="info"<%if (MemMajor.equals("info"))
					out.print(" selected");%>>정보통신학과</OPTION>
			</SELECT>
			</td>
		</tr>

		<tr>
			<td align="center" BGCOLOR=GRAY>* 핸드폰번호</td>
			<td><SELECT NAME="PHON">
					<OPTION VALUE="010"<%if (MemPhone1.equals("10"))
					out.print(" selected");%>>010</OPTION>
					<OPTION VALUE="011"<%if (MemPhone1.equals("11"))
					out.print(" selected");%>>011</OPTION>
					<OPTION VALUE="016"<%if (MemPhone1.equals("16"))
					out.print(" selected");%>>016</OPTION>
					<OPTION VALUE="018"<%if (MemPhone1.equals("18"))
					out.print(" selected");%>>018</OPTION>
			</SELECT> 
			-  <input type="number"size="2"name="phon2"maxlength="4"value="<%=MemPhone2 %>" onKeyup="cursor_move(4) ">
		    - <input type="number" size="2"name="phon3"maxlength="4"value="<%=MemPhone3 %>" onKeyup="cursor_move(5) ">
		    </td>
		</tr>


		
				<tr>
			<td align="center" BGCOLOR=GRAY>학년</td>
			<td>
			<SELECT NAME="grade">
					<OPTION VALUE="1"<%if (MemGrade.equals("1"))
					out.print(" selected");%>>1</OPTION>
					<OPTION VALUE="2"<%if (MemGrade.equals("2"))
					out.print(" selected");%>>2</OPTION>
					<OPTION VALUE="3"<%if (MemGrade.equals("3"))
					out.print(" selected");%>>3</OPTION>
					<OPTION VALUE="4"<%if (MemGrade.equals("4"))
					out.print(" selected");%>>4</OPTION>
			</SELECT></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2" bgcolor="gray">
			<INPUT TYPE="hidden" Name="admin"Value="관리자버튼"> 
			&nbsp; &nbsp;&nbsp; &nbsp; 
			<!-- <INPUT TYPE="submit" VALUE="전송"> -->
			 <INPUT TYPE = "button" VALUE = "수정" onclick="valid_check()">
		</tr>
	</table>
<%} %>
</body>
</html>