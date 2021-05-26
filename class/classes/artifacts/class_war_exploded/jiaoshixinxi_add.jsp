<%@ page language="java" import="dao.CommDAO" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="java.util.HashMap"%>
<html>
<head>

    <title>教室情報</title>

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
	document.location.href="jiaoshixinxi_add.jsp?id=<%=id%>";
}
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

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){


ext.put("issh","否");



}
new CommDAO().insert(request,response,"jiaoshixinxi",ext,true,false,""); 
%>

  <body >
 <form  action="jiaoshixinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  教室情報を追加する:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">情報番号：</td><td><input name='xinxibianhao' type='text' id='xinxibianhao' value='<%=Info.getID()%>'
                                                  onblur='' style='border:solid 1px #000000; color:#666666'/></td>
        </tr>
       <tr>
           <td width="200">建物番号：</td>
           <td><input name='louhao' type='text' id='louhao' value='' onblur='checkform()'
                      style='border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabellouhao'/></td>
       </tr>
       <tr>
           <td width="200">フロア番号：</td>
           <td><input name='cenghao' type='text' id='cenghao' value='' onblur='checkform()'
                      style='border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelcenghao'/></td>
       </tr>
       <tr>
           <td width="200">教室番号：</td>
           <td><input name='jiaoshihao' type='text' id='jiaoshihao' value='' onblur='checkform()'
                      style='border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabeljiaoshihao'/></td>
       </tr>
       <tr>
           <td width="200">座席番号：</td>
           <td><input name='zuoweihao' type='text' id='zuoweihao' value='' onblur='checkform()'
                      style='border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelzuoweihao'/></td>
       </tr>
       <tr>
           <td>状態：</td>
           <td><select name='zhuangtai' id='zhuangtai'>
               <option value="空">空</option>
               <option value="利用されている">利用されている</option>
           </select></td>
       </tr>

       <tr>
           <td>&nbsp;</td>
           <td><input type="submit" name="Submit" value="submit" style='border:solid 1px #000000; color:#666666'/>
               <input type="reset" name="Submit2" value="reset" style='border:solid 1px #000000; color:#666666'/></td>
       </tr>
   </table>
 </form>

  </body>
</html>


<script language=javascript src='js/ajax.js'></script>

<script language=javascript>

    function checkform() {

        var louhaoobj = document.getElementById("louhao");
        if (louhaoobj.value == "") {
            document.getElementById("clabellouhao").innerHTML = "&nbsp;&nbsp;<font color=red>建物番号を入れてください</font>";
            return false;
        } else {
            document.getElementById("clabellouhao").innerHTML = "  ";
        }
        var cenghaoobj = document.getElementById("cenghao");
        if (cenghaoobj.value == "") {
            document.getElementById("clabelcenghao").innerHTML = "&nbsp;&nbsp;<font color=red>フロア番号を入れてください</font>";
            return false;
        } else {
            document.getElementById("clabelcenghao").innerHTML = "  ";
        }
        var jiaoshihaoobj = document.getElementById("jiaoshihao");
        if (jiaoshihaoobj.value == "") {
            document.getElementById("clabeljiaoshihao").innerHTML = "&nbsp;&nbsp;<font color=red>教室番号を入れてください</font>";
            return false;
        } else {
            document.getElementById("clabeljiaoshihao").innerHTML = "  ";
        }
        var zuoweihaoobj = document.getElementById("zuoweihao");
        if (zuoweihaoobj.value == "") {
            document.getElementById("clabelzuoweihao").innerHTML = "&nbsp;&nbsp;<font color=red>座席番号を入れてください</font>";
            return false;
        } else {
            document.getElementById("clabelzuoweihao").innerHTML = "  ";
        }


        return true;
    }

    popheight = 450;
</script>  


