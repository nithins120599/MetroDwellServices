package com.example.controller.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Users;

import dbutil.Cryptography;

/**
 * Servlet implementation class UpdateUserDataFields
 */
public class UpdateUserDataFields extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserDataFields() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		
		
		String userId = request.getParameter("userId");
		String fullName = request.getParameter("fullName");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		System.out.println(fullName);
		System.out.println(mobile);
		System.out.println(password);
		
		 String fullNameEncode=Cryptography.encode(fullName);
			System.out.println("Mobile encode="+fullNameEncode);
			
			String passwordEncode=Cryptography.encode(password);
			System.out.println("Password encode="+passwordEncode);
		
		Users user = new Users();
		user.setUserId(Integer.parseInt(userId));
		user.setFullName(fullNameEncode);
		user.setPassword(passwordEncode);
		user.setMobile(mobile); 
		
		int n= user.updateUserDetails();
		
		
		response.sendRedirect("UserProfile.jsp?res=" +n);
	}
}
