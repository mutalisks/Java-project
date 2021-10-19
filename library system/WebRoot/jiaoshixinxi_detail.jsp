<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>教室情報の確認</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"jiaoshixinxi");
     %>
  教室情報の確認:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>Classroom Information Detail：</td><td width='39%'><%=m.get("xinxibianhao")%></td>
<td width='11%'>Building Number：</td><td width='39%'><%=m.get("louhao")%></td></tr><tr>
<td width='11%'>Floor Number：</td><td width='39%'><%=m.get("cenghao")%></td>
<td width='11%'>Classroom Number：</td><td width='39%'><%=m.get("jiaoshihao")%></td></tr><tr>
<td width='11%'>Seat Number：</td><td width='39%'><%=m.get("zuoweihao")%></td>
<td width='11%'>Status：</td><td width='39%'><%=m.get("zhuangtai")%></td>
</tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=戻る onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=プリントする onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


