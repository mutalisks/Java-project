<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<html>
  <head>
    
    <title>パスワードの変更</title><link rel="stylesheet" href="css.css" type="text/css">
    

  </head>

<script>
function check()
{
	if(document.form1.ymm.value==="")
	{
		alert("現在のパスワード");
		document.form1.ymm.focus();
		return false;
	}
	if(document.form1.xmm1.value==="")
	{
		alert("あたらしいパスワード");
		document.form1.xmm1.focus();
		return false;
	}
	if(document.form1.xmm2.value==="")
	{
		alert("あたらしいパスワード(確認用)");
		document.form1.xmm2.focus();
		return false;
	}
	if (document.form1.xmm1.value!==document.form1.xmm2.value)
	{
		alert("パスワードは一致していません");
		document.form1.xmm1.value="";
		document.form1.xmm2.value="";
		document.form1.xmm1.focus();
		return false;
	}
}

</script>
<script type="text/javascript">
<!--


<%
//out.print(Info.getadminUser(request).get("id").toString());
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("現在のパスワードが間違っています");
<%}%>


<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("変更成功しました");
<%}%>
 
 //-->
</script>
  <body >
    <form action="jspmkyzxjszwglxtdzkf10?ac=uppass" name="form1" method="post">
    <table width="32%" height="126" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="9DC9FF" style="border-collapse:collapse">
    <tr>
      <td colspan="2"><div align="center">パスワードを変更</div></td>
    </tr>
    <tr>
      <td>現在のパスワード：</td>
      <td><input name="ymm" type="text" id="ymm" /></td>
    </tr>
    <tr>
      <td>あたらしいパスワード：</td>
      <td><input name="xmm1" type="password" id="xmm1" /></td>
    </tr>
    <tr>
      <td>あたらしいパスワード(確認用)：</td>
      <td><input name="xmm2" type="password" id="xmm2" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input name="Submit" type="submit"  onClick="return check()" value="confirm" />
        <input name="Submit2" type="reset" value="reset" /></td>
      </tr>
  </table>
  </form>
  </body>
</html>


