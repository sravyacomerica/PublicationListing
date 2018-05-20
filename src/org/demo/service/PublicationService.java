/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
package org.demo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PublicationService {

	private static Connection connection = null;

	void initDB() {
		try {
			if (connection != null && !connection.isClosed()) {
				return;
			}
			/*Gets database connection*/
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "root");
			createDatabase();
			createTable();
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/publication", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean Con(String Title, String Author, String Year, String Newspaper, String Pages) {
		try {
			initDB();
			int publication_id = getNextId();
			/*Checks if the the author is already present in the database
			 * By the foreign key author_id*/
			int author_id = getAuthorId(Author);
			if (author_id <= 0) {
				return false;
			}
			Statement myStmt = connection.createStatement();
			String sql = "INSERT INTO publication.details ("
					+ "publication_id, title, publish_year, newspaper, pages, author_id) VALUES (" + publication_id
					+ ", '" + Title + "', " + Year + ", '" + Newspaper + "', " + Pages + ", " + author_id + ")";
			myStmt.executeUpdate(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return true;
	}

	private void createTable() throws SQLException {
		Statement statement = null;

		try {
			/*Creates the table dynamically*/
			String sql_stmt = "CREATE TABLE IF NOT EXISTS"
						+ " publication.details ("
							+ " publication_id INTEGER NOT NULL,"
							+ " title VARCHAR(100) NOT NULL,"
							+ " publish_year INTEGER NOT NULL,"
							+ " newspaper VARCHAR(100) NOT NULL,"
							+ " pages INTEGER NOT NULL,"
							+ " author_id INTEGER NOT NULL,"
						+ " PRIMARY KEY (publication_id),"
						+ " FOREIGN KEY (author_id)"
						+ " REFERENCES publication.author(author_id)"
						+ ")";

			statement = connection.createStatement();

			statement.executeUpdate(sql_stmt);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}

	private void createDatabase() throws SQLException {
		Statement statement = null;
		try {
			/*Creates the database dynamically*/
			String sql_stmt = "CREATE DATABASE IF NOT EXISTS  `publication`;";

			statement = connection.createStatement();

			statement.executeUpdate(sql_stmt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}

	private int getNextId() {
		int id = 0;
		try {
			Statement myStmt = connection.createStatement();
			/*Gets the maximum value of the the primary key 
			 * publication_ID and increments it to store it sequentially*/
			ResultSet rs = myStmt
					.executeQuery("SELECT IFNULL(MAX(publication_id), 0) AS publication_id FROM publication.details");
			while (rs.next()) {
				id = rs.getInt("publication_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ++id;
	}

	private int getAuthorId(String name) {
		int id = -1;
		if (name != null && name.trim() != "") {
			try {
				/*Checks whether the author already exists
				 * by author_id which is the foreign key*/
				Statement myStmt = connection.createStatement();
				ResultSet rs = myStmt.executeQuery(
						"SELECT author_id FROM author WHERE UPPER(author_name) = '" + name.toUpperCase() + "'");
				while (rs.next()) {
					id = rs.getInt("author_id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return id;
	}
}
