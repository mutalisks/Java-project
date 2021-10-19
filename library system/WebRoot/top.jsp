<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
if(request.getSession().getAttribute("username")==null || request.getSession().getAttribute("username")=="")
{
	out.print("<script>javascript:alert('すみません、タイムアウトしました');window.close();</script>");
	out.close();
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD id=Head1>
<TITLE>无标题页</TITLE><script language="javascript" src="images/qkjs.js"></script>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css> 
*{
	FONT-SIZE: 12px; COLOR: white
}
#logo {
	COLOR: white
}
#logo A {
	COLOR: white
}
FORM {
	MARGIN: 0px
}
</STYLE>

<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY style="BACKGROUND-IMAGE: url(images/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x">

  <DIV id=logo 
style="BACKGROUND-IMAGE: url(images/logo.png); BACKGROUND-REPEAT: no-repeat">
    <DIV 
style="PADDING-RIGHT: 15px; BACKGROUND-POSITION: right 10%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(images/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px; TEXT-ALIGN: right"><span style="PADDING-RIGHT: 2px"><!--<a href="index.jsp" target="_parent">返回首页</a>--> 現在のユーザ：<%=request.getSession().getAttribute("username")%>，権限：<%=request.getSession().getAttribute("cx")%></span><IMG
src="images/menu_seprator.gif" align=absMiddle> <A id=HyperLink3 
href="logout.jsp" target="_parent">Exit</A> </DIV>
    <DIV style="DISPLAY: block; HEIGHT: 54px"></DIV>
    <DIV 
style="BACKGROUND-IMAGE: url(images/bg_nav.gif); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
      <TABLE cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
          <TR>
            <TD>
              <DIV><IMG src="images/nav_pre.gif" align=absMiddle><SPAN
      id=lblBra>自習教室管理システム</SPAN>にいらっしゃいませ!!</DIV>
            </TD>
            <TD align=right width="70%"><SPAN style="PADDING-RIGHT: 50px"><IMG
                    src="images/menu_seprator.gif" align=absMiddle> <SPAN
                    id=clock></SPAN></SPAN></TD>
            </SPAN></TD>
          </TR>
        </TBODY>
      </TABLE>
    </DIV>
  </DIV>

</BODY>
</HTML>

