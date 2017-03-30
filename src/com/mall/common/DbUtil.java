package com.mall.common;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;


public class DbUtil{

	private PreparedStatement pstmt = null;
 
	private Connection con = null;
    private static String driver;
    private static String url;
    private static String user;
    private static String pwd;
    //static语句块初始化字段信息
    static{
        try {
            Properties properties = new Properties();
            properties.load(DbUtil.class.getClassLoader().getResourceAsStream("/db.properties"));
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            user = properties.getProperty("username");
            pwd = properties.getProperty("password");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	public DbUtil() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,
					user, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Connection getCon() {
		return con;
	}

	public void close() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
