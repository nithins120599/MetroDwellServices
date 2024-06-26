package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Services implements Serializable {

	private String serviceName;
	private int serviceId;
	private String servicePic;

	public Services() {
		super();
	}

	public Services(String serviceName, int serviceId, String servicePic) {
		super();
		this.serviceName = serviceName;
		this.serviceId = serviceId;
		this.servicePic = servicePic;
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
	 * @return the serviceId
	 */
	public int getServiceId() {
		return serviceId;
	}

	/**
	 * @param serviceId the serviceId to set
	 */
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	/**
	 * @return the servicePic
	 */
	public String getServicePic() {
		return servicePic;
	}

	/**
	 * @param servicePic the servicePic to set
	 */
	public void setServicePic(String servicePic) {
		this.servicePic = servicePic;
	}

	/////////////////////////////////////////////////////////////
	///////////////////////////// Add Services
	////////////////////////////////////////////////////////

	public int addServices() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {
				String qry = "insert into services (serviceName,servicePic) VALUES (?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);

				pst.setString(1, this.serviceName);
				pst.setString(2, this.servicePic);

				System.out.println("qry11=" + pst.toString());
				n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

			} catch (Exception e) {
				System.out.println("Error:" + e);
				n = 0;
			}

		}
		return n;

	}

	/////////////////////////////////////////

	// view///////////////////
	///////////////////////////////////////
	
	public List<Services> getAllServices(String search) {
		List<Services> serviceList = new ArrayList<Services>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
			
			String qry="";
			if(search==null) {

			 qry = "select serviceId, serviceName, servicePic from services order by serviceId";
			}else { //for search services
				search = search.toLowerCase();
		    	String words[] = search.split(" ");
		    	String columnNames[] = {"serviceName"};
		    	 	qry="select * from services  where";
		    	 	
		    	 	for(String word: words) {
			    		for (String colName: columnNames) {
			    		//qry+= "lower("+colName +") like '%" + word + "%' or ";
			    		//qry+=" "+colName +" like '%"+word+"%' or ";
			    		qry+=" lower("+colName +") like '%"+word+"%' or ";
			    			//qry+=String.format("%s like'\%%s' or ", columnNames,word);
			    		}
			    	}
		    	 	
		    	 		qry = qry.substring(0, qry.length()-3);
			    	
			    	qry +=" order by serviceName";
			    	System.out.println("qry=" + qry);	
		    	 	
			}
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Services service = new Services();
				service.setServiceId(rs.getInt("serviceId"));
				service.setServiceName(rs.getString("ServiceName"));
				service.setServicePic(rs.getString("ServicePic"));
				serviceList.add(service);
			}
		} catch (Exception e) {
			System.out.println("Error:getAllServices..:" + e);

		}
		return serviceList;
	}

	////////////////////////////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////////////////////////
//////////////////////////////////////////
////////get records from category Table(View)

	public List<String> getAllServicesByName() {
		List<String> serviceList = new ArrayList<String>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select  serviceName from services order by serviceName";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {

				serviceList.add(rs.getString("serviceName"));
			}

		} catch (Exception e) {
			System.out.println("Error: getAllCategories()............." + e);
		}
		return serviceList;
	}

	/////////////////////////////////////////////////////////////////////////
	/////////////////////////////// Deletee
	////////////////////////////////////////////

	// delete records based on serviceId
	public boolean deleteByServiceId() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from services where serviceId=?";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setInt(1, this.serviceId);

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

//////////////////////////////////////////////////
//////////////////////// Edit
////////////////////////////////////

	public Services getServiceById() {
		Services services = new Services();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select serviceId,serviceName,servicePic from services where serviceId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.serviceId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				services.setServiceId(rs.getInt("serviceId"));
				services.setServiceName(rs.getString("serviceName"));
				services.setServicePic(rs.getString("servicePic"));
			} else {
				services = null;
			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return services;
	}

//////////////////////////////////////////////////
///////////////////////////update
//////////////////////////////////////////

	public int updateServiceById() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update services set serviceName=? where serviceId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.serviceName);
			pst.setInt(2, this.serviceId);

			System.out.println("qry =" + pst.toString());

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}
}
