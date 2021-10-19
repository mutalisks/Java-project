package util;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.Iterator;

public class SetChar extends HttpServlet implements Filter {
	private FilterConfig filterConfig;

	// Handle the passed-in FilterConfig
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	// Process the request/response pair
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) {
		try {
			//request.setCharacterEncoding("gb2312");

			HttpServletRequest req = (HttpServletRequest) request;

			if (req.getMethod().equalsIgnoreCase("get")) {
	            this.encoding(req);
	        }

			response.setCharacterEncoding("gbk");
			request.setCharacterEncoding("gbk");
			filterChain.doFilter(request, response);
		} catch (ServletException | IOException sx) {
			filterConfig.getServletContext().log(sx.getMessage());
		}
	}

	  private void encoding(HttpServletRequest request) {
		  for (String[] parames : request.getParameterMap().values()) {
			  for (int i = 0; i < parames.length; i++) {
				  try {
					  parames[i] = new String(parames[i].getBytes("iso8859-1"),
							  "gbk");
				  } catch (Exception e) {
					  e.printStackTrace();
				  }
			  }
		  }
	  }
	// Clean up resources
	public void destroy() {
	}
}
