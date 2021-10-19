<%@ page language="java" import="dao.CommDAO" pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>¥Ð¥Ã¥¯¥¢¥Ã¥×</title>


</head>

<body>
<%
 
if (request.getSession().getAttribute("cx").equals("¹ÜÀíÕß"))
{

String sql="";
  sql="backup database jsptemp to disk='D:/jsptemp.dat'";
	  	
new CommDAO().commOper(sql); 
out.print("<script>alert('succeed!!£¬Your database is backup to D:/jsptemp.dat');location.href='sy.jsp';</script>");
  	  
}
else
{
out.print("<script>alert('Sorry you don not have such permission');location.href='sy.jsp';</script>");
}

 %>
  </body>
</html>


