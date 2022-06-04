/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author HOME
 */
public class HoaDon_Process {
    public String getMaHD () {
        String rs = null;
        try (Connection con = ConnectionUtils.getMyConnection()) {
            CallableStatement stmt = con.prepareCall("{? = call func_taomahd}");
            stmt.registerOutParameter(1, OracleTypes.CHAR);
            stmt.execute();
            rs = stmt.getString(1);
        } catch (Exception ex) {
            System.out.print(ex.toString());
        }
        return rs;
    }
    
    public Float getPhanTramGiamGia(long trigia) {
        float rs = 0;
        try (Connection con = ConnectionUtils.getMyConnection()) {
            CallableStatement stmt = con.prepareCall("{? = call func_pTramKM_hd(?)}");
            stmt.setLong(2, trigia);
            stmt.registerOutParameter(1, OracleTypes.FLOAT);
            stmt.execute();
            rs = stmt.getFloat(1);
        } catch (Exception ex) {
            System.out.print(ex.toString());
        }
        return rs;
    }
    
    public String getMaKM (long trigia) {
        String rs = null;
        try (Connection con = ConnectionUtils.getMyConnection()) {
            CallableStatement stmt = con.prepareCall("{? = call func_makm_hd(?)}");
            stmt.setLong(2, trigia);
            stmt.registerOutParameter(1, OracleTypes.CHAR);
            stmt.execute();
            rs = stmt.getString(1);
        } catch (Exception ex) {
            System.out.print(ex.toString());
        }
        return rs;
    }
    
    public String getNoiDungKM(long trigia){
        String makm = this.getMaKM(trigia);
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT NOIDUNG FROM KHUYENMAI WHERE MAKM = '" +makm+ "'";
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
    
    public int ktSoLuongSP (String masp, String manv, int sl) {
        int rs = 0;
        try (Connection con = ConnectionUtils.getMyConnection()) {
            CallableStatement stmt = con.prepareCall("{? = call func_ktsl_sp(?,?,?)}");
            stmt.setString(2, masp);
            stmt.setString(3, manv);
            stmt.setInt(4, sl);
            stmt.registerOutParameter(1, OracleTypes.INTEGER);
            stmt.execute();
            rs = stmt.getInt(1);
        } catch (Exception ex) {
            System.out.print(ex.toString());
        }
        return rs;
    }
        
    public int InsertHD (String mahd, Date ngayhd, String makh, String manv) {
        int rs;
        try (Connection con = ConnectionUtils.getMyConnection()){
            java.util.Date utilStarDate1 = ngayhd;
            java.sql.Date nghd = new java.sql.Date(utilStarDate1.getTime());
            
            CallableStatement stmt = con.prepareCall("{call sp_ins_hd (?,?,?,?)}");
            stmt.setString(1, mahd);
            stmt.setDate(2, nghd);
            stmt.setString(3, makh);
            stmt.setString(4, manv);
            rs = stmt.executeUpdate();
            return rs;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
    
    public int InsertCTHD (String mahd, String masp, String manv, int sl) {
        int rs;
        try (Connection con = ConnectionUtils.getMyConnection()){
            CallableStatement stmt = con.prepareCall("{call sp_ins_cthd (?,?,?,?)}");
            stmt.setString(1, mahd);
            stmt.setString(2, masp);
            stmt.setString(3, manv);
            stmt.setInt(4, sl);
            rs = stmt.executeUpdate();
            return rs;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
    
}
