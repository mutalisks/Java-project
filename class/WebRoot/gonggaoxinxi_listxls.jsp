<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=gonggaoxinxi.xls");
%>
<html>
  <head>
    <title>��֪�餻</title>
  </head>

  <body >
  <p>�F�ڤΤ�֪�餻��</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">����</td>
    <td bgcolor='#CCFFFF'>�����ȥ�</td>
    <td bgcolor='#CCFFFF'>���</td>
    
    <td bgcolor='#CCFFFF'>���ʥ��󥵩`</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">׷�ӕr�g</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "gonggaoxinxi_list.jsp?1=1"; 
    String sql =  "select * from gonggaoxinxi where 1=1";
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
    <td><%=map.get("biaoti") %></td>
    <td><%=map.get("fenlei") %></td>
    
    <td><%=map.get("tianjiaren") %></td>
    
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

