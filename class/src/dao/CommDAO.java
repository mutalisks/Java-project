package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Info;


public class CommDAO
{
	public static String dbname = "";
	public static String dbtype = "";
	
	public static Connection conn = null;
	
	public CommDAO()
	{
		conn = this.getConn();
	}



         //给字段做加减法
	 public void jiajian(String tablename,String colname,String id,String num)
	 {
		 HashMap<String, String> map = this.getmap(id, tablename);
		 String value = map.get(colname);
		 if(value.equals(""))value="0";
		 int i = Integer.parseInt(value);
		 int j = Integer.parseInt(num);
		 commOper("update "+tablename+" set "+colname+" = "+(i+j)+" where id="+id);
	 }
	
	 //	该方法返回一个table 用于流动图片
	public String DynamicImage(String categoryid,int cut,int width,int height){

		StringBuilder imgStr = new StringBuilder();
		StringBuilder thePics1 = new StringBuilder();
		StringBuilder theLinks1 = new StringBuilder();
		StringBuilder theTexts1 = new StringBuilder();
	
		imgStr.append("<div id=picViwer1  style='background-color: #ffffff' align=center></div><SCRIPT src='js/dynamicImage.js' type=text/javascript></SCRIPT>\n<script language=JavaScript>\n");
		thePics1.append("var thePics1=\n'");
		theLinks1.append("var theLinks1='");
		theTexts1.append("var theTexts1='");
		
		List<HashMap<String, String>> co = this.select("select * from xinwentongzhi where shouyetupian<>'' and shouyetupian<>'null'  and shouyetupian  like '%.jpg' order by id desc",1,6);
		int i = co.size();
		
		int j = 0; 
		for(HashMap<String, String> b:co)
		{
			j++;
			String title = Info.subStr(b.get("biaoti").toString(), 21) ;
			String url = ""+b.get("shouyetupian");
			String purl = "gg_detail.jsp?id="+b.get("id");
			if(j!=i){
				thePics1.append(url.replaceAll("\n", "")).append("|");
				theLinks1.append(purl).append("|");
				theTexts1.append(title).append("|");
			}
		if(j==i)
		{
			thePics1.append(url.replaceAll("\n", ""));
			theLinks1.append("gg_detail.jsp?id=").append(b.get("id"));
			theTexts1.append(title);
		}
		
		}
	   thePics1.append("';");
		
		theLinks1.append("';");
		theTexts1.append("';");
		imgStr.append(thePics1).append("\n");
		imgStr.append(theLinks1).append("\n");
		imgStr.append(theTexts1).append("\n");
		imgStr.append("\n setPic(thePics1,theLinks1,theTexts1,").append(width).append(",").append(height).append(",'picViwer1');</script>");
		return imgStr.toString();
	}
	
	 


		public HashMap<String, String> getmap(String id, String table)
		{
			List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
			try {
				Statement st = conn.createStatement();
				//System.out.println("select * from "+table+" where id="+id);
			    ResultSet rs = st.executeQuery("select * from "+table+" where id="+id);
				rsmdGet(list, st, rs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list.get(0);
		}
		
		public HashMap<String, String> getmaps(String nzd, String zdz, String table)
		{
			List<HashMap<String, String>> list = new ArrayList<>();
			try {
				Statement st = conn.createStatement();
				//System.out.println("select * from "+table+" where "+nzd+"='"+zdz+"'");
			    ResultSet rs = st.executeQuery("select * from "+table+" where "+nzd+"='"+zdz+"'");
				rsmdGet(list, st, rs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list.get(0);
		}

	private void rsmdGet(List<HashMap<String, String>> list, Statement st, ResultSet rs) throws SQLException {
		ResultSetMetaData rsmd = rs.getMetaData();
		while(rs.next())
		{
			HashMap<String, String> map = new HashMap<>();
			int i = rsmd.getColumnCount();
			for(int j=1;j<=i;j++)
			{
				if(!rsmd.getColumnName(j).equals("ID"))
				{
					String str = rs.getString(j)==null?"": rs.getString(j);
					if(str.equals("null"))str = "";
					map.put(rsmd.getColumnName(j), str);
				}
				else
					map.put("id", rs.getString(j));
			}
			list.add(map);
		}
		rs.close();
		st.close();
	}


	public String insert(HttpServletRequest request,HttpServletResponse response, String tablename,HashMap extmap,boolean alert,boolean reflush,String tzurl)
		{
			extmap.put("addtime", Info.getDateStr());
			if(request.getParameter("f")!=null){
			HashMap<String, String> typemap = new HashMap<String, String>();
			ArrayList<String> collist = new ArrayList<>();
			StringBuilder sql = new StringBuilder("insert into " + tablename + "(");
			
		 
			Connection conn = this.getConn();
			try {
				Statement st = conn.createStatement();
			    ResultSet rs = st.executeQuery("select * from "+tablename);
			    ResultSetMetaData rsmd = rs.getMetaData();
	            int i = rsmd.getColumnCount();
			    	 
			    	for(int j=1;j<=i;j++)
			    	{
			    	if(rsmd.getColumnName(j).equals("id"))continue;
					if(rsmd.getColumnName(j).equals("ID"))continue;
					if(rsmd.getColumnName(j).equals("iD"))continue;
					if(rsmd.getColumnName(j).equals("Id"))continue;
			    	typemap.put(rsmd.getColumnName(j)+"---", rsmd.getColumnTypeName(j));
			    	collist.add(rsmd.getColumnName(j));
	    	    	sql.append(rsmd.getColumnName(j)).append(",");
			    	}
			    	sql = new StringBuilder(sql.substring(0, sql.length() - 1));
			    
			    sql.append(") values(");
			    rs.close();
			    st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Enumeration<String> enumeration = request.getParameterNames();
			StringBuilder names = new StringBuilder(",");
			while(enumeration.hasMoreElements())
			{
			names.append(enumeration.nextElement()).append(",");
			}
			try {
				Statement st = conn.createStatement();
			    for(String str:collist)
			    {
			    	if(names.toString().contains("," + str + ","))
			    	{
			    		String[] values = request.getParameterValues(str);
			    		StringBuilder value= new StringBuilder();
			    		for(String vstr:values)
			    		{
			    			if(vstr==null)vstr="";
			    			if(vstr.equals("null"))vstr="";
			    			if(vstr.trim().equals(""))continue;
			    			
			    			if(request.getParameter(vstr)!=null&&!"".equals(request.getParameter(vstr))&&request.getParameter("dk-"+str+"-value")!=null)
			    			{
			    				String dkv = request.getParameter(vstr);
			    				String dknamevalue = request.getParameter("dk-"+str+"-value");
			    				vstr+=" - "+dknamevalue+":"+dkv;
			    			}
			    			
			    			value.append(vstr).append(" ~ ");
			    			
			    			
			    			
			    		}
						if(value.toString().equals("null")) value = new StringBuilder();
			    		if(value.length()>0) value = new StringBuilder(value.substring(0, value.length() - 3));
			    		 
			    	    if(typemap.get(str+"---").equals("int"))
			    	    {
			    		sql.append(value.toString().equals("") ? -10 : value.toString()).append(",");
			    	    }else{
			    	    sql.append("'").append(value.toString().equals("null") ? "" : value.toString()).append("',");
			    	    }
			    	}else{
			    		if(typemap.get(str+"---").equals("int"))
			    	    {
			    		sql.append(extmap.get(str) == null ? "" : extmap.get(str)).append(",");
			    	    }else{
			    	    sql.append("'").append(extmap.get(str) == null ? "" : extmap.get(str)).append("',");
			    	    }
			    	}
			    }
			    
			    sql = new StringBuilder(sql.substring(0, sql.length() - 1) + ")");
			    System.out.println(sql);
			    this.commOper(sql.toString());
			  
			    st.close();
			     
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String str = "";
			if(!reflush)
			 str += "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"> \n";
				str = getString(alert, reflush, tzurl, str);

				str+="</script>";
			
			
			PrintWriter wrt = null;
			try {
			wrt = response.getWriter();
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
				assert wrt != null;
				wrt.write(str);
			}
			
			return "";
		}
		
		public void delete(HttpServletRequest request,String tablename)
		{
			
			int i = 0;
			try {
				String did = request.getParameter("did");
				if(did==null)did = request.getParameter("scid");
				if(did!=null){
					if(did.length()>0){
				Statement st = conn.createStatement();
				System.out.println("delete from "+tablename+" where id="+did);
				 st.execute("delete from "+tablename+" where id="+did);
				 st.close();
					}
				}
				 
				   
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}



		public String getCols(String table)
		{
			StringBuilder str = new StringBuilder();
			Connection conn = this.getConn();
			try {
				Statement st = conn.createStatement();
			    ResultSet rs = st.executeQuery("select * from "+table);
			    ResultSetMetaData rsmd = rs.getMetaData();

			    int i = rsmd.getColumnCount();
		    	for(int j=2;j<=i;j++)
		    	{
		    	str.append(rsmd.getColumnName(j)).append(",");
		    	}

			}catch (Exception e) {
				e.printStackTrace();
			}
			str = new StringBuilder(str.substring(0, str.length() - 1));

			return str.toString();
		}


		public String update(HttpServletRequest request,HttpServletResponse response, String tablename,HashMap extmap,boolean alert,boolean reflush,String tzurl)
		{
			if(request.getParameter("f")!=null){
			Enumeration<String> enumeration = request.getParameterNames();
			StringBuilder names = new StringBuilder(",");
			while(enumeration.hasMoreElements())
			{
			names.append(enumeration.nextElement().toString()).append(",");
			}
			HashMap<String, String> typemap = new HashMap<>();
			ArrayList<String> collist = new ArrayList<>();
			StringBuilder sql = new StringBuilder("update " + tablename + " set ");
			Connection conn = this.getConn();
			try {
				Statement st = conn.createStatement();
			    ResultSet rs = st.executeQuery("select * from "+tablename);
			    ResultSetMetaData rsmd = rs.getMetaData();
	            int i = rsmd.getColumnCount();
			    	System.out.println(i);
			    	for(int j=1;j<=i;j++)
			    	{
			    	if(rsmd.getColumnName(j).equals("id"))continue;
					if(rsmd.getColumnName(j).equals("ID"))continue;
					if(rsmd.getColumnName(j).equals("Id"))continue;
					if(rsmd.getColumnName(j).equals("iD"))continue;
			    	typemap.put(rsmd.getColumnName(j)+"---", rsmd.getColumnTypeName(j));
			    	collist.add(rsmd.getColumnName(j));
	    	    	if(names.toString().contains("," + rsmd.getColumnName(j) + ","))
	    	    	{
	    	    		
	    	    		String[] values = request.getParameterValues(rsmd.getColumnName(j));
			    		StringBuilder value= new StringBuilder();
			    		for(String vstr:values)
			    		{
			    			if(vstr==null)vstr="";
			    			if(vstr.equals("null"))vstr="";
			    			if(vstr.trim().equals(""))continue;
			    			
			    			if(request.getParameter(vstr)!=null&&!"".equals(request.getParameter(vstr))&&request.getParameter("dk-"+rsmd.getColumnName(j)+"-value")!=null)
			    			{
			    				String dkv = request.getParameter(vstr);
			    				String dknamevalue = request.getParameter("dk-"+rsmd.getColumnName(j)+"-value");
			    				vstr+=" - "+dknamevalue+":"+dkv;
			    				System.out.println(vstr);
			    			}
			    			value.append(vstr).append(" ~ ");
			    		}
						if(value.toString().equals("null")) value = new StringBuilder();
			    		if(value.length()>0) value = new StringBuilder(value.substring(0, value.length() - 3));
	    	    		
	    	    		if(rsmd.getColumnTypeName(j).equals("int"))
	    	    		{
	    	    		 sql.append(rsmd.getColumnName(j)).append("=").append(value).append(",");
	    	    		}else{
	    	    			 sql.append(rsmd.getColumnName(j)).append("='").append(value).append("',");
	    	    		}
	    	    	}else{
	    	    		if(extmap.get(rsmd.getColumnName(j))!=null)
	    	    		{
	    	    			if(rsmd.getColumnTypeName(j).equals("int"))
	        	    		{
	        	    		 sql.append(rsmd.getColumnName(j)).append("=").append(extmap.get(rsmd.getColumnName(j))).append(",");
	        	    		}else{
	        	    			 sql.append(rsmd.getColumnName(j)).append("='").append(extmap.get(rsmd.getColumnName(j))).append("',");
	        	    		}
	    	    		}
	    	    	}
			    	}
			    	sql = new StringBuilder(sql.substring(0, sql.length() - 1));
			    	sql.append(" where id=").append(request.getParameter("id"));
			       System.out.println(sql);
			    	Statement st1 = conn.createStatement();
			    	st1.execute(sql.toString());
			    	st1.close();
			    rs.close();
			    st.close(); 
			     
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String str = "";
			if(!reflush)
			 str += "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" ;
				str = getString(alert, reflush, tzurl, str);
				str+="</script>\n";
			PrintWriter wrt = null;
			try {
				//request.get
			wrt = response.getWriter();
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
				assert wrt != null;
				wrt.write(str);
			}
	        return "";
		}

	private String getString(boolean alert, boolean reflush, String tzurl, String str) {
		str +=	"<script language=javascript>\n";
		if(alert){
		str+="alert('成功しました');\n";
		}
		if(tzurl.equals(""))
		{
			if(reflush){
				str+="parent.location=parent.location;\n";
			}else{
				str+="window.location=String(window.location).replace(new RegExp('f=f', 'g'), '');";
			}
		}
		else
		{
			str+="location.href='"+tzurl+"';\n";
		}
		return str;
	}


	public Connection getConn()
		{
		        try
		        { 
		        	if(conn==null||conn.isClosed()){

		        		 Class.forName("com.mysql.jdbc.Driver");
			        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspmkyzxjszwglxtdzkf10","root","root");

						// Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			        //	 conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jspmkyzxjszwglxtdzkf10","sa","sa123456");

			        	// Class.forName("net.sourceforge.jtds.jdbc.Driver");
			        	// conn = DriverManager.getConnection("jdbc:jtds:sqlserver://127.0.0.1:1433;databaseName=jspmkyzxjszwglxtdzkf10","sa","sa123456");
		            }}
		        catch(Exception e)
		        {
		            e.printStackTrace();
		        }
		        return conn;
		}


	public int getInt(String sql)
	{
		int i = 0;
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next())
			{
				i = rs.getInt(1);
			}
			    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}


	public double getDouble(String sql)
	{
		double i = 0;
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next())
			{
				i = rs.getDouble(1);

			}
			    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public void commOper(String sql)
	{
		System.out.println(sql);
		try {
			Statement st = conn.createStatement();
		    st.execute(sql);
		    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void commOperSqls(ArrayList<String> sql)
	{

		try {
			conn.setAutoCommit(false);
			for (String s : sql) {
				Statement st = conn.createStatement();
				System.out.println(s);
				st.execute(s);
				st.close();
			}
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	public List<HashMap<String, String>> select(String sql)
	{ 
		System.out.println(sql);
		List<HashMap<String, String>> list = new ArrayList<>();
		try {
			Statement st = conn.createStatement();
		    ResultSet rs = st.executeQuery(sql);
			rsmdGet(list, st, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			if(sql.equals("show tables"))
			list = select("select table_name from   INFORMATION_SCHEMA.tables");
			else
				e.printStackTrace();
		}
		return list;
	}


	public ArrayList<Object> selectforlist(String sql)
	{
		ArrayList<Object> list = new ArrayList<>();
		try {
			Statement st = conn.createStatement();
		    ResultSet rs = st.executeQuery(sql);
		    ResultSetMetaData rsmd = rs.getMetaData();
		    while(rs.next())
		    {
		    	ArrayList<String> list2 = new ArrayList<>();
		    	int i = rsmd.getColumnCount();
		    	for(int j=1;j<=i;j++)
		    	{
		    		if(!rsmd.getColumnName(j).equals("ID"))
		    		{
		    			String str = rs.getString(j)==null?"": rs.getString(j);
		    			if(str.equals("null"))str = "";
		    			list2.add(str);
		    		}
		    		else
		    			list2.add(rs.getString(j));
		    	}
		    	list.add(list2);
		    }
		    rs.close();
		    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	public void close()
	{
		 
	}
	
	/**
	 * 执行一条查询sql,以 List<hashmap> 的形式返回查询的记录，记录条数，和从第几条开始，由参数决定，主要用于翻页
	 * pageno 页码  rowsize 每页的条数
	 */
	public List<HashMap<String, String>> select(String sql, int pageno, int rowsize) {
		List<HashMap<String, String>> list;
		List<HashMap<String, String>> mlist= new ArrayList<>();
		try{
			list=this.select(sql);
			int min = (pageno-1)*rowsize;
			int max = pageno*rowsize;
			
			for(int i=0;i<list.size();i++)
			{
				
				if(!(i<min||i>(max-1)))
				{
				mlist.add(list.get(i));
				}
			}
		}catch(RuntimeException re){
			re.printStackTrace();
			throw re;
		}
		return mlist;
	}
	public static void main(String[] args) { 
	}
}


