package com.example.controller.review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.example.model.Reviews;

/**
 * Servlet implementation class UpdateReviewServlet
 */
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
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

		String reviewId = request.getParameter("reviewId");
		String rating = request.getParameter("rating");
		String comments = request.getParameter("comments");

		System.out.println("reviewwwId=" + reviewId);
		System.out.println("rating=" + rating);
		System.out.println("comments=" + comments);

		// taking module parameters

		Reviews rev = new Reviews();

		// taking variables
		rev.setReviewId(Integer.parseInt(reviewId));
		rev.setRating(Integer.parseInt(rating));
		rev.setComments(comments);

		// category.setCategoryName(categoryName);
		// category.setCategoryId(Integer.parseInt(categoryId));

		// taking the method
		int n = rev.UpdateByReviewId();
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
		response.sendRedirect("ViewReviews.jsp?res=" + n);
		pw.close();
	}

	

}
