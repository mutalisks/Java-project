<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>予約の確認</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"yuyue");
     %>
  予約の確認:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>予約番号：</td><td width='39%'><%=m.get("yuyuedanhao")%></td>
<td width='11%'>情報番号：</td><td width='39%'><%=m.get("xinxibianhao")%></td></tr><tr>
<td width='11%'>建物番号：</td><td width='39%'><%=m.get("louhao")%></td>
<td width='11%'>フロア番号：</td><td width='39%'><%=m.get("cenghao")%></td></tr><tr>
<td width='11%'>教室番号：</td><td width='39%'><%=m.get("jiaoshihao")%></td>
<td width='11%'>座席番号：</td><td width='39%'><%=m.get("zuoweihao")%></td></tr><tr>
<td width='11%'>予約時間：</td><td width='39%'><%=m.get("yuyueshijian")%></td>
<td width='11%'>学籍番号：</td><td width='39%'><%=m.get("xuehao")%></td></tr><tr>
<td width='11%'>氏名：</td><td width='39%'><%=m.get("xingming")%></td>
<td width='11%'>携帯電話：</td><td width='39%'><%=m.get("shouji")%></td>
</tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=戻る onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=プリントする onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


