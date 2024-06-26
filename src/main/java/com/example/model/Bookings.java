package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Bookings implements Serializable {
	private int bookingId;
	private String bookingDate;
	private int userId;
	private int workerId;
	private String serviceName;
	private String workerLatitude;
	private String workerLongitude;
	private String status;

	public Bookings() {
		super();
	}

	public Bookings(int bookingId, String bookingDate, int userId, int workerId, String serviceName,
			String workerLatitude, String workerLongitude, String status) {
		super();
		this.bookingId = bookingId;
		this.bookingDate = bookingDate;
		this.userId = userId;
		this.workerId = workerId;
		this.serviceName = serviceName;
		this.workerLatitude = workerLatitude;
		this.workerLongitude = workerLongitude;
		this.status = status;
	}

	/**
	 * @return the bookingId
	 */
	public int getBookingId() {
		return bookingId;
	}

	/**
	 * @param bookingId the bookingId to set
	 */
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	/**
	 * @return the bookingDate
	 */
	public String getBookingDate() {
		return bookingDate;
	}

	/**
	 * @param bookingDate the bookingDate to set
	 */
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the workerId
	 */
	public int getWorkerId() {
		return workerId;
	}

	/**
	 * @param workerId the workerId to set
	 */
	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	/**
	 * @return the serviceName
	 */
	public String getServiceName() {
		return serviceName;
	}

	/**
	 * @param serviceName the serviceName to set
	 */
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	/**
	 * @return the workerLatitude
	 */
	public String getWorkerLatitude() {
		return workerLatitude;
	}

	/**
	 * @param workerLatitude the workerLatitude to set
	 */
	public void setWorkerLatitude(String workerLatitude) {
		this.workerLatitude = workerLatitude;
	}

	/**
	 * @return the workerLongitude
	 */
	public String getWorkerLongitude() {
		return workerLongitude;
	}

	/**
	 * @param workerLongitude the workerLongitude to set
	 */
	public void setWorkerLongitude(String workerLongitude) {
		this.workerLongitude = workerLongitude;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

/////////////////////////////////////////////////////////////
///////////////////////////// Add Services
////////////////////////////////////////////////////////

	public int addBookings() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {

				String qry = "insert into bookings (bookingDate,userId,workerId,serviceName,workerLatitude,workerLongitude,status) VALUES (?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);

				pst.setString(1, this.bookingDate);
				pst.setInt(2, this.userId);
				pst.setInt(3, this.workerId);
				pst.setString(4, this.serviceName);
				pst.setString(5, this.workerLatitude);
				pst.setString(6, this.workerLongitude);
				pst.setString(7, this.status);
				System.out.println("qry11=" + pst.toString());
				n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

			} catch (Exception e) {
				System.out.println("Error:" + e);
				n = 0;
			}

		}
		return n;

	}

	//////////////////////////////
	///////////////////////////// view
	////////////////////////////////////

	public List<Bookings> getAllBookings() {
		List<Bookings> bookingsList = new ArrayList<Bookings>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from bookings";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Bookings bookings = new Bookings();

				bookings.setBookingId(rs.getInt("bookingId"));
				bookings.setBookingDate(rs.getString("bookingDate"));
				bookings.setUserId(rs.getInt("userId"));
				bookings.setWorkerId(rs.getInt("workerId"));
				bookings.setServiceName(rs.getString("serviceName"));
				bookings.setWorkerLatitude(rs.getString("workerLatitude"));
				bookings.setWorkerLongitude(rs.getString("workerLongitude"));
				bookings.setStatus(rs.getString("status"));

				bookingsList.add(bookings);

				System.out.println("bookingId" + bookingId);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return bookingsList;
	}

////////////////////////////////////////////////
/////////////////////////////////////////////
///////////////////////////////////////////////

	public int updateBookingStatus(long bookingId,String status) {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update bookings set status=? where bookingId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			System.out.println("query22 = " + pst.toString());
			pst.setString(1, status);
			pst.setLong(2, bookingId);

			n = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("Errror " + e);
		}
		return n;

	}
	//////////////////////////////////////////////////
	////////////////////////////////////////////////////
	/////////////////////////////////////////////////
	
	public List<Bookings> getBookingsByWorkerId(int workerId) {

		List<Bookings> bukList = new ArrayList<Bookings>();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from bookings where workerId=? order by bookingDate";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, workerId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Bookings book = new Bookings();
				book.setBookingId(rs.getInt("bookingId"));
				book.setBookingDate(rs.getString("bookingDate"));
				book.setUserId(rs.getInt("userId"));
				book.setWorkerId(rs.getInt("workerId"));
				book.setServiceName(rs.getString("serviceName"));
				book.setStatus(rs.getString("status"));
				
				bukList.add(book);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return bukList;

	}
}
