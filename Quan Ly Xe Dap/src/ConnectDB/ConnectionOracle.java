
package ConnectDB;

import java.sql.*;
/**
 *
 * @author Huu Hieu
 */
public class ConnectionOracle {
    public static Connection getOracleConnection() throws ClassNotFoundException,
            SQLException {

        String hostName = "localhost";
        String sid = "orcl";
        String userName = "c##ProJava";
        String password = "myuser";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        String connectionURL = "jdbc:oracle:thin:@" + hostName + ":1521:" + sid;

        Connection conn = DriverManager.getConnection(connectionURL, userName,
                password);
        return conn;
    }
}
