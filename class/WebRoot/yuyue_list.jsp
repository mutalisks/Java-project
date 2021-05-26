<jsp:useBean id="page" scope="request" type="com.sun.media.sound.DLSSample"/>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>予約</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>現在の予約状況：</p>
  <form name="form1" id="form1" method="post" action="">
   検索:  予約番号：<input name="yuyuedanhao" type="text" id="yuyuedanhao" style='border:solid 1px #000000; color:#666666' size="12" />  フロア番号：<input name="cenghao" type="text" id="cenghao" style='border:solid 1px #000000; color:#666666' size="12" />  教室番号：<input name="jiaoshihao" type="text" id="jiaoshihao" style='border:solid 1px #000000; color:#666666' size="12" />  座位号：<input name="zuoweihao" type="text" id="zuoweihao" style='border:solid 1px #000000; color:#666666' size="12" />  学籍番号：<input name="xuehao" type="text" id="xuehao" style='border:solid 1px #000000; color:#666666' size="12" />  氏名：<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="検索" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="書き出す" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='yuyue_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">番号</td>
    <td bgcolor='#CCFFFF'>予約番号</td>
    <td bgcolor='#CCFFFF'>情報番号</td>
    <td bgcolor='#CCFFFF'>建物番号</td>
    <td bgcolor='#CCFFFF'>フロア番号</td>
    <td bgcolor='#CCFFFF'>教室番号</td>
    <td bgcolor='#CCFFFF'>座席番号</td>
    <td bgcolor='#CCFFFF' width='95' align='center'>予約時間</td>
    <td bgcolor='#CCFFFF'>学籍番号</td>
    <td bgcolor='#CCFFFF'>氏名</td>
    <td bgcolor='#CCFFFF'>携帯電話</td>
    
	
    <td width="138" align="center" bgcolor="CCFFFF">追加時間</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"yuyue"); 
    String url = "yuyue_list.jsp?1=1"; 
    String sql =  "select * from yuyue where 1=1";
	
if(request.getParameter("yuyuedanhao")=="" ||request.getParameter("yuyuedanhao")==null ){}else{sql=sql+" and yuyuedanhao like '%"+request.getParameter("yuyuedanhao")+"%'";}
if(request.getParameter("cenghao")=="" ||request.getParameter("cenghao")==null ){}else{sql=sql+" and cenghao like '%"+request.getParameter("cenghao")+"%'";}
if(request.getParameter("jiaoshihao")=="" ||request.getParameter("jiaoshihao")==null ){}else{sql=sql+" and jiaoshihao like '%"+request.getParameter("jiaoshihao")+"%'";}
if(request.getParameter("zuoweihao")=="" ||request.getParameter("zuoweihao")==null ){}else{sql=sql+" and zuoweihao like '%"+request.getParameter("zuoweihao")+"%'";}
if(request.getParameter("xuehao")=="" ||request.getParameter("xuehao")==null ){}else{sql=sql+" and xuehao like '%"+request.getParameter("xuehao")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("yuyuedanhao") %></td>
    <td><%=map.get("xinxibianhao") %></td>
    <td><%=map.get("louhao") %></td>
    <td><%=map.get("cenghao") %></td>
    <td><%=map.get("jiaoshihao") %></td>
    <td><%=map.get("zuoweihao") %></td>
    <td><%=map.get("yuyueshijian") %></td>
    <td><%=map.get("xuehao") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("shouji") %></td>
    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="yuyue_updt.jsp?id=<%=map.get("id")%>">修正</a>  <a href="yuyue_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('本当に削除しますか')">削除する</a> <a href="yuyue_detail.jsp?id=<%=map.get("id")%>">詳細</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

