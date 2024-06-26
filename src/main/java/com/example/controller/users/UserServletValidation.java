package com.example.controller.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Users;
import com.example.model.Workers;

import dbutil.Cryptography;

/**
 * Servlet implementation class UserServletValidation
 */
public class UserServletValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServletValidation() {
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
	 
		String fullName= request.getParameter("fullName");
		String password=request.getParameter("password");
		
		System.out.println("fullName="+fullName);
		System.out.println("pwd="+password);
		
		String fullNameEncode=Cryptography.encode(fullName);
		String passwordEncode=Cryptography.encode(password);
		
		System.out.println("fullNameEncode="+fullNameEncode);
		System.out.println("pwd encode="+passwordEncode);
		
		
		Users users= new Users();
        users.setFullName(fullNameEncode);

        users.setPassword(passwordEncode);
		
		
		boolean flag=users.UserLoginValidate();
		System.out.println("flag11 =" +flag);
		if(flag==true)
		{
			HttpSession session=request.getSession();
			session.setAttribute("userId", users.getUserId());
			/*session.setAttribute("fullName", workers.getFullName());
        	session.setAttribute("serviceName", workers.getServiceName());
        	session.setAttribute("mobile", workers.getMobile());
        	session.setAttribute("currentAddress", workers.getCurrentAddress());
        	session.setAttribute("cities", workers.getCities());
        	session.setAttribute("workerPic", workers.getWorkerPic());
        	session.setAttribute("password", workers.getPassword()); */
        	
			response.sendRedirect("UserHome.jsp");
			
			pw.println("Login success...");
		}
		else
		{
			response.sendRedirect("UserLogin.jsp?res=0");
			//pw.println("<h4>Invalid usename/password</h4>");
		}
	}
}