package com.example.controller.workers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Workers;

import dbutil.Cryptography;

/**
 * Servlet implementation class WorkerServletLoginValidation
 */
public class WorkerServletLoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkerServletLoginValidation() {
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
	 
		String mobile= request.getParameter("mobile");
		String password=request.getParameter("password");
		
		System.out.println("mobile="+mobile);
		System.out.println("pwd="+password);
		
		String mobileEncode=Cryptography.encode(mobile);
		String passwordEncode=Cryptography.encode(password);
		
		System.out.println("mobile encode="+mobileEncode);
		System.out.println("pwd encode="+passwordEncode);
		
		
		Workers workers = new Workers();
		
		workers.setMobile(mobileEncode);
		workers.setPassword(passwordEncode);
		
		
		boolean flag=workers.WorkerLoginValidate();
		System.out.println("flag11 =" +flag);
		if(flag==true)
		{
			HttpSession session=request.getSession();
			session.setAttribute("workerId", workers.getWorkerId());
			/*session.setAttribute("fullName", workers.getFullName());
        	session.setAttribute("serviceName", workers.getServiceName());
        	session.setAttribute("mobile", workers.getMobile());
        	session.setAttribute("currentAddress", workers.getCurrentAddress());
        	session.setAttribute("cities", workers.getCities());
        	session.setAttribute("workerPic", workers.getWorkerPic());
        	session.setAttribute("password", workers.getPassword()); */
        	
			response.sendRedirect("WorkerHome.jsp");
			
			pw.println("Login success...");
		}
		else
		{
			response.sendRedirect("WorkerLogin.jsp?res=0");
			//pw.println("<h4>Invalid usename/password</h4>");
		}
	}
}