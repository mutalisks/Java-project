<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>云眭日六及復庲</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"gonggaoxinxi");
     %>
  云眭日六及復庲:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>Titleㄩ</td><td width='39%'><%=m.get("biaoti")%></td>
<td width='11%'>Categoryㄩ</td><td width='39%'><%=m.get("fenlei")%></td></tr><tr>
<td width='11%'>Contextㄩ</td><td width='39%'><%=m.get("neirong")%></td>
<td width='11%'>Announcerㄩ</td><td width='39%'><%=m.get("tianjiaren")%></td>
</tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=�齯� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=皿伉件玄允月 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


