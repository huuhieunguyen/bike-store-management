package Process;
import ConnectDB.ConnectionUtils;
import java.sql.*;

/**
 *
 * @author DOAN TU QUYNH
 */
public class Menu {
    public String getTennv(String manv){
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT HOTEN FROM NHANVIEN WHERE MANV = '" +manv+ "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return i;
    }
    
    public String getMadv(String manv){
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT MADV FROM NHANVIEN WHERE MANV = '" +manv+ "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return i;
    }
    
    public String getDiaChiCH(String mach){
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT DIACHI FROM CUAHANG WHERE MACH = '" +mach+ "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return i;
    }
    
    public String getSDT_CH(String mach){
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT SDT FROM CUAHANG WHERE MACH = '" +mach+ "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return i;
    }
    
    public String getTenpb(String mapb){
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT TENPB FROM PHONGBAN WHERE MAPB = '" +mapb+ "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return i;
    }
}
