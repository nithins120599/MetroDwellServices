package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Reviews implements Serializable {
	private int reviewId;
	private int userId;
	private int workerId;
	private String reviewDate;
	private String serviceName;
	private int rating;
	private String comments;

	public Reviews() {
		super();
	}

	public Reviews(int reviewId, int userId, int workerId, String reviewDate, String serviceName, int rating,
			String comments) {
		super();
		this.reviewId = reviewId;
		this.userId = userId;
		this.workerId = workerId;
		this.reviewDate = reviewDate;
		this.serviceName = serviceName;
		this.rating = rating;
		this.comments = comments;
	}

	/**
	 * @return the reviewId
	 */
	public int getReviewId() {
		return reviewId;
	}

	/**
	 * @param reviewId the reviewId to set
	 */
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
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
	 * @return the reviewDate
	 */
	public String getReviewDate() {
		return reviewDate;
	}

	/**
	 * @param reviewDate the reviewDate to set
	 */
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
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
	 * @return the rating
	 */
	public int getRating() {
		return rating;
	}

	/**
	 * @param rating the rating to set
	 */
	public void setRating(int rating) {
		this.rating = rating;
	}

	/**
	 * @return the comments
	 */
	public String getComments() {
		return comments;
	}

	/**
	 * @param comments the comments to set
	 */
	public void setComments(String comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Reviews [reviewId=" + reviewId + ", userId=" + userId + ", workerId=" + workerId + ", reviewDate="
				+ reviewDate + ", serviceName=" + serviceName + ", rating=" + rating + ", comments=" + comments + "]";
	}

	/////////////////////////////////////////////////////////////////////
	//////////////////////////
	////////////////////////////////////////////////////////////
	public int addRating() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into reviews(userId,workerId,reviewDate,serviceName,rating,comments) values(?,?,?,?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);

			System.out.println("QRY =" + qry);
			System.out.println("Query = " + pst.toString());

			pst.setInt(1, this.userId);
			pst.setInt(2, this.workerId);
			pst.setString(3, this.reviewDate);
			pst.setString(4, this.serviceName);
			pst.setInt(5, this.rating);
			pst.setString(6, this.comments);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

/////////////////////////////////////////
///////////////////////  This is for rating after giving rating the rating button will disappear
////////////////////////////////////////////////

	public boolean isRatingGiven(int workerId) {
		boolean found = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select reviewId from reviews where workerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, workerId);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

// rating exist

				found = true;

			}

		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return found;

	}

////////////////////////////////////////////////////////////////
/////////////////////////// view records
////////////////////////////////////////////////

	public List<Reviews> getAllReviews(int userId) {
		List<Reviews> revList = new ArrayList<Reviews>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select reviewId,userId,workerId,reviewDate,serviceName,rating,comments from reviews where userId=?";
			System.out.println("Query =" + qry);
			PreparedStatement pst = conn.prepareStatement(qry);
			System.out.println("Query =" + pst.toString());
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Reviews rev = new Reviews();

				rev.setReviewId(rs.getInt("reviewId"));
				rev.setUserId(rs.getInt("userId"));
				rev.setWorkerId(rs.getInt("workerId"));
				rev.setReviewDate(rs.getString("reviewDate"));
				rev.setServiceName(rs.getString("serviceName"));
				rev.setRating(rs.getInt("rating"));
				rev.setComments(rs.getString("comments"));
				revList.add(rev);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllReviews()............" + e);
		}
		return revList;
	}

////////////////////////////////////////////////////////
/////////////////////////////////////////Delete 
////////////////////////////////////////////////////////

	public boolean deleteByReviewId() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from  reviews  where reviewId=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.reviewId);

			int n = pst.executeUpdate();

			if (n == 0) {
				flag = false;
			} else {
				flag = true;
			}
		} catch (Exception e) {
			flag = false;
		}
		return flag;

	}

/////////////////////////////////////////////
//////////////////////////////////editt reviews by reviewid
////////////////////////////////////

	public Reviews getReviewsById(int reviewId) {
		Reviews rev = new Reviews();
		System.out.println("Reviewsss" +rev);
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from reviews where reviewId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, reviewId);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
					//taking variables
				rev.setComments(rs.getString("comments"));
				rev.setRating(rs.getInt("rating"));
				rev.setWorkerId(rs.getInt("workerId"));
				rev.setUserId(rs.getInt("userId"));
				rev.setReviewId(rs.getInt("reviewId"));
				
				/*rev.setProductCode(rs.getInt("productCode"));
				rev.setCustomerId(rs.getInt("customerId"));
				rev.setRatingId(rs.getInt("ratingId"));*/

			} else {
				rev = null;
			}

		} catch (Exception e) {
			System.out.println("error=" + e);
		}
		return rev;
	}

	public int UpdateByReviewId() {
		int n = 0;

		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			System.err.println("Connectin error");

		} else {
			try {
				String qry = "Update reviews set rating=?,comments=? where reviewId=? ";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setInt(1, this.rating);
				pst.setString(2, this.comments);
				pst.setInt(3, this.reviewId);

				System.out.println("  queryreviews = " + pst.toString());

				n = pst.executeUpdate();

				conn.close();
			} catch (Exception e) {

			}

		}
		return n;
	}
	
	
	//getting reviews in worker
	
		public List<Reviews> getReviewsByWorkerId(int workerId) {
			List<Reviews> reviewList = new ArrayList<Reviews>();

			try {
				DBConnection db = new DBConnection();
				Connection conn = db.getConnection();

				String qry = "select * from reviews where workerId=? ";

				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setInt(1, workerId);
				ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					Reviews rev = new Reviews();

					rev.setComments(rs.getString("comments"));
					rev.setRating(rs.getInt("rating"));
					rev.setReviewDate(rs.getString("reviewDate"));
					rev.setReviewId(rs.getInt("reviewId"));
					rev.setServiceName(rs.getString("serviceName"));
					rev.setUserId(rs.getInt("userId"));
					rev.setWorkerId(rs.getInt("workerId"));

					reviewList.add(rev);
				}
			} catch (Exception e) {
				System.out.println("Error:getAllServices..:" + e);

			}
			return reviewList;
		}

}
