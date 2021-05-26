<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%> 
<%
String glb = request.getParameter("glb")==null?"":request.getParameter("glb");
String glzd = request.getParameter("glzd")==null?"":request.getParameter("glzd");
String value = request.getParameter("value")==null?"":request.getParameter("value"); 
String ctype = request.getParameter("ctype")==null?"":request.getParameter("ctype");
	String jlzdb = request.getParameter("jlzdb")==null?"":request.getParameter("jlzdb");
String zd = request.getParameter("zd")==null?"":request.getParameter("zd");
System.out.println(ctype+"   ------------------------------------------");
glzd = Info.getGBKStr(glzd);
value = Info.getGBKStr(value);
String insql = value.replaceAll(" ","");
StringBuilder insqld = new StringBuilder();
for(String str:insql.split("-"))
{
if(str.split(":").length==1){
insqld.append(str.trim()).append(",");
}else{
insqld.append(str.split(":")[1].trim()).append(",");
}
}
 
if(insqld.length()>0) insqld = new StringBuilder(insqld.substring(0, insqld.length() - 1));
StringBuilder likesql = new StringBuilder();
for(String str: insqld.toString().split(","))
{
   if(!str.trim().equals(""))
   {
   if(jlzdb.equals("tglparentid")||jlzdb.equals("datashowname"))
   {
   likesql.append(" or tglparentid in( select id from ").append(glb).append(" where datashowname like'%").append(str).append("%' ) ");
   }else{
   likesql.append(" or ").append(jlzdb).append(" like'%").append(str).append("%' ");
   }
   }
   
   
}
String sql = "select * from "+glb+" where 1!=1 "+likesql; 
 
if(ctype.equals("select")){
StringBuilder select = new StringBuilder("@@@");
	for(HashMap permap:new CommDAO().select(sql)){ 
	StringBuilder optionstr = new StringBuilder();
	if(glzd.split(";").length==1){
	optionstr = new StringBuilder(permap.get(glzd.split("~")[0]).toString());
	}else{
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr.append(zdnamestr).append(permap.get(zdstr)).append(" - ");
	} 
	}
	if(optionstr.toString().contains(" - "))
		optionstr = new StringBuilder(optionstr.substring(0, optionstr.length() - 3));
	select.append(optionstr).append("@@@");
	}
 if(select.length()>3)select.substring(0,select.length()-3).trim();
 
out.print(select.toString());
 }
 
 
 if(ctype.equals("text")){
StringBuilder select = new StringBuilder();
	for(HashMap permap:new CommDAO().select(sql)){ 
	StringBuilder optionstr = new StringBuilder();
	if(glzd.split(";").length==1){
	optionstr = new StringBuilder(permap.get(glzd.split("~")[0]).toString());
	}else{
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr.append(zdnamestr).append(permap.get(zdstr)).append(" - ");
	} 
	}
	if(optionstr.indexOf(" - ")>-1) optionstr = new StringBuilder(optionstr.substring(0, optionstr.length() - 3));
	select.append(optionstr).append(" ");
	} 
 
out.print(select.toString().trim());
 }
 
 
 
if(ctype.equals("radio")){
StringBuilder radio = new StringBuilder();
    int dxii = 0;
	for(HashMap permap:new CommDAO().select(sql)){ 
	 String check="";
	 if(dxii==0)check="checked=checked";
	StringBuilder optionstr = new StringBuilder();
	if(glzd.split(";").length==1){
	optionstr = new StringBuilder(permap.get(glzd.split("~")[0]).toString());
	}else{
	
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr.append(zdnamestr).append(permap.get(zdstr)).append(" - ");
	} 
	}
	if(optionstr.indexOf(" - ")>-1) optionstr = new StringBuilder(optionstr.substring(0, optionstr.length() - 3));
	radio.append("<label><input type='radio' name='").append(zd).append("' ").append(check).append(" value=\"").append(optionstr).append("\">").append(optionstr).append("</label>\n");
	 dxii++;
	}
 if(radio.length()>3)radio.substring(0,radio.length()-3).trim();
 
out.print(radio.toString());
 }
 
 
if(ctype.equals("checkbox")){
String checkbox = "";
    int dxii = 0;
	for(HashMap permap:new CommDAO().select(sql)){ 
	 String check="";
	 if(dxii==0)check="checked=checked";
	StringBuilder optionstr = new StringBuilder();
	System.out.println(glzd);
	if(glzd.split(";").length==1){
	optionstr = new StringBuilder(permap.get(glzd.split("~")[0]).toString());
	}else{
	
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr.append(zdnamestr).append(permap.get(zdstr)).append(" - ");
	} 
	}
	if(optionstr.indexOf(" - ")>-1) optionstr = new StringBuilder(optionstr.substring(0, optionstr.length() - 3));
	checkbox+="<label><input type='checkbox' name='"+zd+"' "+check+" value=\""+optionstr+"\">"+optionstr+"</label>\n";
	 dxii++;
	}
	checkbox+="<input type=hidden name='"+zd+"' value='' />";
	checkbox.substring(0,checkbox.length()-3).trim();
 
out.print(checkbox);
 }
 
 
if(ctype.equals("checkboxdk")){
StringBuilder checkbox = new StringBuilder();
  int i=0;
for(HashMap permap:new CommDAO().select(sql)){ 
 
 StringBuilder optionstr = new StringBuilder();
 for(String str:glzd.split(";"))
 {
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr.append(zdnamestr).append(permap.get(zdstr)).append(" - ");
 }
 if(optionstr.length()>0) optionstr = new StringBuilder(optionstr.substring(0, optionstr.length() - 3));
 String nbs = "";
 if(i>0)nbs="&nbsp;";
 checkbox.append("<label>").append(nbs).append("<input type='checkbox' name='").append(zd).append("' value=\"").append(optionstr).append("\">").append(optionstr).append("</label>&nbsp;&nbsp;\n");
 checkbox.append("<label>&nbsp;- 这里要改 &nbsp;<input type='text' size='5' name='").append(optionstr).append("' value=\"\"></label><br />\n");
 i++;
}
checkbox.append("<input type=hidden name='").append(zd).append("' value='' /><input type=hidden name='dk-").append(zd).append("-value' value='这里要改' />");
 
out.print(checkbox.toString());
 }
 
 
%>