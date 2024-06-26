package com.example.controller.bookings;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;

import com.example.model.Bookings;
import com.example.model.Workers;

import dbutil.Cryptography;

/**
 * Servlet implementation class AddBookingsServlet
 */
public class AddBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookingsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/hmtl");
		PrintWriter pw= response.getWriter();
		Calendar c= Calendar.getInstance();
		String today=c.get(Calendar.YEAR)+"/"+(c.get(Calendar.MONTH)+1)+"/"+c.get(Calendar.DAY_OF_MONTH);
		
		
				String bookingDate = request.getParameter("bookingDate");
		       
		        String workerId = request.getParameter("workerId");
		        String serviceName = request.getParameter("serviceName");
		        String workerLatitude = request.getParameter("workerLatitude");
		       String workerLongitude = request.getParameter("workerLongitude");
		        String status ="CONFIRMED";
		        
		        System.out.println("date="+today);
		        HttpSession session = request.getSession();
		        int userId= (int)session.getAttribute("userId");
		        System.out.println("USERID="+userId);
		        System.out.println("WorId="+workerId);
		        System.out.println("servName="+serviceName);
		        System.out.println("LATITUDE="+workerLatitude);
		        System.out.println("Longitutdee="+workerLongitude);
		        System.out.println("Statuss="+status);
		      
				Bookings bookings = new Bookings();
		       
				
		        bookings.setBookingDate(today);
		        bookings.setUserId(userId);
		        bookings.setWorkerId(Integer.parseInt(workerId));
		        bookings.setServiceName(serviceName);
		        bookings.setWorkerLatitude(workerLatitude);
		        bookings.setWorkerLongitude(workerLongitude);
		        bookings.setStatus(status);
		        
		       
		        
		        int n= bookings.addBookings() ;
		        System.out.println("N="+n);
	        	response.sendRedirect("UserHome.jsp?res="+n);
	        	
			
				
	}
}
