package javapack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Home extends HttpServlet{
	
	public void service(HttpServletResponse res,HttpServletRequest req) throws IOException {
		
		String s3;
		HttpSession session=req.getSession();
		s3=(String) session.getAttribute("un");
		PrintWriter out=res.getWriter();
		out.println("welcome : "+s3);
		
		
	}

}
