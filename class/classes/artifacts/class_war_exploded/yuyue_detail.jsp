<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��s�δ_�J</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"yuyue");
     %>
  ��s�δ_�J:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>��s���ţ�</td><td width='39%'><%=m.get("yuyuedanhao")%></td>
<td width='11%'>��󷬺ţ�</td><td width='39%'><%=m.get("xinxibianhao")%></td></tr><tr>
<td width='11%'>���﷬�ţ�</td><td width='39%'><%=m.get("louhao")%></td>
<td width='11%'>�ե����ţ�</td><td width='39%'><%=m.get("cenghao")%></td></tr><tr>
<td width='11%'>���ҷ��ţ�</td><td width='39%'><%=m.get("jiaoshihao")%></td>
<td width='11%'>��ϯ���ţ�</td><td width='39%'><%=m.get("zuoweihao")%></td></tr><tr>
<td width='11%'>��s�r�g��</td><td width='39%'><%=m.get("yuyueshijian")%></td>
<td width='11%'>ѧ�����ţ�</td><td width='39%'><%=m.get("xuehao")%></td></tr><tr>
<td width='11%'>������</td><td width='39%'><%=m.get("xingming")%></td>
<td width='11%'>Я���Ԓ��</td><td width='39%'><%=m.get("shouji")%></td>
</tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=�ץ��Ȥ��� onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


