package Process;

import ConnectDB.ConnectionUtils;
import java.sql.*;

/**
 *
 * @author DOAN TU QUYNH
 */
public class TaiKhoan {

    public int ktDangNhap(String tenDN, String matkhau) {
        try ( Connection con = ConnectionUtils.getMyConnection()) {
            CallableStatement stmt = con.prepareCall("{? = call func_ktDangNhap (?, ?)}");
            stmt.setString(2, tenDN);
            stmt.setString(3, matkhau);
            stmt.registerOutParameter(1, Types.INTEGER);
            stmt.execute();
            
            return stmt.getInt(1);
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }
    
    public String getManv(String tenDN, String matkhau) {
        try ( Connection con = ConnectionUtils.getMyConnection()) {
            CallableStatement stmt = con.prepareCall("{? = call func_getManv (?, ?)}");
            stmt.setString(2, tenDN);
            stmt.setString(3, matkhau);
            stmt.registerOutParameter(1, Types.CHAR);
            stmt.execute();

            return stmt.getString(1);
        } catch (Exception e) {
            System.out.println(e);
        }
        return "";
    }
}