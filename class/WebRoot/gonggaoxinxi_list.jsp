<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>お知らせ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gbk"></script>
  </head>


  <body >
  <p>現在のお知らせ：</p>
  <form name="form1" id="form1" method="post" action="">
      検索:  タイトル：<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  分類：<input name="fenlei" type="text" id="fenlei" style='border:solid 1px #000000; color:#666666' size="12" />  アナウンサー：<input name="tianjiaren" type="text" id="tianjiaren" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="検索" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="書き出す" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='gonggaoxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">番号</td>
    <td bgcolor='#CCFFFF'>タイトル</td>
    <td bgcolor='#CCFFFF'>分類</td>
    
    <td bgcolor='#CCFFFF'>アナウンサー</td>
    
	
    <td width="138" align="center" bgcolor="CCFFFF">追加時間</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"gonggaoxinxi"); 
    String url = "gonggaoxinxi_list.jsp?1=1";
    String sql =  "select * from gonggaoxinxi where 1=1";
	
if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql+" and biaoti like '%"+request.getParameter("biaoti")+"%'";}
if(request.getParameter("fenlei")=="" ||request.getParameter("fenlei")==null ){}else{sql=sql+" and fenlei like '%"+request.getParameter("fenlei")+"%'";}
if(request.getParameter("tianjiaren")=="" ||request.getParameter("tianjiaren")==null ){}else{sql=sql+" and tianjiaren like '%"+request.getParameter("tianjiaren")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request);
	int i=0;
	for(HashMap map:list){ 
	i++;


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("biaoti") %></td>
    <td><%=map.get("fenlei") %></td>
    
    <td><%=map.get("tianjiaren") %></td>
    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="gonggaoxinxi_updt.jsp?id=<%=map.get("id")%>">修正する</a>  <a href="gonggaoxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('本当に削除しますか？')">削除する</a> <a href="gonggaoxinxi_detail.jsp?id=<%=map.get("id")%>">詳細</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

