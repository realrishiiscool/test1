package t1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String s1=req.getParameter("t1");
		String s2=req.getParameter("t2");
		HttpSession session=req.getSession();
		session.setAttribute("un",s1);
		PrintWriter out=res.getWriter();
		if((s1.equals("Minato"))&&(s2.equals("Kushina")))
		{
		res.sendRedirect("home");
		}else
		{
		out.println("<h1>Login failure</h1>");
		res.sendRedirect("NewFile.html");
		}

		
		
	}

}
