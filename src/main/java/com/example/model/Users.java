package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Users implements Serializable {

	private int userId;
	private String fullName;
	private String registrationDate;
	private String mobile;
	private String password;
	private String profilePic;

	public Users() {
		super();
	}

	public Users(int userId, String fullName, String registrationDate, String mobile, String password,
			String profilePic) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.registrationDate = registrationDate;
		this.mobile = mobile;
		this.password = password;
		this.profilePic = profilePic;
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
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the registrationDate
	 */
	public String getRegistrationDate() {
		return registrationDate;
	}

	/**
	 * @param registrationDate the registrationDate to set
	 */
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the profilePic
	 */
	public String getProfilePic() {
		return profilePic;
	}

	/**
	 * @param profilePic the profilePic to set
	 */
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	/////////////////////////////////////////////////////////
	///////////////////////////////////////////// Add
	//////////////////////////////////////

	public int addUsers() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "INSERT INTO users(fullName,registrationDate,mobile,password,profilePic) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setString(1, this.fullName);
			pst.setString(2, this.registrationDate);

			pst.setString(3, this.mobile);
			pst.setString(4, this.password);
			pst.setString(5, this.profilePic);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
			System.out.println("Error: " + e);
		}

		return n;
	}

	public boolean UserLoginValidate() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
			if (conn == null) {
				flag = false;
			} else {
				String qry = "select * from users where fullName=? and password=?";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, this.fullName);
				pst.setString(2, this.password);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					flag = true;
					this.userId = rs.getInt("userId");

				} else {
					flag = false;
				}
			}

		} catch (Exception e) {
			flag = false;
		}
		return flag;

	}

//////////////////////////////////
///////////// viewing worker details in card in WorkerProfile
/////////////////////////////

	public List<Users> getUserById(int userId) {
		List<Users> userList = new ArrayList<Users>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select userId,fullName,mobile,password,profilePic from users where userId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			System.out.println("qryy =" + pst.toString());

			while (rs.next()) {
				// Workers workers = new Workers();
				Users user = new Users();
				user.setUserId(rs.getInt("userId"));
				user.setFullName(rs.getString("fullName"));

				user.setMobile(rs.getString("mobile"));

				user.setProfilePic(rs.getString("profilePic"));
				user.setPassword(rs.getString("password"));
				userList.add(user);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return userList;

	}

////////////////////viewing Users details in admin (i.ehow many Users
////////////////////////////////////////////////////////////are present)
////////////////////////////////////////////

	public List<Users> getAllUsers() {
		List<Users> userList = new ArrayList<Users>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from users";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Users user = new Users();
				user.setUserId(rs.getInt("userId"));
				user.setFullName(rs.getString("fullName"));
				user.setRegistrationDate(rs.getString("registrationDate"));
				
				user.setMobile(rs.getString("mobile"));
				
				user.setProfilePic(rs.getString("profilePic"));
				

				userList.add(user);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return userList;
	}
	
	//////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////
	public Users getUsersDetailsById(int userId) {

		Users use1 = new Users();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select userId,fullName,registrationDate,mobile,password from users where userId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, userId);
			System.out.println("sss"+pst.toString());
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				use1.setUserId(rs.getInt("userId"));
				//customer.setCustomerId(rs.getInt("customerId"));
				use1.setFullName(rs.getString("fullName"));
				//customer.setFirstName(rs.getString("firstName"));
				use1.setRegistrationDate(rs.getString("registrationDate"));
				use1.setMobile(rs.getString("mobile"));
				use1.setPassword(rs.getString("password"));
				
			} else {
				use1 = null;
			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return use1;
	}
	
	public int updateUserDetails() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update users set fullName=?,mobile=?,password=? where userId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			
			System.out.println("Query = "+pst.toString());
			
			pst.setString(1, this.fullName);
			pst.setString(2, this.mobile);
			pst.setString(3, this.password);
			pst.setInt(4, this.userId);
			System.out.println();
			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}


}
