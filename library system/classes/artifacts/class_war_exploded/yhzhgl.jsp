<%@ page language="java" import="dao.CommDAO" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="java.util.HashMap"%>
<%
if(request.getSession().getAttribute("username")==null )
{
	
	out.print("<script>javascript:alert('すみません、タイムアウトしました��');window.close();</script>");
	out.close();
}
else
{
	if(request.getSession().getAttribute("cx").equals("砿尖宀"))
	{}
	else
	{
		out.print("<script>javascript:alert('すみません、あなたはその�慙泙�隔っていません');history.back();</script>");
		out.close();
	}

}
%>
<html>
  <head>
    
    <title>砿尖宀ユ�`ザ砿尖</title><link rel="stylesheet" href="css.css" type="text/css">
    

  </head>

<%
 new CommDAO().delete(request,"allusers"); 

HashMap ext = new HashMap(); 

ext.put("cx","砿尖宀");
new CommDAO().insert(request,response,"allusers",ext,true,false,""); 
%>

  <body >
<form  action="yhzhgl.jsp?f=f"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
     <tr>
      <td width="200">ユ�`ザ��</td>
      <td><input name="username" type="text" id="username" onblur='checkform()' /> <label id='clabelusername' />
      *</td>
    </tr>
    <tr>
      <td width="200">パスワ�`ド��</td>
      <td><input name="pwd" type="password" id="pwd" onblur='checkform()' /> <label id='clabelpwd' />
      *</td>
    </tr>
    <tr>
      <td width="200">パスワ�`ドの�_�J��</td>
      <td><input name="pwd2" type="password" id="pwd2" onblur='checkform()' /> <label id='clabelpwd2' />
      *</td>
    </tr>
    <tr>
      <td width="200">&nbsp;</td>
      <td><input name="Submit" type="submit"   value="submit" />
      <input name="Submit2" type="reset"  value="reset" /></td>
    </tr>
  </table>
</form>
<p>�F壓の砿尖宀��</p>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td bgcolor="A4B6D7">桑催</td>
    <td bgcolor="A4B6D7">ログイン兆</td>
    <td bgcolor="A4B6D7">パスワ�`ド</td>
    <td bgcolor="A4B6D7">�慙�</td>
    <td bgcolor="A4B6D7">弖紗�r�g</td>
    <td bgcolor="A4B6D7">荷恬</td>
  </tr>
  <%
				int i=0;						
    for(HashMap map:new CommDAO().select("select * from allusers order by id desc ")){
	i++;
     %>
  <tr>
    <td><%=i %></td>
    <td><%=map.get("username") %></td>
    <td><%=map.get("pwd") %></td>
    <td><%=map.get("cx") %></td>
    <td><%=map.get("addtime") %></td>
    <td><a href="yhzhgl.jsp?scid=<%=map.get("id") %>" onClick="return confirm('云輝に��茅しますか��')">��茅する</a></td>
  </tr>
  <%}%>
</table>
  </body>
</html>

<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='js/popup.js'></script>
<script language=javascript src='js/ajax.js'></script>
<script language=javascript>

    function checkform() {
        var usernameobj = document.getElementById("username");
        if (usernameobj.value == "") {
            document.getElementById("clabelusername").innerHTML = "&nbsp;&nbsp;<font color=red>ログイン兆を秘れてください</font>";
            return false;
        } else {
            document.getElementById("clabelusername").innerHTML = "  ";
        }

        var usernameobj = document.getElementById("username");
        if (usernameobj.value != "") {
            var ajax = new AJAX();
            ajax.post("factory/checkno.jsp?table=allusers&col=username&value=" + usernameobj.value + "&checktype=insert&ttime=<%=Info.getDateStr()%>")
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelusername").innerHTML="&nbsp;&nbsp;<font color=red>ログイン兆は屡に贋壓しています</font>";
return false;
}else{document.getElementById("clabelusername").innerHTML="  ";  
}  
}  
var pwdobj = document.getElementById("pwd");  
if(pwdobj.value==""){  
document.getElementById("clabelpwd").innerHTML="&nbsp;&nbsp;<font color=red>パスワ�`ドを秘れてください</font>";
return false;  
}else{
document.getElementById("clabelpwd").innerHTML="  ";  
}  

var pwd2obj = document.getElementById("pwd2");  
if(pwd2obj.value==""){  
document.getElementById("clabelpwd2").innerHTML="&nbsp;&nbsp;<font color=red>壅びにパスワ�`ドを秘れてください</font>";
return false;  
}else{
document.getElementById("clabelpwd2").innerHTML="  ";  
}

if(pwd2obj.value!=pwdobj.value){  
document.getElementById("clabelpwd2").innerHTML="&nbsp;&nbsp;<font color=red>屈つのパスワ�`ドが匯崑していません</font>";
return false;  
}else{
document.getElementById("clabelpwd2").innerHTML="  ";  
}
 
  



return true;   
}   
popheight=450;
</script>  


