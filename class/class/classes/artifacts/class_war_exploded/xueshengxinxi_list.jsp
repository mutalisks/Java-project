<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>学生情報</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>現在の学生情報：</p>
  <form name="form1" id="form1" method="post" action="">
   検索:  学籍番号：<input name="xuehao" type="text" id="xuehao" style='border:solid 1px #000000; color:#666666' size="12" />  氏名：<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666' size="12" /> 性别：<select name='xingbie' id='xingbie' style='border:solid 1px #000000; color:#666666;'><option value="">未知</option><option value="男">男</option><option value="女">女</option></select>  学部：<input name="yuanxi" type="text" id="yuanxi" style='border:solid 1px #000000; color:#666666' size="12" />  学科：<input name="zhuanye" type="text" id="zhuanye" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='xueshengxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">番号</td>
    <td bgcolor='#CCFFFF'>学籍番号</td>
    <td bgcolor='#CCFFFF'>パスワード</td>
    <td bgcolor='#CCFFFF'>氏名</td>
    <td bgcolor='#CCFFFF' width='40' align='center'>性別</td>
    <td bgcolor='#CCFFFF'>学部</td>
    <td bgcolor='#CCFFFF'>学科</td>
    <td bgcolor='#CCFFFF'>携帯電話</td>
    
	
    <td width="138" align="center" bgcolor="CCFFFF">追加時間</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"xueshengxinxi"); 
    String url = "xueshengxinxi_list.jsp?1=1"; 
    String sql =  "select * from xueshengxinxi where 1=1";
	
if(request.getParameter("xuehao")=="" ||request.getParameter("xuehao")==null ){}else{sql=sql+" and xuehao like '%"+request.getParameter("xuehao")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
if(request.getParameter("xingbie")=="" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+request.getParameter("xingbie")+"%'";}
if(request.getParameter("yuanxi")=="" ||request.getParameter("yuanxi")==null ){}else{sql=sql+" and yuanxi like '%"+request.getParameter("yuanxi")+"%'";}
if(request.getParameter("zhuanye")=="" ||request.getParameter("zhuanye")==null ){}else{sql=sql+" and zhuanye like '%"+request.getParameter("zhuanye")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("xuehao") %></td>
    <td><%=map.get("mima") %></td>
    <td><%=map.get("xingming") %></td>
    <td align='center'><%=map.get("xingbie") %></td>
    <td><%=map.get("yuanxi") %></td>
    <td><%=map.get("zhuanye") %></td>
    <td><%=map.get("shouji") %></td>
    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="xueshengxinxi_updt.jsp?id=<%=map.get("id")%>">修正する</a>  <a href="xueshengxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">削除する</a> <a href="xueshengxinxi_detail.jsp?id=<%=map.get("id")%>">詳細</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

