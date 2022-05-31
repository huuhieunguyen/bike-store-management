/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;
import ConnectDB.ConnectionUtils;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class SanPhamDao {
    public boolean update(SanPham sp) throws Exception{
        String strCall="{call sp_upd_sp(?,?,?,?,?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            caSt.setString(1, sp.getMaSP());
            caSt.setString(2, sp.getTenSP());
            caSt.setString(3, sp.getDvt());
            caSt.setString(4, sp.getNuocSX());
            caSt.setFloat(5, sp.getDonGia());     
            
            return caSt.executeUpdate() >0;
        }
    }
    public boolean delete(SanPham sp) throws Exception{
        String strCall="{call sp_del_sp(?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            caSt.setString(1, sp.getMaSP());  
            return caSt.executeUpdate() >0;
        }
    }
    public boolean insert(SanPham sp) throws Exception{
        String strCall="{call sp_ins_sp(?,?,?,?,?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            caSt.setString(1, sp.getMaSP());
            caSt.setString(2, sp.getTenSP());
            caSt.setString(3, sp.getDvt());
            caSt.setString(4, sp.getNuocSX());
            caSt.setFloat(5, sp.getDonGia());     
            
            return caSt.executeUpdate() >0;
        }
    }
    public String getTenSP(String masp){
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT TENSP FROM SANPHAM WHERE MASP = '" +masp+ "'";
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
    

    public String getDVT(String masp) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT DVT FROM SANPHAM WHERE MASP = '" + masp + "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }

    public String getNuocsx(String masp) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT NUOCSX FROM SANPHAM WHERE MASP = '" + masp + "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }

    public String getDonGia(String masp) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT DONGIA FROM SANPHAM WHERE MASP = '" + masp + "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
}
