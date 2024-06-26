package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Services;



/**
 * Servlet implementation class UpdateServiceServlet
 */
public class UpdateServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServiceServlet() {
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
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
//reading parameters from html page
		
		String serviceId = request.getParameter("serviceId");
		String serviceName = request.getParameter("serviceName");
		

		System.out.println("serviceId=" + serviceId);
		
		// taking module parameters
		
		Services services = new Services();
	
		// taking variables
		
		services.setServiceId(Integer.parseInt(serviceId));
		services.setServiceName(serviceName);
		
		//category.setCategoryName(categoryName);
		//category.setCategoryId(Integer.parseInt(categoryId));
		
		// taking the method
		int n = services.updateServiceById();
		System.out.println("n=" + n);
		/*
		 * if(n==0) {//record added
		 * 
		 * response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record
		 * for displaying the msg //that displaying on add category.jsp
		 * 
		 * }else {//record not added
		 * response.sendRedirect("Category/ViewCat.jsp?res=1"); }
		 */
		response.sendRedirect("/MetroDwellServices/ViewServices.jsp?res=" + n);
		pw.close();
	}

}

