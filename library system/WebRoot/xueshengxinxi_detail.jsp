<%@ page language="java" import="dao.CommDAO" pageEncoding="gbk"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
    <title>ѧ�����δ_�J</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

</head>

<body>
<%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"xueshengxinxi");
     %>
  ѧ�����δ_�J:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>ѧ�����ţ�</td><td width='39%'><%=m.get("xuehao")%></td>
<td width='11%'>�ѥ���`�ɣ�</td><td width='39%'><%=m.get("mima")%></td></tr><tr>
<td width='11%'>������</td><td width='39%'><%=m.get("xingming")%></td>
<td width='11%'>�Ԅe��</td><td width='39%'><%=m.get("xingbie")%></td></tr><tr>
<td width='11%'>ѧ����</td><td width='39%'><%=m.get("yuanxi")%></td>
<td width='11%'>ѧ�ƣ�</td><td width='39%'><%=m.get("zhuanye")%></td></tr><tr>
<td width='11%'>Я���Ԓ��</td><td width='39%'><%=m.get("shouji")%></td>
<td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=�ץ��Ȥ��� onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


