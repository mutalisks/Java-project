<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>お岑らせ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>お岑らせの�_�J��</p>
  <form name="form1" id="form1" method="post" action="">
   �碧�:  タイトル��<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  蛍����<input name="fenlei" type="text" id="fenlei" style='border:solid 1px #000000; color:#666666' size="12" />  弖紗する繁��<input name="tianjiaren" type="text" id="tianjiaren" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="�碧�" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="��き竃す" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='gonggaoxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">桑催</td>
    <td bgcolor='#CCFFFF'>タイトル</td>
    <td bgcolor='#CCFFFF'>蛍��</td>
    
    <td bgcolor='#CCFFFF'>弖紗する繁</td>
    
	
    <td width="138" align="center" bgcolor="CCFFFF">弖紗�r�g</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">荷恬</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"gonggaoxinxi"); 
    String url = "sy.jsp?1=1"; 
    String sql =  "select * from gonggaoxinxi where 1=1";
	
if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql+" and biaoti like '%"+request.getParameter("biaoti")+"%'";}
if(request.getParameter("fenlei")=="" ||request.getParameter("fenlei")==null ){}else{sql=sql+" and fenlei like '%"+request.getParameter("fenlei")+"%'";}
if(request.getParameter("tianjiaren")=="" ||request.getParameter("tianjiaren")==null ){}else{sql=sql+" and tianjiaren like '%"+request.getParameter("tianjiaren")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("biaoti") %></td>
    <td><%=map.get("fenlei") %></td>
    
    <td><%=map.get("tianjiaren") %></td>
    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"> <a href="gonggaoxinxi_detail.jsp?id=<%=map.get("id")%>">����</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

