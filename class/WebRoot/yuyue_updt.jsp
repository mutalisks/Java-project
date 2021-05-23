<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>予約</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"yuyue",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"yuyue"); 

%>
  <form  action="yuyue_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  予約を修正する:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>予約番号：</td><td><input name='yuyuedanhao' type='text' id='yuyuedanhao' value='<%= mmm.get("yuyuedanhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>情報番号：</td><td><input name='xinxibianhao' type='text' id='xinxibianhao' value='<%= mmm.get("xinxibianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>建物番号：</td><td><input name='louhao' type='text' id='louhao' value='<%= mmm.get("louhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>フロア番号：</td><td><input name='cenghao' type='text' id='cenghao' value='<%= mmm.get("cenghao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>教室番号：</td><td><input name='jiaoshihao' type='text' id='jiaoshihao' value='<%= mmm.get("jiaoshihao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>座席番号：</td><td><input name='zuoweihao' type='text' id='zuoweihao' value='<%= mmm.get("zuoweihao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>予約番号：</td><td><input name='yuyueshijian' type='text' id='yuyueshijian' value='<%= mmm.get("yuyueshijian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>学籍番号：</td><td><input name='xuehao' type='text' id='xuehao' value='<%= mmm.get("xuehao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>氏名：</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>携帯電話：</td><td><input name='shouji' type='text' id='shouji' value='<%= mmm.get("shouji")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="submit" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="reset" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


