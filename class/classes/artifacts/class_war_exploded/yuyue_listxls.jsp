<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=yuyue.xls");
%>
<html>
  <head>
    <title>��s</title>
  </head>

  <body >
  <p>�F�ڤ���s״�r��</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">����</td>
    <td bgcolor='#CCFFFF'>��s����</td>
    <td bgcolor='#CCFFFF'>��󷬺�</td>
    <td bgcolor='#CCFFFF'>���﷬��</td>
    <td bgcolor='#CCFFFF'>�ե�����</td>
    <td bgcolor='#CCFFFF'>���ҷ���</td>
    <td bgcolor='#CCFFFF'>��ϯ����</td>
    <td bgcolor='#CCFFFF' width='95' align='center'>��s�r�g</td>
    <td bgcolor='#CCFFFF'>ѧ������</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>Я���Ԓ</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">׷�ӕr�g</td>
    

  </tr>
  <%
    String url = "yuyue_list.jsp?1=1"; 
    String sql =  "select * from yuyue where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("yuyuedanhao") %></td>
    <td><%=map.get("xinxibianhao") %></td>
    <td><%=map.get("louhao") %></td>
    <td><%=map.get("cenghao") %></td>
    <td><%=map.get("jiaoshihao") %></td>
    <td><%=map.get("zuoweihao") %></td>
    <td><%=map.get("yuyueshijian") %></td>
    <td><%=map.get("xuehao") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("shouji") %></td>
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
All <%=i %> items
  </body>
</html>

