package com.example.controller.review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.example.model.Reviews;

/**
 * Servlet implementation class AddRatingsServlet
 */
public class AddRatingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRatingsServlet() {
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
		Calendar c= Calendar.getInstance();
		String today=c.get(Calendar.YEAR)+"/"+(c.get(Calendar.MONTH)+1)+"/"+c.get(Calendar.DAY_OF_MONTH);
		//reading parameters from html page

		HttpSession session = request.getSession();
	
	int userId = (int)session.getAttribute("userId");
		
		String workerId = request.getParameter("workerId");
		String serviceName = request.getParameter("serviceName");
		String rating = request.getParameter("rating");
		String comments = request.getParameter("comments");
		

		
		  Reviews reviews = new Reviews();
		  reviews.setUserId(userId);
		  reviews.setWorkerId(Integer.parseInt(workerId));
		  reviews.setReviewDate(today);
		  reviews.setServiceName(serviceName);
		  reviews.setRating(Integer.parseInt(rating));
		  reviews.setComments(comments);
		
		  System.out.println("USERID="+userId);
			System.out.println("RATING="+rating);
			System.out.println("WORKERID="+workerId);	
			System.out.println("COMMENTSS="+comments);
			System.out.println("SERVICENAME="+serviceName);
			
		   
		   //geting the method 
		   int n = reviews.addRating();
		   
		   response.sendRedirect("/MetroDwellServices/ViewBookings.jsp?res="+n);
		   pw.close();
		   

		
		
		
	}
	
	}