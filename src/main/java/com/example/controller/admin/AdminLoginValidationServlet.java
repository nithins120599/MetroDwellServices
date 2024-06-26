package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Admin;

/**
 * Servlet implementation class AdminLoginValidationServlet
 */
public class AdminLoginValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginValidationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/hmtl");
		PrintWriter pw= response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password"); 
		
		
		
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		
		boolean flag=admin.validateLogin();
		if(flag==true)
		{
			pw.println("Login success...");
			response.sendRedirect("AdminHome.jsp");
		}
		else
		{
			response.sendRedirect("AdminLogin.jsp?res=0");
			pw.println("<h4>Invalid usename/password</h4>");
		}

	}

}
