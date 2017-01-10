<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%


String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);


     String pagefile = request.getParameter("page");  //  파일 이름 획득
     if (pagefile==null){pagefile="main_first.jsp";}         //  없으면 main_first
     
%> 
<html>
<style type="text/css">
td,img{
backgroud:skyblue;
margin:0px;
padding:0px;
border-collapse:collapse;}
img{display:block;}
</style>

<head><title>Template Test</title>
</head><body>
<table width="1300" height="900" color="black" align="center" cellpadding="0" cellspacing="0" vmargin="0">
<!-- Top -->
<tr bgcolor="skyblue" align="center">
<!--  HOME  -->
<td height="80"><a href="./index.jsp?ID=<%= ID%>&passwd=<%=passwd %>">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfMjE3/MDAxNDgxMjg1NjIxMDc3.wlNb1JFLCb0Dspe0j0-lROF8C8rlXlmvzVVfwJWFgrsg.oXolpkLIdZMRdb7I1AF6qQRSGE2P7RLwmDs6qKZDVOUg.JPEG.double_k2/Home.jpg" style="display:block" width="100" height="100%"></a></td>

<!--  익명게시판   -->
<td height="80"><a href="./index.jsp?ID=<%= ID%>&passwd=<%=passwd %>&page=./Memo_write.jsp?ID=<%= ID%>&passwd=<%=passwd %>">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfMzMg/MDAxNDgxMjg0NDE4MzEy.2pN3RMpoiyRD8iB4ApkodXN9E0tFdhBXyKoBEyt-newg.bYAnsB8Pzw-hxsoCLEWBYFEtHc4Nf-d0Sp5QYbXSCugg.JPEG.double_k2/Anonymity.jpg" style="display:block" width="100" height="100%"></a></td>

<!--  개인시간표   -->
<td height="80"><a href="./index.jsp?ID=<%= ID%>&passwd=<%=passwd %>&page=./Timetable.jsp?ID=<%= ID%>&passwd=<%=passwd %>">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfNCAg/MDAxNDgxMjg0NDk5NTk5.UL12XL7a_vSkKBcUdu-76inUlCsyvOxORbpiOQP_FTYg.0JjgFgxU8r8x8e_YJJ2ulwH-BkRL2mdrIhzRsYP7EzYg.JPEG.double_k2/Person.jpg"  style="display:block" width="100" height="100%"></a></td>

<!--  그룹찾기   -->
<td height="80"><a href="./index.jsp?ID=<%= ID%>&passwd=<%=passwd %>&page=./Timetable_Group.jsp?ID=<%= ID%>&passwd=<%=passwd%>">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfMTc1/MDAxNDgxMjg0MzExNzQ4.4Ps3hNaZaeg-VQ8HKnMRFQoyAIvWsin0fos9VqgvgAUg.-wB5gsQ98vtLEqA5vsqQH9kv7UA2_Q5PbPsB0WS4S10g.JPEG.double_k2/Group.jpg" style="display:block" width="100" height="100%"></a></td>

<!--  그룹시간표  -->
<td height="80"><a href="./index.jsp?ID=<%= ID%>&passwd=<%=passwd %>&page=./SelectGroup.jsp?ID=<%= ID%>&passwd=<%=passwd%>">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfNTkg/MDAxNDgxMjg0NTcwMzQ1.6I_0fnli0Sd1dF3_9Qld980uvy_2MyXCqHttAT91kuog.ll5XnFeAP8UUsq49igenMRvw7Wau-edtNozfgqItwvwg.JPEG.double_k2/GroupTable.jpg" style="display:block" width="100" height="100%">
</a></td></tr>

<!-- Left -->
<tr><td width="15%"  height="500" align=right valign=top bgcolor="#f1f1f1"><br><jsp:include page="./left.jsp?ID=<%= ID%>&passwd=<%=passwd %>"/></td>
   
<!-- Center -->
<td width="85" height="700" align=center valign=top colspan=4><jsp:include page="<%=pagefile%>"/></td></tr>

   
<!--  bottom -->
<tr><td width="100%"  colspan=5  height="40" ><jsp:include page="bottom.jsp"/></td></tr>
</table></body></html>
