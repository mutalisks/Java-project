<%@ page contentType="text/html;charset=gbk" language="java" import="com.jspsmart.upload.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
%>
<%
    
    String newFile1Name=null;
    String file_name=null;
    
	SmartUpload mySmartUpload = new SmartUpload();

	//��ʼ���ϴ�
	mySmartUpload.initialize(pageContext);

	//ֻ�������ش����ļ�
	try 
	{
		mySmartUpload.upload();
	} 
	catch (Exception e)
    {
		return;
	}
	
	try 
	{
		   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		   if (myFile.isMissing())
		   {
			  out.println("<script language=javascript>alert('д����x��Ǥ���������');   history.back(-1);</script>");
			  return;

		   } 
		   else 
		   {
			   int file_size = myFile.getSize();
			   file_name=myFile.getFileName();
			   System.out.println("��������"+file_size+"��ǰ��"+file_name);

                   newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
	               System.out.println("�����餷���ե��������ǰ��"+newFile1Name);
				
				   String saveurl = request.getSession().getServletContext().getRealPath("upload");
				
				   saveurl = saveurl+"/"+newFile1Name;
				   myFile.saveAs(saveurl, SmartUpload.SAVE_PHYSICAL);

			} 
	  } 
	  catch (Exception e)
	  {
	    e.toString();
	  }
%>

<script language="javascript">

    var str=location.toString();
    var Result=((((str.split('?'))[1]).split('='))[1]);
	//window.opener.Form1(Result).focus();	
	window.parent.document.getElementById(Result).value="upload/<%= newFile1Name%>";					

    
	//window.opener=null;
	document.write("���åץ�`�ɳɹ�");
    //window.close();

</script> 