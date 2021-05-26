<%@ page language="java" import="util.PageManager" pageEncoding="gbk"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=xueshengxinxi.xls");
%>
<html>
  <head>
    <title>学生情報</title>
  </head>

  <body >
  <p>現在の学生状況：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">番号</td>
    <td bgcolor='#CCFFFF'>学籍番号</td>
    <td bgcolor='#CCFFFF'>パスワード</td>
    <td bgcolor='#CCFFFF'>氏名</td>
    <td bgcolor='#CCFFFF' width='40' align='center'>性別</td>
    <td bgcolor='#CCFFFF'>学部</td>
    <td bgcolor='#CCFFFF'>学科</td>
    <td bgcolor='#CCFFFF'>携帯電話</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">追加時間</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "xueshengxinxi_list.jsp?1=1"; 
    String sql =  "select * from xueshengxinxi where 1=1";
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
    <td><%=map.get("xuehao") %></td>
    <td><%=map.get("mima") %></td>
    <td><%=map.get("xingming") %></td>
    <td align='center'><%=map.get("xingbie") %></td>
    <td><%=map.get("yuanxi") %></td>
    <td><%=map.get("zhuanye") %></td>
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

