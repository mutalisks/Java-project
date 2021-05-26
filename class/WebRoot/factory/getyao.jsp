<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%
String blno = request.getParameter("blno")==null?"":request.getParameter("blno"); 
String isyb = new CommDAO().select("select * from bl where blno='"+blno+"'").get(0).get("isyb").toString();
  
StringBuilder select = new StringBuilder("@@@");
	
	if(isyb.equals("否")){
	for(HashMap permap:new CommDAO().select("select * from yaopin")){ 
	 String optionstr = "";
     select.append(permap.get("yname")).append(" - 单价:").append(permap.get("price")).append("@@@");
	}
	}else{
	for(HashMap permap:new CommDAO().select("select * from yaopin where isyb='是'")){ 
	 String optionstr = "";
     select.append(permap.get("yname")).append(" - 单价:").append(permap.get("ybprice")).append("@@@");
	}
	}
	
	
	
	
 if(select.length()>3)select.substring(0,select.length()-3).trim();
 
out.print(select.toString());
  
 
%>