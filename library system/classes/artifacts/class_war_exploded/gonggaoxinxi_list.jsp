<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��֪�餻</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gbk"></script>
  </head>


  <body >
  <p>�F�ڤΤ�֪�餻��</p>
  <form name="form1" id="form1" method="post" action="">
      ����:  �����ȥ룺<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  ���<input name="fenlei" type="text" id="fenlei" style='border:solid 1px #000000; color:#666666' size="12" />  ���ʥ��󥵩`��<input name="tianjiaren" type="text" id="tianjiaren" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="��������" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='gonggaoxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">����</td>
    <td bgcolor='#CCFFFF'>�����ȥ�</td>
    <td bgcolor='#CCFFFF'>���</td>
    
    <td bgcolor='#CCFFFF'>���ʥ��󥵩`</td>
    
	
    <td width="138" align="center" bgcolor="CCFFFF">׷�ӕr�g</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"gonggaoxinxi"); 
    String url = "gonggaoxinxi_list.jsp?1=1";
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
    <td width="60" align="center"><a href="gonggaoxinxi_updt.jsp?id=<%=map.get("id")%>">��������</a>  <a href="gonggaoxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('�������������ޤ�����')">��������</a> <a href="gonggaoxinxi_detail.jsp?id=<%=map.get("id")%>">Ԕ��</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

