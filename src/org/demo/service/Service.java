/**
 * Author: Sri Sravya Tirupachur Comerica
 * Last Modified: 04.23.2018
 **/
package org.demo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class Service {

	private static Connection connection = null;

	void initDB() {
		/*Gets Database Connection*/
		try {
			if (connection != null && !connection.isClosed()) {
				return;
			}
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "root");
			createDatabase();
			createTable();
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/publication", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean Con(String Name, String Institution, String Department, String Email, String Address, String Home) {
		initDB();
		Map<String, String> h = new HashMap<String, String>();
		/*Inserts the predefined keywords into the database */
		h.put("Computer Science", "CS,Comp Sci");
		h.put("Electrical Engineering", "EE,Electrical,ECE");
		h.put("Data Science", "DS,Data");
		h.put("Industrial Engineering", "IE");
		h.put("Mechanical", "Mech,ME");

		String keyword = h.get(Department);
		System.out.println(keyword);

		int author_id = getNextId();
		boolean author_exists = isAuthorExists(Name);
		if (author_exists) {
			return false;
		}

		try {
			Statement myStmt = connection.createStatement();
			/*Inserts the values into the database */
			String sql = "INSERT INTO publication.author ("
					+ "author_id, author_name, institution, department, email, address, home_page, keywords) VALUES ("
					+ author_id + ", '" + Name + "', '" + Institution + "', '" + Department + "', '" + Email + "', '"
					+ Address + "', '" + Home + "', '" + keyword + "')";
			myStmt.executeUpdate(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	   return true;
	}
	
	private static void createTable() throws SQLException {
		Statement statement = null;
		
		try {
			/*Creates a table dynamically*/	
        String sql_stmt = "CREATE TABLE IF NOT EXISTS"
        		+ " publication.author ("
        			+ " author_id INTEGER NOT NULL,"
        			+ " author_name VARCHAR(100) NOT NULL,"
        			+ " institution VARCHAR(100) NOT NULL,"
        			+ " department VARCHAR(100) NOT NULL,"
        			+ " email VARCHAR(100) NOT NULL,"
        			+ " address VARCHAR(100) NOT NULL,"
        			+ " home_page VARCHAR(100) NOT NULL,"
        			+ " keywords VARCHAR(100) NOT NULL,"
        		+ " PRIMARY KEY (author_id)"
        		+ ")";

        statement = connection.createStatement();

        statement.executeUpdate(sql_stmt);
        
		}
		catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try { if (statement != null) statement.close(); } catch (SQLException e) {}
		}
    }

	private static void createDatabase() throws SQLException {
		Statement statement = null;
		try {
			/*Creates a database dynamically*/	
        String sql_stmt = "CREATE DATABASE IF NOT EXISTS  `publication`;";

        statement = connection.createStatement();

        statement.executeUpdate(sql_stmt);

    }
		catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try { if (statement != null) statement.close(); } catch (SQLException e) {}
		}
	}

	private int getNextId() {
		int id = 0;
		try {
			Statement myStmt = connection.createStatement();
			/*Gets the length of the table and appends an 
			 * unique key and enters it as author_id into the database
			 *  as primary key in sequential order*/	
			ResultSet rs = myStmt
					.executeQuery("SELECT IFNULL(MAX(author_id), 0) AS author_id FROM publication.author;");
			while (rs.next()) {
				id = rs.getInt("author_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ++id;
	}

	private boolean isAuthorExists(String name) {
		int count = 0;
		if (name != null && name.trim() != "") {
			try {
				Statement myStmt = connection.createStatement();
				/*Checks whether author exists or not*/	
				ResultSet rs = myStmt
						.executeQuery("SELECT COUNT(*) AS author_count FROM author WHERE UPPER(author_name) = '"
								+ name.toUpperCase() + "'");
				while (rs.next()) {
					count = rs.getInt("author_count");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count > 0;
	}
}
