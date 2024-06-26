package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Workers implements Serializable {
	private int workerId;
	private String fullName;
	private String registrationDate;
	private String serviceName;
	private String mobile;
	private String currentAddress;
	private String cities;
	private String workerPic;
	private String aadhaarPic;
	private String password;
	private String status;

	public Workers() {
		super();
	}

	public Workers(int workerId, String fullName, String registrationDate, String serviceName, String mobile,
			String currentAddress, String cities, String workerPic, String aadhaarPic, String password, String status) {
		super();
		this.workerId = workerId;
		this.fullName = fullName;
		this.registrationDate = registrationDate;
		this.serviceName = serviceName;
		this.mobile = mobile;
		this.currentAddress = currentAddress;
		this.cities = cities;
		this.workerPic = workerPic;
		this.aadhaarPic = aadhaarPic;
		this.password = password;
		this.status = status;
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
	 * @return the currentAddress
	 */
	public String getCurrentAddress() {
		return currentAddress;
	}

	/**
	 * @param currentAddress the currentAddress to set
	 */
	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}

	/**
	 * @return the cities
	 */
	public String getCities() {
		return cities;
	}

	/**
	 * @param cities the cities to set
	 */
	public void setCities(String cities) {
		this.cities = cities;
	}

	/**
	 * @return the workersPic
	 */
	public String getWorkerPic() {
		return workerPic;
	}

	/**
	 * @param workersPic the workersPic to set
	 */
	public void setWorkerPic(String workerPic) {
		this.workerPic = workerPic;
	}

	/**
	 * @return the aadhaarPic
	 */
	public String getAadhaarPic() {
		return aadhaarPic;
	}

	/**
	 * @param aadhaarPic the aadhaarPic to set
	 */
	public void setAadhaarPic(String aadhaarPic) {
		this.aadhaarPic = aadhaarPic;
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

	//////////////////////////////////////////
	/////////////////////// Add Workeres
	////////////////////////////////////

	public int addWorkers() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "INSERT INTO workers(fullName, registrationDate, serviceName, mobile, currentAddress, cities, workerPic, aadhaarPic, password, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setString(1, this.fullName);
			pst.setString(2, this.registrationDate);
			pst.setString(3, this.serviceName);
			pst.setString(4, this.mobile);
			pst.setString(5, this.currentAddress);
			pst.setString(6, this.cities);
			pst.setString(7, this.workerPic);
			pst.setString(8, this.aadhaarPic);
			pst.setString(9, this.password);
			pst.setString(10, this.status);
			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
			System.out.println("Error: " + e);
		}

		return n;
	}

	public boolean WorkerLoginValidate() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
			if (conn == null) {
				flag = false;
			} else {
				String qry = "select * from workers where mobile=? and password=?";
				PreparedStatement pst = conn.prepareStatement(qry);

				pst.setString(1, this.mobile);
				pst.setString(2, this.password);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					this.workerId = rs.getInt("workerId");

					flag = true;

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

	public List<Workers> getWorkerById(int workerId) {
		List<Workers> workerList = new ArrayList<Workers>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select workerId,fullName,serviceName,mobile,currentAddress,cities,workerPic,password from workers where workerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, workerId);
			ResultSet rs = pst.executeQuery();
			System.out.println("qryy =" + pst.toString());

			while (rs.next()) {
				Workers workers = new Workers();
				workers.setWorkerId(rs.getInt("workerId"));
				workers.setFullName(rs.getString("fullName"));
				workers.setServiceName(rs.getString("serviceName"));
				workers.setMobile(rs.getString("mobile"));
				workers.setCurrentAddress(rs.getString("currentAddress"));
				workers.setCities(rs.getString("cities"));
				workers.setWorkerPic(rs.getString("workerPic"));
				workers.setPassword(rs.getString("password"));
				workerList.add(workers);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return workerList;

	}

////////////////////viewing Worker details in admin (i.ehow many workers
//////////////////////////////////////////////////////////// are present)
////////////////////////////////////////////

	public List<Workers> getAllWorkers() {
		List<Workers> workerList = new ArrayList<Workers>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from workers";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Workers workers = new Workers();
				workers.setWorkerId(rs.getInt("workerId"));
				workers.setFullName(rs.getString("fullName"));
				workers.setRegistrationDate(rs.getString("registrationDate"));
				workers.setServiceName(rs.getString("serviceName"));
				workers.setMobile(rs.getString("mobile"));
				workers.setCurrentAddress(rs.getString("currentAddress"));
				workers.setCities(rs.getString("cities"));
				workers.setWorkerPic(rs.getString("workerPic"));
				workers.setAadhaarPic(rs.getString("aadhaarPic"));
				//workers.setPassword(rs.getString("password"));
				workers.setStatus(rs.getString("status"));

				workerList.add(workers);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return workerList;
	}
	
	/////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////
	
	
	public Workers getWorkerProfileById(){

		Workers workers = new Workers();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select workerId,fullName,registrationDate,serviceName,mobile,currentAddress,cities,status from workers where workerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.workerId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				
				
				
				workers.setWorkerId(rs.getInt("workerId"));
				workers.setFullName(rs.getString("fullName"));
				workers.setRegistrationDate(rs.getString("registrationDate"));
				workers.setServiceName(rs.getString("serviceName"));
				workers.setMobile(rs.getString("mobile"));
				workers.setCurrentAddress(rs.getString("currentAddress"));
				workers.setCities(rs.getString("cities"));
				workers.setWorkerPic(rs.getString("workerPic"));
				workers.setAadhaarPic(rs.getString("aadhaarPic"));
				//workers.setPassword(rs.getString("password"));
				workers.setStatus(rs.getString("status"));


			/*	customer.setCustomerId(rs.getInt("customerId"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setMobileNumber(rs.getString("mobileNumber"));
				customer.setEmailId(rs.getString("emailId"));
				customer.setPassword(rs.getString("password"));

				customer.setRegisterDate(rs.getString("registerDate")); */

			} else {
				workers = null;
			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return workers;
	}
	
	////////////////////////////////////////////////
	/////////////////////////////////////////////
	///////////////////////////////////////////////
	
	public int workerStatusUpdate(long workerId,String status) {
		int n=0;
			try {
				DBConnection db = new DBConnection();
				Connection conn = db.getConnection();

				String qry = "update workers set status=? where workerId=?";
				PreparedStatement pst = conn.prepareStatement(qry);
				System.out.println("query22 = " +pst.toString());
				pst.setString(1, status);
				pst.setLong(2, workerId);		

				n= pst.executeUpdate();

			} catch (Exception e) {
				System.out.println("Errror " +e);
			}
			return n;
			
		}
	
	//////////////////////////////////////////////////////////
	/////////////////////////////getting workers in user home by clicking button booknow
	////////////////////////
	
	public List<Workers> getAllWorkers(String serviceName) {
		List<Workers> workerList = new ArrayList<Workers>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from workers where serviceName=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			System.out.println("qry=" + qry);
			pst.setString(1, serviceName);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Workers workers = new Workers();
				workers.setWorkerId(rs.getInt("workerId"));
				workers.setFullName(rs.getString("fullName"));
				workers.setRegistrationDate(rs.getString("registrationDate"));
				workers.setServiceName(rs.getString("serviceName"));
				workers.setMobile(rs.getString("mobile"));
				workers.setCurrentAddress(rs.getString("currentAddress"));
				workers.setCities(rs.getString("cities"));
				workers.setWorkerPic(rs.getString("workerPic"));
				workers.setAadhaarPic(rs.getString("aadhaarPic"));
				//workers.setPassword(rs.getString("password"));
				workers.setStatus(rs.getString("status"));

				workerList.add(workers);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return workerList;
	}
	
	
	////////////////////////////////////////////////////////
	//////////////////////////////////
	/////////////////////////////////
	public Workers getWorkerDetailsByworkerId(int workerId) {
		Workers workerRow = new Workers();
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
			String qry="select * from workers where workerId=?";
			
			PreparedStatement pst = conn.prepareStatement(qry);
			 pst.setInt(1, workerId);
		    
			ResultSet rs = pst.executeQuery();
			System.out.println("qry = "+pst.toString());
	        
	        if(rs.next()) {
	        	//taking variables
	        	workerRow.setWorkerPic(rs.getString("workerPic"));
	        	workerRow.setWorkerId(rs.getInt("workerId"));
	        	workerRow.setServiceName(rs.getString("serviceName"));
	        	
	        }else {
	        	workerRow = null;
	        }
	        
	              

	}catch(Exception e) {
		System.out.println("error="+e);
	}
		return workerRow;
	}
	
	
	
	public Workers getWorkersDetailsByworkerId(int workerId) {

		Workers work1 = new Workers();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			//String qry = "select userId,fullName,registrationDate,mobile,password from users where userId=?";
			String qry = "select * from workers where workerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, workerId);
			System.out.println("sss"+pst.toString());
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				work1.setWorkerId(rs.getInt("workerId"));
				//customer.setCustomerId(rs.getInt("customerId"));
				work1.setFullName(rs.getString("fullName"));
				//customer.setFirstName(rs.getString("firstName"));
				work1.setRegistrationDate(rs.getString("registrationDate"));
				work1.setServiceName(rs.getString("serviceName"));
				work1.setMobile(rs.getString("mobile"));
				work1.setCurrentAddress(rs.getString("currentAddress"));
				work1.setCities(rs.getString("cities"));
				work1.setStatus(rs.getString("status"));
				work1.setPassword(rs.getString("password"));
				work1.setAadhaarPic(rs.getString("aadhaarPic"));
				work1.setWorkerPic(rs.getString("workerPic"));
			} else {
				work1 = null;
			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return work1;
	}
	
	
	public int updateWorker() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
	
    String qry = "UPDATE workers SET fullName=?, registrationDate=?, serviceName=?, mobile=?, currentAddress=?, cities=?, password=? WHERE workerId=?";
    PreparedStatement pst = conn.prepareStatement(qry);
    pst.setString(1, this.fullName);
    pst.setString(2, this.registrationDate);
    pst.setString(3, this.serviceName);
    pst.setString(4, this.mobile);
    pst.setString(5, this.currentAddress);
    pst.setString(6, this.cities);
    pst.setString(7, this.password);
    pst.setInt(8, this.workerId);
    n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}
	
	

	
}