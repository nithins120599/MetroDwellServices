package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbutil.Cryptography;
import dbutil.DBConnection;

public class Admin implements Serializable{ 
	private String username;
    private String password;
	public Admin() {
		super();
	}
	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
    
	 // Method to validate login credentials
    public boolean validateLogin() {
        boolean flag = false;
        DBConnection db = new DBConnection();
        
      Connection conn = db.getConnection();

        if (conn == null) {
            System.err.println("Connection error");
            flag = false;
        } else {
            try {
                String qry = "SELECT * FROM admin WHERE username=? AND password=?";
                PreparedStatement pst = conn.prepareStatement(qry);
                String usernameEncode = Cryptography.encode(this.username);
                String passwordEncode = Cryptography.encode(this.password);
                
                pst.setString(1, usernameEncode);
                pst.setString(2, passwordEncode);

                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    flag = true;
                } else {
                    flag = false;
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return flag;
    }
        
}