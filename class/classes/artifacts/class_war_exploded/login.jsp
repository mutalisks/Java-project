<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>自習教室座席管理システム</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
<!--
body {
	background-image: url(images/hsgbg.gif);
}
.STYLE3 {color: #528311; font-size: 12px; }
.STYLE5 {	color: #72AC27;
	font-size: 26pt;
}
.STYLE9 {color: #FFFFFF;font-size:12px}
-->
    </style>
</head>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("ユーザ名またはパスワードが間違っています");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("キャプチャが間違っています");
 <%}%>
 
 popheight = 39;

function check()
{
	if(document.form1.username.value==="" || document.form1.pwd.value==="" || document.form1.pagerandom.value==="")
	{
		alert('完全に入力してください。');
		return false;
	}
}

           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 

           
           </script>     
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="800" height="630" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="134" valign="bottom"><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td height="496" valign="top"><table width="800" height="496" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="246" background="images/hsgbg2.gif"><table width="57%" height="51" border="0" align="center">
          <tr>
            <td><div style="font-family:宋体; color:#FFFFFF;  WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 36px; margin-top:5pt">
                
                  <div align="right">自習教室座席管理システム</div>
               
            </div></td>
          </tr>
        </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="100%" height="112" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="48%">&nbsp;</td>
            <td width="52%"><form action="jspmkyzxjszwglxtdzkf10?ac=adminlogin&a=a" method="post" name="form1" style="display: inline"><table width="205" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="600" height="30"><span class="STYLE9">ログイン名:</span></td>
            <td height="30" colspan="2"><input name="username" type="text" id="username" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
          </tr>
          <tr>
            <td height="30"><span class="STYLE9">パスワード:</span></td>
            <td height="30" colspan="2"><input name="pwd" type="password" id="pwd" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
          </tr>
          <tr>
            <td height="30"><span class="STYLE9">身分:</span></td>
            <td height="30" colspan="2"><select name="cx" id="cx">
                <option value="管理员">管理者</option>
				  <option value="学生">学生</option>
              </select>
            </td>
          </tr>
          <tr>
            <td height="30"><span class="STYLE9">キャプチャ:</span></td>
            <td width="59" height="30"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" />
            <td width="102"><a href="javascript:loadimage();"><img alt="?にくいときここにクリックしてください" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"> </a></td>
          </tr>
          <tr>
            <td height="30" colspan="3"><input type="submit" name="Submit" value="ログイン" onClick="return check();" style="background:url(images/the_formbtn.gif) no-repeat;color:#000000;width:80px;height: 24px; border:0px;line-height:24px; font-size:12px;margin-right: 5px; cursor:pointer">
                <input type="reset" name="Submit2" value="リセット" style="background:url(images/the_formbtn.gif) no-repeat;color:#000000;width:80px;height: 24px; border:0px;line-height:24px; font-size:12px;margin-right: 5px; cursor:pointer" ></td>
          </tr>
        </table> </form></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>



