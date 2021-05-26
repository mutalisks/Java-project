<%@ page language="java" import="dao.CommDAO" pageEncoding="gbk"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
    <title>学生情報の確認</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

</head>

<body>
<%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"xueshengxinxi");
     %>
  学生情報の確認:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>学籍番号：</td><td width='39%'><%=m.get("xuehao")%></td>
<td width='11%'>パスワード：</td><td width='39%'><%=m.get("mima")%></td></tr><tr>
<td width='11%'>氏名：</td><td width='39%'><%=m.get("xingming")%></td>
<td width='11%'>性別：</td><td width='39%'><%=m.get("xingbie")%></td></tr><tr>
<td width='11%'>学部：</td><td width='39%'><%=m.get("yuanxi")%></td>
<td width='11%'>学科：</td><td width='39%'><%=m.get("zhuanye")%></td></tr><tr>
<td width='11%'>携帯電話：</td><td width='39%'><%=m.get("shouji")%></td>
<td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=戻る onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=プリントする onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


