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
 * Servlet implementation class DeleteServiceServlet
 */
public class DeleteServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String serviceId = request.getParameter("serviceId");

		Services service = new Services();
		
		service.setServiceId(Integer.parseInt(serviceId));
		System.out.println("serviceId = "+serviceId);
		
		boolean flag = service.deleteByServiceId();
		System.out.println("flag = " +flag);

		int n = 0;
		if (flag) {
			n = 1;
			response.sendRedirect("/MetroDwellServices/ViewServices.jsp");

		} else {
			n = 0;
		}

	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
