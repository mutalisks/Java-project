<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>ѧ�����</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="xueshengxinxi_add.jsp?id=<%=id%>";
}
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

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){






}
new CommDAO().insert(request,response,"xueshengxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="xueshengxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ѧ������׷�Ӥ���:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">ѧ�����ţ�</td><td><input name='xuehao' type='text' id='xuehao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelxuehao' /></td></tr>
		<tr><td  width="200">�ѥ���`�ɣ�</td><td><input name='mima' type='text' id='mima' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelmima' /></td></tr>
		<tr><td  width="200">������</td><td><input name='xingming' type='text' id='xingming' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelxingming' /></td></tr>
		<tr><td>�Ԅe��</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select>&nbsp;*<label id='clabelxingbie' /></td></tr>
		<tr><td  width="200">ѧ����</td><td><input name='yuanxi' type='text' id='yuanxi' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelyuanxi' /></td></tr>
		<tr><td  width="200">ѧ�ƣ�</td><td><input name='zhuanye' type='text' id='zhuanye' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelzhuanye' /></td></tr>
		<tr><td  width="200">Я���Ԓ��</td><td><input name='shouji' type='text' id='shouji' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshouji' /></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="submit"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="reset" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>




<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var xuehaoobj = document.getElementById("xuehao"); if(xuehaoobj.value==""){document.getElementById("clabelxuehao").innerHTML="&nbsp;&nbsp;<font color=red>ѧ�����Ť����Ƥ�������</font>";return false;}else{document.getElementById("clabelxuehao").innerHTML="  "; }
	var xuehaoobj = document.getElementById("xuehao");  
if(xuehaoobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=xueshengxinxi&col=xuehao&value="+xuehaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelxuehao").innerHTML="&nbsp;&nbsp;<font color=red>ѧ�����ŤϼȤ˴��ڤ��Ƥ��ޤ�</font>";
return false;
}else{document.getElementById("clabelxuehao").innerHTML="  ";  
}  
} 
	var mimaobj = document.getElementById("mima"); if(mimaobj.value==""){document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>�ѥ���`�ɤ����Ƥ�������</font>";return false;}else{document.getElementById("clabelmima").innerHTML="  "; }
	var xingmingobj = document.getElementById("xingming"); if(xingmingobj.value==""){document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>���������Ƥ�������</font>";return false;}else{document.getElementById("clabelxingming").innerHTML="  "; }
	var xingbieobj = document.getElementById("xingbie"); if(xingbieobj.value==""){document.getElementById("clabelxingbie").innerHTML="&nbsp;&nbsp;<font color=red>�Ԅe�����Ƥ�������</font>";return false;}else{document.getElementById("clabelxingbie").innerHTML="  "; }
	var yuanxiobj = document.getElementById("yuanxi"); if(yuanxiobj.value==""){document.getElementById("clabelyuanxi").innerHTML="&nbsp;&nbsp;<font color=red>ѧ�������Ƥ�������</font>";return false;}else{document.getElementById("clabelyuanxi").innerHTML="  "; }
	var zhuanyeobj = document.getElementById("zhuanye"); if(zhuanyeobj.value==""){document.getElementById("clabelzhuanye").innerHTML="&nbsp;&nbsp;<font color=red>ѧ�Ƥ����Ƥ�������</font>";return false;}else{document.getElementById("clabelzhuanye").innerHTML="  "; }
	var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value==""){document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>Я���Ԓ�����Ƥ�������</font>";return false;}else{document.getElementById("clabelshouji").innerHTML="  "; }
	var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value!=""){ if(/^0[7|8|9][0-9]{9}$/.test(shoujiobj.value)){document.getElementById("clabelshouji").innerHTML=""; }else{document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>������Я���Ԓ�ǤϤ���ޤ���</font>"; return false;}}
    


return true;   
}   
popheight=450;
</script>  


