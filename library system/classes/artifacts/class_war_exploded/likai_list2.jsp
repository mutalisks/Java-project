<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>����</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>����״�r��</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ��s���ţ�<input name="yuyuedanhao" type="text" id="yuyuedanhao" style='border:solid 1px #000000; color:#666666' size="12" />  ��󷬺ţ�<input name="xinxibianhao" type="text" id="xinxibianhao" style='border:solid 1px #000000; color:#666666' size="12" />  ѧ�����ţ�<input name="xuehao" type="text" id="xuehao" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">����</td>
    <td bgcolor='#CCFFFF'>��s����</td>
    <td bgcolor='#CCFFFF'>��󷬺�</td>
    <td bgcolor='#CCFFFF'>���﷬��</td>
    <td bgcolor='#CCFFFF'>�ե�����</td>
    <td bgcolor='#CCFFFF'>���ҷ���</td>
    <td bgcolor='#CCFFFF'>��ϯ����</td>
    <td bgcolor='#CCFFFF'>�⤹ԭ��</td>
    <td bgcolor='#CCFFFF'>ѧ������</td>
    <td bgcolor='#CCFFFF'>����</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">׷�ӕr�g</td>
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
 <% 
  	


  	 new CommDAO().delete(request,"likai"); 
    String url = "likai_list2.jsp?1=1"; 
    String sql =  "select * from likai where xuehao='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("yuyuedanhao")=="" ||request.getParameter("yuyuedanhao")==null ){}else{sql=sql+" and yuyuedanhao like '%"+request.getParameter("yuyuedanhao")+"%'";}
if(request.getParameter("xinxibianhao")=="" ||request.getParameter("xinxibianhao")==null ){}else{sql=sql+" and xinxibianhao like '%"+request.getParameter("xinxibianhao")+"%'";}
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
 <td><%=map.get("likaiyuanyin") %></td>
 <td><%=map.get("xuehao") %></td>
 <td><%=map.get("xingming") %></td>
 
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="likai_updt.jsp?id=<%=map.get("id")%>">��������</a>  <a href="likai_list2.jsp?scid=<%=map.get("id") %>" onclick="return confirm('�������������ޤ�����')">��������</a> <!--qiatnalijne--> </td>
  </tr>
  	<%
  }
   %>
</table><br>
  
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

