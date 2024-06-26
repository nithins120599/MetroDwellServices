package com.example.controller.advertisement;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

import com.example.model.Advertisement;
import com.example.model.Services;

/**
 * Servlet implementation class AddAdvertisementServlet
 */
@MultipartConfig
public class AddAdvertisementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdvertisementServlet() {
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
		
		// Retrieve parameters from the view
		//String workerId = request.getParameter("workerId");
		String advertisementStartDate =request.getParameter("advertisementStartDate");
		String advertisementEndDate = request.getParameter("advertisementEndDate");
		Part advertisementBanner = request.getPart("advertisementBanner");
		String amount=request.getParameter("amount");

		
		 HttpSession session = request.getSession();
	       int workerId= (int)session.getAttribute("workerId");
	       System.out.println("workerId = " +workerId);
	       System.out.println("advertisementStartDate = " +advertisementStartDate);

	//////////////// creation of uploads directory in webapp folder
	///////////////////////
	    // Creation of the uploads directory in the webapp folder
	        ServletContext sc = getServletContext();
	        String path = sc.getRealPath("/");
	        System.out.println("path="+path);
	        
	        String str = path.substring(0, path.indexOf(".metadata") - 1);
	        String appName = path.substring(path.lastIndexOf("\\", path.length()-2));
	        System.out.println("appNAme="+appName);
	        
	        String uploadDirectory = str+appName+"\\src\\main\\webapp\\Workeruploads";
	        System.out.println("Upload Directory"+uploadDirectory);

	        Path uploadPath = Path.of(uploadDirectory);
		
	        // Create the directory if it doesn't exist
	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	            System.out.println("Directory Created");
	        } else {
	            System.out.println("Directory not Created already exists");
	        }
	        
		     // Upload worker image
	        	///////////////////////////////////////////////////////////////////////////////
	     // Get the input stream of the uploaded file
	        InputStream inputStream1 = advertisementBanner.getInputStream();
	       
	       String filename = System.currentTimeMillis() + "_" +advertisementBanner.getSubmittedFileName();
	    // Save file to the server
	        Path filepath = uploadPath.resolve(filename);
	        Files.copy(inputStream1,filepath,StandardCopyOption.REPLACE_EXISTING);
		//////////////////




		// Create a new Service object and set the values
		Advertisement adv =  new Advertisement();
		adv.setWorkerId(workerId);
		adv.setAdvertisementStartDate(today);
		adv.setAdvertisementEndDate(today);
		adv.setAdvertisementBanner(filename);
		adv.setAmount(Float.parseFloat(amount));
		

		// Call the addService method
		int n = adv.addAdvertisement();
		
		response.sendRedirect("AddAdvertisement.jsp?res=" + n);
		pw.close();
	}
}


