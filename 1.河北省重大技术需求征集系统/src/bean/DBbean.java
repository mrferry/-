package bean;

import java.sql.*;

public class DBbean {
	 String driverStr = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	 String connStr = "jdbc:sqlserver://localhost:1433; DatabaseName=HBZJK";
	 String dbusername = "sa";
	 String dbpassword = "123456";
	 Connection conn ;
	 Statement stmt ;

	public DBbean() {
		try {
			Class.forName(driverStr);
			conn = DriverManager.getConnection(connStr, dbusername, dbpassword);
			stmt = conn.createStatement();
		} catch (Exception ex) {
			System.out.println("�޷�ͬ���ݿ⽨�����ӣ�");
		}
	}

	public int executeUpdate(String s) {
		int result = 0;
		try {
			result = stmt.executeUpdate(s);
		} catch (Exception ex) {
			System.out.println("ִ�и��´���");
		}
		return result;
	}

	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception ex) {
			System.out.println("ִ�в�ѯ����");
		}
		return rs;
	}

	public void close() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
		}
	}
}
