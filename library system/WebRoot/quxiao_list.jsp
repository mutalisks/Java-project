<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>キャンセル</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gbk"></script>
  </head>


  <body >
  <p>�F壓のキャンセル��</p>
  <form name="form1" id="form1" method="post" action="">
   �碧�:  嚠�s桑催��<input name="yuyuedanhao" type="text" id="yuyuedanhao" style='border:solid 1px #000000; color:#666666' size="12" />  秤�鷏�催��<input name="xinxibianhao" type="text" id="xinxibianhao" style='border:solid 1px #000000; color:#666666' size="12" />  恙朗桑催��<input name="zuoweihao" type="text" id="zuoweihao" style='border:solid 1px #000000; color:#666666' size="12" />  僥催��<input name="xuehao" type="text" id="xuehao" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="�碧�" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="��き竃す" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='quxiao_listxls.jsp';" />
</form>

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
    
    <td width="60" align="center" bgcolor="CCFFFF">荷恬</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"quxiao"); 
    String url = "quxiao_list.jsp?1=1"; 
    String sql =  "select * from quxiao where 1=1";

    if(request.getParameter("yuyuedanhao")=="" ||request.getParameter("yuyuedanhao")==null ){}else{sql=sql+" and yuyuedanhao like '%"+request.getParameter("yuyuedanhao")+"%'";}
    if(request.getParameter("xinxibianhao")=="" ||request.getParameter("xinxibianhao")==null ){}else{sql=sql+" and xinxibianhao like '%"+request.getParameter("xinxibianhao")+"%'";}
    if(request.getParameter("zuoweihao")=="" ||request.getParameter("zuoweihao")==null ){}else{sql=sql+" and zuoweihao like '%"+request.getParameter("zuoweihao")+"%'";}
    if(request.getParameter("xuehao")=="" ||request.getParameter("xuehao")==null ){}else{sql=sql+" and xuehao like '%"+request.getParameter("xuehao")+"%'";}
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
    <td><%=map.get("xuehao") %></td>
    <td><%=map.get("xingming") %></td>
    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="quxiao_updt.jsp?id=<%=map.get("id")%>">俐屎する</a>  <a href="quxiao_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('云輝に��茅しますか��')">��茅する</a> <!--qiatnalijne--> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

