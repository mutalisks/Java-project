<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>軑廣</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gbk"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id;
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"jiaoshixinxi");
 String xinxibianhao="";
  	String louhao="";
  	String cenghao="";
  	String jiaoshihao="";
  	String zuoweihao="";
  	
 xinxibianhao=(String)mlbdq.get("xinxibianhao");
  	louhao=(String)mlbdq.get("louhao");
  	cenghao=(String)mlbdq.get("cenghao");
  	jiaoshihao=(String)mlbdq.get("jiaoshihao");
  	zuoweihao=(String)mlbdq.get("zuoweihao");
  	 
 

 HashMap mssdq = new CommDAO().getmaps("xuehao",(String)request.getSession().getAttribute("username"),"xueshengxinxi");
 String xingming="";
  	String shouji="";
  	
 xingming=(String)mssdq.get("xingming");
  	shouji=(String)mssdq.get("shouji");
  	
   %>
   
   <%
  
String sql3=  "select * from yuyue where xinxibianhao='"+request.getParameter("xinxibianhao")+"' and yuyueshijian='"+request.getParameter("yuyueshijian")+"'";
CommDAO dao = new CommDAO();
  List<HashMap<String, String>> userlist1 = dao.select(sql3);

  if(userlist1.size()==1)
{
	out.print("<script>alert('允心引六氏﹜仇及釱炟反公及�r嶲匹軑廣今木化中引仄凶');location.href='sy.jsp';</script>");
	return;
}


   %>



<script language="javascript">

function gow()
{
	document.location.href="yuyue_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"˙", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"˙";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){



String tt="update jiaoshixinxi set zhuangtai='軑廣' where xinxibianhao='"+xinxibianhao+"' ";

 new CommDAO().commOper(tt);



}
new CommDAO().insert(request,response,"yuyue",ext,true,false,""); 
%>

  <body >
 <form  action="yuyue_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  軑廣毛袚樓允月:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">軑廣楓瘍ㄩ</td><td><input name='yuyuedanhao' type='text' id='yuyuedanhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr><td  width="200">①�騝牯籟�</td><td><input name='xinxibianhao' type='text' id='xinxibianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.xinxibianhao.value='<%=xinxibianhao%>';document.form1.xinxibianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">膘昜楓瘍ㄩ</td><td><input name='louhao' type='text' id='louhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.louhao.value='<%=louhao%>';document.form1.louhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">白伕失楓瘍ㄩ</td><td><input name='cenghao' type='text' id='cenghao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cenghao.value='<%=cenghao%>';document.form1.cenghao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">諒弅楓瘍ㄩ</td><td><input name='jiaoshihao' type='text' id='jiaoshihao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.jiaoshihao.value='<%=jiaoshihao%>';document.form1.jiaoshihao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">釱炟楓瘍ㄩ</td><td><input name='zuoweihao' type='text' id='zuoweihao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.zuoweihao.value='<%=zuoweihao%>';document.form1.zuoweihao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">軑廣楓瘍ㄩ</td><td><input name='yuyueshijian' type='text' id='yuyueshijian' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">悝戮楓瘍ㄩ</td><td><input name='xuehao' type='text' id='xuehao' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">庌靡ㄩ</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">觓�㏑���ㄩ</td><td><input name='shouji' type='text' id='shouji' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.shouji.value='<%=shouji%>';
   document.form1.shouji.setAttribute("readOnly", 'true');</script>

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


        return true;
    }

    popheight = 450;
</script>  


