package com.example.controller.workers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Workers;

import dbutil.Cryptography;

/**
 * Servlet implementation class UpdateWorkerDataFields
 */
public class UpdateWorkerDataFields extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerDataFields() {
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
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		 int workerId = Integer.parseInt(request.getParameter("workerId"));
	        String fullName = request.getParameter("fullName");
	        String registrationDate = request.getParameter("registrationDate");
	        String serviceName = request.getParameter("serviceName");
	        String mobile = request.getParameter("mobile");
	        String currentAddress = request.getParameter("currentAddress");
	        String city = request.getParameter("cities");
	        String password = request.getParameter("password");
	        String fullNameEncode=Cryptography.encode(mobile);
			System.out.println("Mobile encode="+fullNameEncode);
			
			String passwordEncode=Cryptography.encode(password);
			System.out.println("Password encode="+passwordEncode);
	        // Update worker details
			 Workers worker = new Workers();
		        worker.setWorkerId(workerId);
		        worker.setFullName(fullName);
		        worker.setRegistrationDate(registrationDate);
		        worker.setServiceName(serviceName);
		        worker.setMobile(fullNameEncode);
		        worker.setCurrentAddress(currentAddress);
		        worker.setCities(city);
		        worker.setPassword(passwordEncode);
		        
		        int n= worker.updateWorker();
				
				
				response.sendRedirect("WorkerProfile.jsp?res=" + n);
		}
	

}
