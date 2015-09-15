package com.swaz.assignment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.tomcat.jdbc.pool.DataSource;

public class DBConnectionManager 

{

	
	public static void main(String[] argv) throws SQLException {

		System.out.println("-------- PostgreSQL "
				+ "JDBC Connection Testing ------------");

		try {

			Class.forName("org.postgresql.Driver");

		} catch (ClassNotFoundException e) {

			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			return;

		}

		System.out.println("PostgreSQL JDBC Driver Registered!");

		Connection connection = null;

		try {

			connection = DriverManager.getConnection(
					"jdbc:postgresql://127.0.0.1:5432/testapp", "postgres",
					"root");
			
			

		} catch (SQLException e) {

			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;

		}

		if (connection != null) {
						
			Statement stmt = connection.createStatement() ;
			String query = "select * from public."+ "\"CONTACTS\";";
			
			String query2 = "select * from CONTACTS;";
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query) ;
			System.out.println("You made it, take control your database now!"+rs.getString("EMAIL") );
		} else {
			System.out.println("Failed to make connection!");
		}
	}

	
	
}
