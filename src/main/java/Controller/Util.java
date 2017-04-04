package com.Controller;
import argo.jdom.JdomParser;
import argo.jdom.JsonNode;
import argo.jdom.JsonRootNode;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.*;
import java.util.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;
import org.apache.log4j.Priority;

public class Util {
	private static Logger logger = Logger.getLogger(Util.class.getName());
	public Connection db()
    {
    	Connection connection = null;
    try {
    	

		//for local configuration
        /*Class.forName("com.mysql.jdbc.Driver");
        logger.info("Loading mysql from local context");
        //String url = "jdbc:mysql://127.0.0.1:10100/db8dad2d02e114ef6bc9d24e68367e33e"	
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/retaildb1","root","root"); 
        return connection;*/
    	
    	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    	String dbURL = "jdbc:sqlserver://10.224.86.189:1433;database=TestDB-DEV;user=sa;password=password-1";
	   // jdbc:sqlserver://HOSP_SQL1.company.com;user=name;password=abcdefg;database=Test
    	Connection conn = DriverManager.getConnection(dbURL);
    	return conn;

   } catch (Exception e) {
    	//logger.log(Priority.ERROR, e);
    	StringWriter sw = new StringWriter();
    	PrintWriter pw = new PrintWriter(sw);
    	e.printStackTrace(pw);
    	String str = sw.toString();
    	logger.error(str);
    	//logger.error("failed!", e);
        return connection;
    }
	

    }

}