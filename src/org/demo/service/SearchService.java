/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
package org.demo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.demo.dto.Details;

public class SearchService {
	String institution, email, address, home, name, department;
	List<Details> list = new ArrayList<Details>();
	List<Details> duplist = new ArrayList<Details>();

	private static Connection connection = null;

	void initDB() {
		try {
			if (connection != null && !connection.isClosed()) {
				return;
			}
			/*Gets database connection*/	
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/publication?autoReconnect=true&useSSL=false", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Details> Con(String Key) {

		initDB();
		try {
			/*Does keyword serach on the overall database*/	
			String sql = "SELECT * FROM publication.author" + " WHERE author_name LIKE ?" + " OR institution LIKE ?"
					+ " OR department LIKE ?" + " OR email LIKE ?" + " OR address LIKE ?" + " OR home_page LIKE ?"
					+ " OR keywords LIKE ?";

			PreparedStatement myStmt = connection.prepareStatement(sql);
			myStmt.setString(1,"%" +Key + "%");
			myStmt.setString(2,"%" +Key + "%");
			myStmt.setString(3,"%" +Key + "%");
			myStmt.setString(4,"%" +Key + "%");
			myStmt.setString(5,"%" +Key + "%");
			myStmt.setString(6,"%" +Key + "%");
			myStmt.setString(7,"%" +Key + "%");
			ResultSet rs = myStmt.executeQuery();

			while (rs.next()) {
				institution = rs.getString("institution");
				email = rs.getString("email");
				home = rs.getString("home_page");
				department = rs.getString("department");
				name = rs.getString("author_name");
				address = rs.getString("address");
				Details details = new Details();
				details.setName(name);
				details.setInstitution(institution);
				details.setDepartment(department);
				details.setEmail(email);
				details.setAddress(address);
				details.setHome(home);
				list.add(details);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return duplist;
		}
		return list;
	}
}
