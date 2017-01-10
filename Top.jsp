<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
session.getAttribute("ID");
session.getAttribute("passwd");
session.setMaxInactiveInterval(60*60);  
%>

<table border="1">
<tr><td>
<font color = "#000000" style='letter-spacing:0px'>
<a href="./index.jsp?page=./Memo_write.jsp?ID=<%= ID%>&passwd=<%=passwd %>">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfMzMg/MDAxNDgxMjg0NDE4MzEy.2pN3RMpoiyRD8iB4ApkodXN9E0tFdhBXyKoBEyt-newg.bYAnsB8Pzw-hxsoCLEWBYFEtHc4Nf-d0Sp5QYbXSCugg.JPEG.double_k2/Anonymity.jpg" style="magin-bottom:-5px"  width="100" height="100%">
</a></font></td><td>
<a href="./index.jsp?page=./Timetable.jsp?ID=<%= ID%>&passwd=<%=passwd %>">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfNCAg/MDAxNDgxMjg0NDk5NTk5.UL12XL7a_vSkKBcUdu-76inUlCsyvOxORbpiOQP_FTYg.0JjgFgxU8r8x8e_YJJ2ulwH-BkRL2mdrIhzRsYP7EzYg.JPEG.double_k2/Person.jpg"  width="100" height="100%">
</a></td><td>
<a href="/Timetable/index.jsp?page=/chap10/boardB/boardBlist">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfMTc1/MDAxNDgxMjg0MzExNzQ4.4Ps3hNaZaeg-VQ8HKnMRFQoyAIvWsin0fos9VqgvgAUg.-wB5gsQ98vtLEqA5vsqQH9kv7UA2_Q5PbPsB0WS4S10g.JPEG.double_k2/Group.jpg"  width="100" height="100%">
</a></td><td>
<a href="/Timetable/index.jsp?page=/chap10/boardB/boardBlist">
<img src="http://blogfiles.naver.net/MjAxNjEyMDlfNTkg/MDAxNDgxMjg0NTcwMzQ1.6I_0fnli0Sd1dF3_9Qld980uvy_2MyXCqHttAT91kuog.ll5XnFeAP8UUsq49igenMRvw7Wau-edtNozfgqItwvwg.JPEG.double_k2/GroupTable.jpg"  width="100" height="100%">
</a></td></tr>




</table>
