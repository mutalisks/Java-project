<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�������</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"��", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"��";
	}
}
</script>

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"jiaoshixinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"jiaoshixinxi"); 

%>
  <form  action="jiaoshixinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  ����������������:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>��󷬺ţ�</td><td><input name='xinxibianhao' type='text' id='xinxibianhao' value='<%= mmm.get("xinxibianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���﷬�ţ�</td><td><input name='louhao' type='text' id='louhao' value='<%= mmm.get("louhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�ե����ţ�</td><td><input name='cenghao' type='text' id='cenghao' value='<%= mmm.get("cenghao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���ҷ��ţ�</td><td><input name='jiaoshihao' type='text' id='jiaoshihao' value='<%= mmm.get("jiaoshihao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>��ϯ���ţ�</td><td><input name='zuoweihao' type='text' id='zuoweihao' value='<%= mmm.get("zuoweihao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>״�B��</td><td><select name='zhuangtai' id='zhuangtai'><option value="��">��</option><option value="���ä���Ƥ���">���ä���Ƥ���</option></select></td></tr><script language="javascript">document.form1.zhuangtai.value='<%=mmm.get("zhuangtai")%>';</script>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="submit" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="reset" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


