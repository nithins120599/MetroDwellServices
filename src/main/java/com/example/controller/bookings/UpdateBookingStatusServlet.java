package com.example.controller.bookings;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Bookings;
import com.example.model.Workers;

/**
 * Servlet implementation class UpdateBookingStatusServlet
 */
public class UpdateBookingStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookingStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		
         //reading parameters from html page
		String bookingId= request.getParameter("bookingId");
		String status = request.getParameter("status");

		
		
		// taking module parameters
		//Workers worker = new Workers();
		Bookings book = new Bookings();
		
		//int n = worker.workerStatusUpdate(Long.parseLong(workerId), status)
		int n = book.updateBookingStatus(Long.parseLong(bookingId), status);
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
		response.sendRedirect("/MetroDwellServices/ViewBookings.jsp?res=" + n);
		pw.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
