<%@ page language="java" import="dao.CommDAO" pageEncoding="gbk"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
  <title>学生情報</title>

  <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  <script type="text/javascript" src="js/popup.js"></script>
  <LINK href="css.css" type=text/css rel=stylesheet>

</head>
<script language="javascript">

  function hsgxia2shxurxu(nstr, nwbk) {
    if (eval("form1." + nwbk).value.indexOf(nstr) >= 0) {
      eval("form1." + nwbk).value = eval("form1." + nwbk).value.replace(nstr + "；", "");
    } else {
      eval("form1." + nwbk).value = eval("form1." + nwbk).value + nstr + "；";
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
  学生情報を修正する:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>学籍番号：</td><td><input name='xuehao' type='text' id='xuehao' value='<%= mmm.get("xuehao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>パスワード：</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>氏名：</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>性別：</td><td><select name='xingbie' id='xingbie'><option value="男">男</option><option value="女">女</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=mmm.get("xingbie")%>';</script>
     <tr><td>学部：</td><td><input name='yuanxi' type='text' id='yuanxi' value='<%= mmm.get("yuanxi")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>学科：</td><td><input name='zhuanye' type='text' id='zhuanye' value='<%= mmm.get("zhuanye")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
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


