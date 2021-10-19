

package util;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

import dao.CommDAO;



public class PageManager {


	// 默认一页最大记录数
	public static final int DEFAULTPAGESIZE = 20;

	// 分页段
	public static final int segment = 10;

	// 当前页数
	protected int currentPage;

	// 一页长度
	protected int pageSize;

	// 总页数
	protected long pageNumber;

	// 总记录数
	protected long count;

	// 数据
	protected List<HashMap<String, String>> collection;

	// 数据查询对象
	protected CommDAO dao = new CommDAO();

	// 表现层代码
	protected String info;

	// 请求路径
	protected String path;

	// 服务器请求对象
	protected HttpServletRequest request;

	/*
	 * 仅仅只是加到路径中去
	 */
	protected String parameter = "";

	/**
	 * 
	 * @param 下一页的分页链接
	 * @param 一页最大记录数
	 * @param 当前HttpServletRequest对象
	 * @param 数据库操作对象
	 */
	protected PageManager(String path, int pageSize, HttpServletRequest request) {
		// 任意一个dao都行
		this.currentPage = 1;
		this.pageNumber = 1;
		this.count = 0;
		this.pageSize = pageSize <= 0 ? DEFAULTPAGESIZE : pageSize;
		this.request = request;
		this.path = path;

		request.setAttribute("page", this);

		try {
			this.currentPage = Integer.parseInt(request
					.getParameter("currentPage")) <= 0 ? 1 : Integer
					.parseInt(request.getParameter("currentPage"));

		} catch (Exception e) {

			try {
				this.currentPage = Integer.parseInt((String) request
						.getSession().getAttribute("currentPage"));

			} catch (Exception e1) {
				this.currentPage = 1;

			}

		}

	}
	
	
	
	

	
	

	/**
	 * 
	 * @param 下一页的分页链接
	 * @param 一页最大记录数
	 * @param 当前HttpServletRequest对象
	 * @param 数据库操作对象
	 */
	public static PageManager getPage(String path, int pageSize,
			HttpServletRequest request) {
		return new PageManager(path, pageSize, request);

	}

	/**
	 * 
	 * 
	 * @param hql语句
	 * 
	 */
	public void doList(String hql) {
        
		this.count = this.dao.select(hql).size();
		if (this.count != 0) {
			this.pageNumber = count % this.pageSize == 0 ? this.count
					/ this.pageSize : this.count / this.pageSize + 1;
			if (this.currentPage > this.pageNumber)
				this.currentPage = (int) this.pageNumber;

		}
		this.request.getSession().setAttribute("currentPage",
				String.valueOf(this.currentPage));
		this.collection = this.dao.select(hql,
				this.currentPage , this.pageSize);

		this.refreshUrl();
	}

	/**
	 * 
	 * @param 查询条件集合
	 *
	 */
	public void addParameter(List parameter) {

		StringBuilder para = new StringBuilder("");
		if (parameter != null && parameter.size() != 0) {
			for (Object o : parameter) {
				para.append("&").append(o.toString());
			}
		}
		this.parameter = para.toString();

	}

	/**
	 * 刷新分页路径
	 * 
	 */
	protected void refreshUrl() {
		StringBuilder buf = new StringBuilder();
		buf.append("<font color='#1157B7'>for ").append(count);
		buf.append(" together");
		buf.append("&nbsp;&nbsp;");
		buf.append("NO.").append(this.currentPage).append("/").append(
				this.pageNumber).append("page");
		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		if (this.currentPage == 1)
			buf.append("First page");
		else
			buf.append("<a href='").append(this.path).append("&currentPage=1")
					.append(parameter)
					.append("' class='ls'>").append("First page")
					.append("</a>");
		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");

		if (this.currentPage > 1) {
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(currentPage - 1).append(parameter).append(
							"' class='ls'>").append("Prev page")
					.append("</a>");
		} else {
			buf.append("Prev page");

		}
		buf.append("&nbsp;&nbsp;");
		buf.append("&nbsp;&nbsp;");
		if (this.currentPage < this.pageNumber) {
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(currentPage + 1).append(parameter).append(
							"' class='ls'>").append("Next page")
					.append("</a>");
		} else {

			buf.append("Next page");

		}

		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		if (this.currentPage == this.pageNumber)
			buf.append("Last page&nbsp;&nbsp;");
		else
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(this.pageNumber).append(parameter).append(
					"' class='ls'>").append("Last page")
					.append("</a></font>&nbsp;&nbsp;");
			buf.append("<select onchange=\"javascript:window.location='").append(
					this.path).append("&currentPage='+").append(
					"this.options[this.selectedIndex].value").append(parameter)
					.append("\">");
		for (int i = 0; i < this.pageNumber; i++) {
			if (this.currentPage == i + 1)
				buf.append("<option value=").append(i + 1).append(" selected=\"selected\">").append(i + 1).append("</option>");
			else
				buf.append("<option value=").append(i + 1).append(">").append(i + 1).append("</option>");

		}
		buf.append("</select>");
		this.info = buf.toString();
		
	}

	public Collection getCollection() {
		return collection;
	}

	public long getCount() {
		return count;
	}

	public String getInfo() {
		return info;
	}
	
	public static ArrayList getPages(String url, int pagesize, String sql, HttpServletRequest request )
	{
	     
		PageManager pageManager = PageManager.getPage(url, pagesize, request);
		  pageManager.doList(sql);
		  PageManager bean = (PageManager) request.getAttribute("page");

		  ArrayList nlist = (ArrayList) bean.getCollection();
		  return nlist;
	}

 
}
