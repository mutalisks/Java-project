<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�������</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>�F�ڤν���״�r��</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ���﷬�ţ�<input name="louhao" type="text" id="louhao" style='border:solid 1px #000000; color:#666666' size="12" />  �ե����ţ�<input name="cenghao" type="text" id="cenghao" style='border:solid 1px #000000; color:#666666' size="12" />  ���ҷ��ţ�<input name="jiaoshihao" type="text" id="jiaoshihao" style='border:solid 1px #000000; color:#666666' size="12" />  ��ϯ���ţ�<input name="zuoweihao" type="text" id="zuoweihao" style='border:solid 1px #000000; color:#666666' size="12" /> Status��<select name='zhuangtai' id='zhuangtai' style='border:solid 1px #000000; color:#666666;'><option value="">All</option><option value="��">��</option><option value="���ä���Ƥ���">���ä���Ƥ���</option></select>
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="��������" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='jiaoshixinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">Number</td>
    <td bgcolor='#CCFFFF'>��󷬺�</td>
    <td bgcolor='#CCFFFF'>���﷬��</td>
    <td bgcolor='#CCFFFF'>�ե�����</td>
    <td bgcolor='#CCFFFF'>���ҷ���</td>
    <td bgcolor='#CCFFFF'>��ϯ����</td>
    <td bgcolor='#CCFFFF'>״�B</td>
    <td style="display:none" bgcolor='#CCFFFF' width='80' align='center'>Censor</td>
	
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"jiaoshixinxi"); 
    String url = "jiaoshixinxi_list1.jsp?1=1"; 
    String sql =  "select * from jiaoshixinxi where zhuangtai='��'";
	
if(request.getParameter("louhao")=="" ||request.getParameter("louhao")==null ){}else{sql=sql+" and louhao like '%"+request.getParameter("louhao")+"%'";}
if(request.getParameter("cenghao")=="" ||request.getParameter("cenghao")==null ){}else{sql=sql+" and cenghao like '%"+request.getParameter("cenghao")+"%'";}
if(request.getParameter("jiaoshihao")=="" ||request.getParameter("jiaoshihao")==null ){}else{sql=sql+" and jiaoshihao like '%"+request.getParameter("jiaoshihao")+"%'";}
if(request.getParameter("zuoweihao")=="" ||request.getParameter("zuoweihao")==null ){}else{sql=sql+" and zuoweihao like '%"+request.getParameter("zuoweihao")+"%'";}
if(request.getParameter("zhuangtai")=="" ||request.getParameter("zhuangtai")==null ){}else{sql=sql+" and zhuangtai like '%"+request.getParameter("zhuangtai")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("xinxibianhao") %></td>
    <td><%=map.get("louhao") %></td>
    <td><%=map.get("cenghao") %></td>
    <td><%=map.get("jiaoshihao") %></td>
    <td><%=map.get("zuoweihao") %></td>
    <td><%=map.get("zhuangtai") %></td>
    <td style="display:none"  align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=jiaoshixinxi" onClick="return confirm('Are you sure to do that��')"><%=map.get("issh")%></a></td>
	
    <td width="60" align="center"><a href="yuyue_add.jsp?id=<%=map.get("id")%>">reserve</a>  </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

