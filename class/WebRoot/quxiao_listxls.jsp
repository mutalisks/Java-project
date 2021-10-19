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
  <p>現在のキャンセル：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">番号</td>
    <td bgcolor='#CCFFFF'>予約番号</td>
    <td bgcolor='#CCFFFF'>情報番号</td>
    <td bgcolor='#CCFFFF'>建物番号</td>
    <td bgcolor='#CCFFFF'>フロア番号</td>
    <td bgcolor='#CCFFFF'>教室番号</td>
    <td bgcolor='#CCFFFF'>座席番号</td>
    <td bgcolor='#CCFFFF'>学籍番号</td>
    <td bgcolor='#CCFFFF'>氏名</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">追加時間</td>
    

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

