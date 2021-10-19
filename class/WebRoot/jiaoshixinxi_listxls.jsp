<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=jiaoshixinxi.xls");
%>
<html>
  <head>
    <title>教室情報</title>
  </head>

  <body >
  <p>現在の教室情報：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">番号</td>
    <td bgcolor='#CCFFFF'>情報番号</td>
    <td bgcolor='#CCFFFF'>建物番号</td>
    <td bgcolor='#CCFFFF'>フロア番号</td>
    <td bgcolor='#CCFFFF'>教室番号</td>
    <td bgcolor='#CCFFFF'>座席番号</td>
    <td bgcolor='#CCFFFF'>状態</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>Censor</td>
    <td width="138" align="center" bgcolor="CCFFFF">追加時間</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "jiaoshixinxi_list.jsp?1=1"; 
    String sql =  "select * from jiaoshixinxi where 1=1";
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
    <td><%=map.get("xinxibianhao") %></td>
    <td><%=map.get("louhao") %></td>
    <td><%=map.get("cenghao") %></td>
    <td><%=map.get("jiaoshihao") %></td>
    <td><%=map.get("zuoweihao") %></td>
    <td><%=map.get("zhuangtai") %></td>
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=jiaoshixinxi" onclick="return confirm('この操作を実行しますか？')"><%=map.get("issh")%></a></td>
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

