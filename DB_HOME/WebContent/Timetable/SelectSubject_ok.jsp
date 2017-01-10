<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<form name=SelectSubject method="./index.jsp?page=./Timetable.jsp">
<body>
<%
String ID= request.getParameter("ID");
String passwd= request.getParameter("passwd");
String MemName= request.getParameter("MemName");
session.setAttribute("ID", ID);
session.setAttribute("passwd", passwd);
session.setMaxInactiveInterval(60*60); 
	String sSub = request.getParameter("sSub");
	String sTe = request.getParameter("sTe");
	String sDay = request.getParameter("sDay");
	
	request.setAttribute("ID", ID);
	request.setAttribute("passwd",passwd);
	
	%>
	<input type="text" name="ID"value="<%= ID %>" style="display:none" >
	<input type="text" name="passwd"value="<%= passwd %>" style="display:none">
	<input type="text" name="sSub"value="<%= sSub %>" style="display:none">
	<input type="text" name="sTe"value="<%= sTe %>" style="display:none">
	<input type="text" name="sDay"value="<%= sDay %>" style="display:none">
	<input type="text" name="sDay"value="<%= MemName %>" style="display:none">
		<%
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionURL = "jdbc:sqlserver://117.16.244.162:1433;databaseName=201101677;user=201101677;password=201101677";
				    Connection con = DriverManager.getConnection(connectionURL);
				    Statement stmt = con.createStatement();
				    ResultSet rs = null;
				    ResultSet rs2 = null;
				    String SQL= "insert into [201101677].dbo.Timetable_Person(MemID,MemName,교과목명,교수명,요일) values(";
				    SQL = SQL + "'" + ID + "' ,";
				    SQL = SQL + "'" + MemName + "' ,";
				    SQL = SQL + "'" + sSub + "' ,";
				    SQL = SQL + "'" + sTe + "' ,";
				    SQL = SQL + "'" + sDay + "')";
				    String SQL2 = "select * from [201101677].dbo.Timetable_Person where MemID = '"+ID+"' order by Num ASC";
				    rs = stmt.executeQuery(SQL2);
				    if (rs.next()) {
				    	rs = stmt.executeQuery(SQL2);
				    	while (rs.next()) {
				    		
					
					String[] rDay = sDay.split(",");
					String dbDay = rs.getString("요일");
					String dbID = rs.getString("MemID");
					String[] dDay = dbDay.split(",");
					String dbSub= rs.getString("교과목명");
					

				 	
				 	if (dbID.equals(ID)) {
						if (rDay[0].equals(dDay[0])&& (rDay[1].equals(dDay[1]) || rDay[1].equals(dDay[2]) || rDay[1].equals(dDay[3]))) {
								%>
								
				<input type="text" name="ID" value="<%=ID%>" style="display: none">
				<input type="text" name="passwd" value="<%=passwd%>" style="display: none">
				<input type="text" name="sSub" value="<%=sSub%>" style="display: none">
				<input type="text" name="sTe" value="<%=sTe%>" style="display: none">
				<input type="text" name="sDay" value="<%=sDay%>" style="display: none">
				<center><h>시간이 중복됩니다.</h><br><a href="./index.jsp?page=./Timetable.jsp?ID=<%=ID%>&passwd=<%=passwd%>">시간표로 다시가기</a></center><%
							break;
							}

							else if (rDay[0].equals(dDay[0])&&(rDay[2].equals(dDay[1]) || rDay[2].equals(dDay[2]) || rDay[2].equals(dDay[3]))) {%>
							
				<input type="text" name="ID" value="<%=ID%>" style="display: none">
				<input type="text" name="passwd" value="<%=passwd%>" style="display: none">
				<input type="text" name="sSub" value="<%=sSub%>" style="display: none">
				<input type="text" name="sTe" value="<%=sTe%>" style="display: none">
				<input type="text" name="sDay" value="<%=sDay%>" style="display: none">
				
							<center><h>시간이 중복됩니다.</h><br><a href="./index.jsp?page=./Timetable.jsp&ID=<%=ID%>&passwd=<%=passwd%>">시간표로 다시가기</a></center><%
							break;
							}
							
							else if (rDay[0].equals(dDay[0])&&(rDay[3].equals(dDay[1]) || rDay[3].equals(dDay[2]) || rDay[3].equals(dDay[3]))) {%>
							
				<input type="text" name="ID" value="<%=ID%>" style="display: none">
				<input type="text" name="passwd" value="<%=passwd%>" style="display: none">
				<input type="text" name="sSub" value="<%=sSub%>" style="display: none">
				<input type="text" name="sTe" value="<%=sTe%>" style="display: none">
				<input type="text" name="sDay" value="<%=sDay%>" style="display: none">
				
							<center><h>시간이 중복됩니다.</h><br><a href="./index.jsp?page=./Timetable.jsp&ID=<%=ID%>&passwd=<%=passwd%>">시간표로 다시가기</a></center><%
							break;
							} 
							
							else if(!rDay[0].equals(dDay[0])&&(!rDay[2].equals(dDay[1]) || !rDay[2].equals(dDay[2]) || !rDay[2].equals(dDay[3])))
							{%>
							
				<input type="text" name="ID" value="<%=ID%>" style="display: none">
				<input type="text" name="passwd" value="<%=passwd%>" style="display: none">
				<input type="text" name="sSub" value="<%=sSub%>" style="display: none">
				<input type="text" name="sTe" value="<%=sTe%>" style="display: none">
				<input type="text" name="sDay" value="<%=sDay%>" style="display: none">
				
							<center><h>시간이 입력되었습니다.</h><br><a href="./index.jsp?page=./Timetable.jsp&ID=<%=ID%>&passwd=<%=passwd%>">시간표로 다시가기</a></center><%
								stmt.executeUpdate(SQL);
								response.sendRedirect("./index.jsp?page=./Timeteble.jsp&ID=" + ID + "&passwd=" + passwd);
								rs2 = stmt.executeQuery(SQL2);
								break;
							}
						}
					rs = stmt.executeQuery(SQL2);
					
					}
				    	
				}
			else {%>
				<input type="text" name="ID" value="<%=ID%>" style="display: none">
				<input type="text" name="passwd" value="<%=passwd%>" style="display: none">
				<input type="text" name="sSub" value="<%=sSub%>" style="display: none">
				<input type="text" name="sTe" value="<%=sTe%>" style="display: none">
				<input type="text" name="sDay" value="<%=sDay%>" style="display: none">
				
			<center><h>시간이 입력되었습니다.</h><br><a href="./index.jsp?page=./Timetable.jsp&ID=<%=ID%>&passwd=<%=passwd%>">시간표로 다시가기</a></center><%
				stmt.executeUpdate(SQL);
				response.sendRedirect("./index.jsp?page=./Timeteble.jsp&ID=" + ID + "&passwd=" + passwd);
				}
			stmt.close();
			con.close();
		%>
	</body>
</form>
</html>