package vn.iostar.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private final String serverName = "localhost";   // Server name
    private final String dbName = "database_web";     // Database name
    private final String portNumber = "1433";       // Default SQL Server port
    private final String instance = "";             // Nếu dùng SQLExpress thì để "SQLEXPRESS"

    public Connection getConnection() throws Exception {
        String url;
        
        if (instance != null && !instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + "\\" + instance + ":" + portNumber
                + ";databaseName=" + dbName
                + ";integratedSecurity=true"
                + ";encrypt=true;trustServerCertificate=true";
        } else {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                + ";databaseName=" + dbName
                + ";integratedSecurity=true"
                + ";encrypt=true;trustServerCertificate=true";
        }

        // Load driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        
        return DriverManager.getConnection(url);
    }
    
    public static void main(String[] args) {
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();
            if (conn != null) {
                System.out.println("✅ Kết nối thành công tới database!");
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
