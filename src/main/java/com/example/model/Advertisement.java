package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Advertisement implements Serializable {
	private int advertisementId;
	private int workerId;
	private String advertisementStartDate;
	private String advertisementEndDate;
	private String advertisementBanner;
	private float amount;

	public Advertisement() {
		super();
	}

	public Advertisement(int advertisementId, int workerId, String advertisementStartDate, String advertisementEndDate,
			String advertisementBanner, float amount) {
		super();
		this.advertisementId = advertisementId;
		this.workerId = workerId;
		this.advertisementStartDate = advertisementStartDate;
		this.advertisementEndDate = advertisementEndDate;
		this.advertisementBanner = advertisementBanner;
		this.amount = amount;
	}

	/**
	 * @return the advertisementId
	 */
	public int getAdvertisementId() {
		return advertisementId;
	}

	/**
	 * @param advertisementId the advertisementId to set
	 */
	public void setAdvertisementId(int advertisementId) {
		this.advertisementId = advertisementId;
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
	 * @return the advertisementStartDate
	 */
	public String getAdvertisementStartDate() {
		return advertisementStartDate;
	}

	/**
	 * @param advertisementStartDate the advertisementStartDate to set
	 */
	public void setAdvertisementStartDate(String advertisementStartDate) {
		this.advertisementStartDate = advertisementStartDate;
	}

	/**
	 * @return the advertisementEndDate
	 */
	public String getAdvertisementEndDate() {
		return advertisementEndDate;
	}

	/**
	 * @param advertisementEndDate the advertisementEndDate to set
	 */
	public void setAdvertisementEndDate(String advertisementEndDate) {
		this.advertisementEndDate = advertisementEndDate;
	}

	/**
	 * @return the advertisementBanner
	 */
	public String getAdvertisementBanner() {
		return advertisementBanner;
	}

	/**
	 * @param advertisementBanner the advertisementBanner to set
	 */
	public void setAdvertisementBanner(String advertisementBanner) {
		this.advertisementBanner = advertisementBanner;
	}

	/**
	 * @return the amount
	 */
	public float getAmount() {
		return amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(float amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Advertisement [advertisementId=" + advertisementId + ", workerId=" + workerId
				+ ", advertisementStartDate=" + advertisementStartDate + ", advertisementEndDate="
				+ advertisementEndDate + ", advertisementBanner=" + advertisementBanner + ", amount=" + amount + "]";
	}

/////////////////////////////////////////////////////////////////////
//////////////////////////
////////////////////////////////////////////////////////////
	public int addAdvertisement() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into advertisement(workerId,advertisementStartDate,advertisementEndDate,advertisementBanner,amount) values(?,?,?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);

			System.out.println("QRY =" + qry);
			System.out.println("Query = " + pst.toString());

			pst.setInt(1, this.workerId);
			pst.setString(2, this.advertisementStartDate);
			pst.setString(3, this.advertisementEndDate);
			pst.setString(4, this.advertisementBanner);
			pst.setFloat(5, this.amount);
			

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}
	//////////////////////////////////////////////////////////////////////////////////////////
	
	public List<Advertisement> getAllAdvertisements() {
		List<Advertisement> advertisementList = new ArrayList<Advertisement>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from advertisement";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Advertisement adv = new Advertisement();

				adv.setAdvertisementId(rs.getInt("advertisementId"));
				adv.setWorkerId(rs.getInt("workerId"));
				adv.setAdvertisementStartDate(rs.getString("advertisementStartDate"));
				adv.setAdvertisementEndDate(rs.getString("advertisementEndDate"));
				adv.setAdvertisementBanner(rs.getString("advertisementBanner"));
				adv.setAmount(rs.getFloat("amount"));
				

				advertisementList.add(adv);

							}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return advertisementList;
	}

}
