<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��֪�餻�δ_�J</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"gonggaoxinxi");
     %>
  ��֪�餻�δ_�J:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>Title��</td><td width='39%'><%=m.get("biaoti")%></td>
<td width='11%'>Category��</td><td width='39%'><%=m.get("fenlei")%></td></tr><tr>
<td width='11%'>Context��</td><td width='39%'><%=m.get("neirong")%></td>
<td width='11%'>Announcer��</td><td width='39%'><%=m.get("tianjiaren")%></td>
</tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=�ץ��Ȥ��� onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


