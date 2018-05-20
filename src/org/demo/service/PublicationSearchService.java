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

import org.demo.dto.PublicationDetails;

public class PublicationSearchService {
	int id, year, pages;
	String title, author, newspaper;
	List<PublicationDetails> list = new ArrayList<PublicationDetails>();
	List<PublicationDetails> duplist = new ArrayList<PublicationDetails>();

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

	public List<PublicationDetails> Search(String Key) {
		{
			initDB();
			try {
				/*Joins the database tables based on a foreign key and provides a keyword search on the overall database*/
				String sql = "SELECT a.author_name, d.newspaper, d.pages, d.publish_year, d.title"
						+ " FROM publication.details d" + " JOIN publication.author a" + " ON d.author_id = a.author_id"
						+ " WHERE d.newspaper LIKE ?" + " OR d.pages LIKE ?" + " OR d.publish_year LIKE ?"
						+ " OR d.title LIKE ?" + " OR a.author_name LIKE ? ORDER BY publish_year ASC";

				PreparedStatement myStmt = connection.prepareStatement(sql);
				myStmt.setString(1,"%" +Key + "%");
				myStmt.setString(2,"%" +Key + "%");
				myStmt.setString(3,"%" +Key + "%");
				myStmt.setString(4,"%" +Key + "%");
				myStmt.setString(5,"%" +Key + "%");
				ResultSet rs = myStmt.executeQuery();

				while (rs.next()) {
					title = rs.getString("title");
					author = rs.getString("author_name");
					year = rs.getInt("publish_year");
					newspaper = rs.getString("newspaper");
					pages = rs.getInt("pages");
					PublicationDetails details = new PublicationDetails();
					details.setTitle(title);
					details.setAuthor(author);
					details.setYear(year);
					details.setNewspaper(newspaper);
					details.setPages(pages);
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

}
