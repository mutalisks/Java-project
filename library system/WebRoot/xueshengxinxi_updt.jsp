<%@ page language="java" import="dao.CommDAO" pageEncoding="gbk"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
  <title>ѧ�����</title>

  <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  <script type="text/javascript" src="js/popup.js"></script>
  <LINK href="css.css" type=text/css rel=stylesheet>

</head>
<script language="javascript">

  function hsgxia2shxurxu(nstr, nwbk) {
    if (eval("form1." + nwbk).value.indexOf(nstr) >= 0) {
      eval("form1." + nwbk).value = eval("form1." + nwbk).value.replace(nstr + "��", "");
    } else {
      eval("form1." + nwbk).value = eval("form1." + nwbk).value + nstr + "��";
    }
  }
</script>

<body>
<%

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"xueshengxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"xueshengxinxi"); 

%>
  <form  action="xueshengxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  ѧ��������������:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>ѧ�����ţ�</td><td><input name='xuehao' type='text' id='xuehao' value='<%= mmm.get("xuehao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�ѥ���`�ɣ�</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>������</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�Ԅe��</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=mmm.get("xingbie")%>';</script>
     <tr><td>ѧ����</td><td><input name='yuanxi' type='text' id='yuanxi' value='<%= mmm.get("yuanxi")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>ѧ�ƣ�</td><td><input name='zhuanye' type='text' id='zhuanye' value='<%= mmm.get("zhuanye")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>Я���Ԓ��</td><td><input name='shouji' type='text' id='shouji' value='<%= mmm.get("shouji")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="submit" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="reset" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


