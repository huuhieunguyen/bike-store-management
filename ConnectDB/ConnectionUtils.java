
package ConnectDB;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Huu Hieu
 */
public class ConnectionUtils {

     /**
     *
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
   public static Connection getMyConnection() throws SQLException,
          ClassNotFoundException {
                return ConnectionOracle.getOracleConnection();
  }
 
  //
  // Test Connection ...
  //
  public static void main(String[] args) throws SQLException,
          ClassNotFoundException {
 
      System.out.println("Get connection ... ");
 
      // Lấy ra đối tượng Connection kết nối vào database.
      Connection conn = ConnectionUtils.getMyConnection();
 
      System.out.println("Get connection " + conn);
 
      System.out.println("Done!");
  }
}
