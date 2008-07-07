package com.amfam.mpscm.connect;

import java.sql.Connection;
import java.util.Properties;
import com.amfam.reuse.db.utilities.DatabaseUtility;
/**
 * this is a test sample of how to use DatabaseUtility.
 * Creation date: (5/14/2002 11:16:08 AM)
 * @author: Andrew Kull
 */
public class HelloWorld {
	/**
	 * DBTest constructor comment.
	 */
	public HelloWorld() {
		super();
	}
	/**
	 * Define your Databases Data Source name as a constant and
	 * pass it into getConnection(MY_CONSTANT);
	 * Creation date: (5/14/2002 11:16:24 AM)
	 * @param args java.lang.String[]
	 */
	public static void main(String[] args) {
		testConn2();
	}


	public static void testConn2() {
		javax.sql.DataSource ds = null;
		java.sql.Connection con = null;

		try {
			System.out.println("Looking up DataSource");
			javax.naming.InitialContext ctx = new javax.naming.InitialContext();
			ds = (javax.sql.DataSource) ctx.lookup("java:/jdbc/mpscmhar/harvestDS");
			System.out.println("Getting connection");
			con = ds.getConnection();
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		System.out.println("Done");
	}
	
	public static void testConn3() {

		Connection connection = null;

	Properties properties = new Properties();
	properties.setProperty("datasource", "jdbc/mpscmhar/harvestDS");
	properties.setProperty("security", "thread");
	
//	Assume properties is populated here...
	try {
	        connection = DatabaseUtility.getConnection(properties);   //using properties object
	        if(connection != null) {
	        System.out.println("Connection Successful");
	      }
	}catch (com.amfam.reuse.db.error.AmfamDatabaseConnectionException adce) {
	        System.out.println("Connection not established");
	        System.out.println(adce.toString());
	    }
	
	try{
	if (connection != null) {
	        DatabaseUtility.returnConnection(connection, DatabaseUtility.CONNECTION_COMMIT);  //commit and close connection
	        System.out.println("Connection commit successful");
	    }   
	}catch (com.amfam.reuse.db.error.AmfamDatabaseConnectionException adce) {
	        System.out.println("Connection not established");
	        System.out.println(adce.toString());
	    }
	}
	
}