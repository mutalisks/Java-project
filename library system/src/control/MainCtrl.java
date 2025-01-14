package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


import util.Info;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
	this.doPost(request, response);
	}

		public void go(String url,HttpServletRequest request, HttpServletResponse response)
		{
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		}
		
		public void gor(String url,HttpServletRequest request, HttpServletResponse response)
		{
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ac = request.getParameter("ac");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		if(ac.equals("login"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("pwd1");
			String utype = request.getParameter("cx");
			String pagerandom = request.getParameter("pagerandom")==null?"":request.getParameter("pagerandom");
			String random = (String)request.getSession().getAttribute("random");
			if(!pagerandom.equals(random)&&request.getParameter("a")!=null)
			{
				request.setAttribute("random", "");
				go("/index.jsp", request, response);
			}
			else{
				String sql1;
				if (utype.equals("注册用户"))
				{
					sql1 = "select * from yonghuzhuce where yonghuming='"+username+"' and mima='"+password+"' and issh='是'";
				}
				else
				{
					sql1 = "select * from yuangongxinxi where gonghao='"+username+"' and mima='"+password+"'"; 
				}
			List<HashMap<String, String>> userlist1 = dao.select(sql1);
			if(userlist1.size()==1)
			{
				if (utype.equals("注册用户"))
				{
					request.getSession(). setAttribute("username", userlist1.get(0).get("yonghuming"));  
				}
				else
				{
					request.getSession(). setAttribute("username", userlist1.get(0).get("gonghao"));  
				}
				request.getSession(). setAttribute("cx", utype);  
				gor("index.jsp", request, response);
			}else{
				request.setAttribute("error", "");
				go("/index.jsp", request, response);
			}
			}
		}
		
		if(ac.equals("adminlogin"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("pwd");
			String utype = request.getParameter("cx");
			String pagerandom = request.getParameter("pagerandom")==null?"":request.getParameter("pagerandom");
			String random = (String)request.getSession().getAttribute("random");
			if(!pagerandom.equals(random)&&request.getParameter("a")!=null)
			{
				request.setAttribute("random", "");
				go("/login.jsp", request, response);
			}
			else{
			String sql1="";
				if (utype.equals("学生"))
				{
					sql1 = "select * from xueshengxinxi where xuehao='"+username+"' and mima='"+password+"' "; 
				
				}
				else
				{
					sql1 = "select * from allusers where username='"+username+"' and pwd='"+password+"'"; 
				}
			List<HashMap<String, String>> userlist1 = dao.select(sql1);
			if(userlist1.size()==1)
			{
			if (utype.equals("学生"))
				{
					request.getSession(). setAttribute("username", userlist1.get(0).get("xuehao"));  
					
					request.getSession(). setAttribute("cx", utype); 
				}
				else
				{
					request.getSession(). setAttribute("username", userlist1.get(0).get("username"));  
				request.getSession(). setAttribute("cx",  userlist1.get(0).get("cx")); 
				}
				gor("main.jsp", request, response);
			}else{
				request.setAttribute("error", "");
				go("/login.jsp", request, response);
			}
			}
		}
		
		//修改密码
		if(ac.equals("uppass"))
		{
			String olduserpass = request.getParameter("ymm");
			String userpass = request.getParameter("xmm1");
			HashMap<String,String> m = dao.getmaps("yonghuming",(String)request.getSession().getAttribute("username"), "yonghuzhuce");
			if(!(m.get("mima").equals(olduserpass)))
			{
				request.setAttribute("error", "");
			}else{
			String sql = "update yonghuzhuce set mima='"+userpass+"' where yonghuming='"+(String)request.getSession().getAttribute("username")+"'";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			}
			go("mod2.jsp", request, response);
		}
		 
		 //修改密码
		if(ac.equals("adminuppass"))
		{
			String olduserpass = request.getParameter("ymm");
			String userpass = request.getParameter("xmm1");
			String copyuserpass = request.getParameter("xmm2");
			HashMap<String,String> m = dao.getmaps("username",(String)request.getSession().getAttribute("username"), "allusers");
			
			if(!((m.get("pwd")).equals(olduserpass)))
			{
				request.setAttribute("error", "");
			}else{
			//String id = (String)user.get("id");
			String sql = "update allusers set pwd='"+userpass+"' where username='"+(String)request.getSession().getAttribute("username")+"'";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			}
			go("mod.jsp", request, response);
		}
		 
		
		if(ac.equals("uploaddoc"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gb2312");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

				filename = getString(request, filename);
			}
			
			go("/js/uploaddoc.jsp?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		
		if(ac.equals("uploaddoc2"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gb2312");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

				filename = getString(request, filename);
			}
			
			go("/js/uploaddoc2.jsp?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		
		if(ac.equals("uploaddoc3"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gbk");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

				filename = getString(request, filename);
			}
			
			go("/js/uploaddoc3.jsp?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		//导excel
		if(ac.equals("importexcel"))
		{
			String page = request.getParameter("page");
			String whzdstr = request.getParameter("whzdstr");
			String tablename = request.getParameter("tablename");
			try {
				String filename="";
			request.setCharacterEncoding("gb2312");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

				filename = getString(request, filename);

				if(filename.contains(".xls"))
				{
					Workbook workbook;
					try {
						workbook = Workbook.getWorkbook(new File(request.getRealPath("/upfile/")+"/"+filename));
		               //通过Workbook的getSheet方法选择第一个工作簿（从0开始）
						Sheet sheet = workbook.getSheet(0); 
		               //通过Sheet方法的getCell方法选择位置为C2的单元格（两个参数都从0开始）
						//int empty = 0;
						for(int i=1;i<1000;i++)
						{
							Cell cell = null;
							try{
								StringBuilder isql = new StringBuilder("insert into " + tablename + "(");
								
								for(String str:whzdstr.split("-"))
								{ 
									isql.append(str).append(",");
								}
								isql = new StringBuilder(isql.substring(0, isql.length() - 1));
								isql.append(")values(");
								
								int j=0;
								int empty = 1;
								for(String str:whzdstr.split("-"))
								{
								cell = sheet.getCell(j,i); 
								isql.append("'").append(cell.getContents()).append("',");
								String content = cell.getContents()==null?"":cell.getContents();
								if(!"".equals(content.trim()))
								{
									empty = 0;
								}
								j++;
								}
								if(empty==1)continue;
								isql = new StringBuilder(isql.substring(0, isql.length() - 1));
								isql.append(")");
								dao.commOper(isql.toString());
							}catch (Exception ignored) {
							}
						    
						 } 
						 workbook.close(); 
		            } catch (Exception e) {
						e.printStackTrace();
					} 
                  }
			}
			go("/admin/"+page+"?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	  

		if(ac.equals("uploadimg"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gb2312");
			RequestContext  requestContext = new ServletRequestContext(request);
				filename = getString(request, filename, requestContext);

				go("/js/uploadimg.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		if(ac.equals("uploadimg2"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gb2312");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

				filename = getString(request, filename);
			}
			
			go("/js/uploadimg2.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		if(ac.equals("uploadimg3"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gb2312");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

				filename = getString(request, filename);
			}
			
			go("/js/uploadimg3.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		if(ac.equals("uploadimg4"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gb2312");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){
				filename = getFactory(request, filename);
			}
			go("/js/uploadimg4.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		if(ac.equals("uploadimg5"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("gbk");
			RequestContext  requestContext = new ServletRequestContext(request);
				filename = getString(request, filename, requestContext);

				go("/js/uploadimg5.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		
		dao.close();
		out.flush();
		out.close();
	}

	private String getFactory(HttpServletRequest request, String filename) throws FileUploadException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(100*1024*1024);
		List items;

		items = upload.parseRequest(request);

		FileItem fileItem = (FileItem) items.get(0);
		filename = getString2(request, filename, fileItem);
		return filename;
	}

	private String getString(HttpServletRequest request, String filename, RequestContext requestContext) throws FileUploadException {
		if(FileUpload.isMultipartContent(requestContext)){

		   DiskFileItemFactory factory = new DiskFileItemFactory();
		   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
		   ServletFileUpload upload = new ServletFileUpload(factory);
		   upload.setSizeMax(100*1024*1024);
		   List items;

			 items = upload.parseRequest(request);

			FileItem fileItem = (FileItem) items.get(0);
			filename = getString(request, filename, fileItem);
		}
		return filename;
	}

	private String getString2(HttpServletRequest request, String filename, FileItem fileItem) {
		if(fileItem.getName()!=null && fileItem.getSize()!=0)
		 {
		 if(fileItem.getName()!=null && fileItem.getSize()!=0){
			 filename = getString(request, fileItem);
		 }
		 }
		return filename;
	}

	private String getString(HttpServletRequest request, FileItem fileItem) {
		String filename;
		File fullFile = new File(fileItem.getName());
		filename = Info.generalFileName(fullFile.getName());
		File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
		try {
		 fileItem.write(newFile);
		} catch (Exception e) {
		 e.printStackTrace();
		}
		return filename;
	}

	private String getString(HttpServletRequest request, String filename, FileItem fileItem) {
		if(fileItem.getName()!=null && fileItem.getSize()!=0) {
			if (fileItem.getName() != null && fileItem.getSize() != 0) {
				filename = getString(request, fileItem);
			}
		}
		return filename;
	}

	private String getString(HttpServletRequest request, String filename) throws FileUploadException {
		filename = getFactory(request, filename);
		return filename;
	}


	public void init() throws ServletException {

	}
}
