<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=quxiao.xls");
%>
<html>
  <head>
    <title>キャンセル</title>
  </head>

  <body >
  <p>�F壓のキャンセル��</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">桑催</td>
    <td bgcolor='#CCFFFF'>嚠�s桑催</td>
    <td bgcolor='#CCFFFF'>秤�鷏�催</td>
    <td bgcolor='#CCFFFF'>秀麗桑催</td>
    <td bgcolor='#CCFFFF'>フロア桑催</td>
    <td bgcolor='#CCFFFF'>縮片桑催</td>
    <td bgcolor='#CCFFFF'>恙朗桑催</td>
    <td bgcolor='#CCFFFF'>僥汐桑催</td>
    <td bgcolor='#CCFFFF'>箆兆</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">弖紗�r�g</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "quxiao_list.jsp?1=1"; 
    String sql =  "select * from quxiao where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("yuyuedanhao") %></td>
    <td><%=map.get("xinxibianhao") %></td>
    <td><%=map.get("louhao") %></td>
    <td><%=map.get("cenghao") %></td>
    <td><%=map.get("jiaoshihao") %></td>
    <td><%=map.get("zuoweihao") %></td>
    <td><%=map.get("xuehao") %></td>
    <td><%=map.get("xingming") %></td>
    
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

