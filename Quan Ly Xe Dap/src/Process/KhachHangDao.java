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
public class KhachHangDao {
    //Phuong
    public boolean update(KhachHang kh) throws Exception{
        String strCall="{call sp_upd_kh(?,?,?,?,?,?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            java.util.Date utilStartDate =kh.getNgSinh();
            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
            caSt.setString(1, kh.getMaKH());
            caSt.setString(2, kh.getHoTen());
            caSt.setString(3, kh.getGioiTinh());
            caSt.setString(4, kh.getSdt());
            caSt.setDate(5, sqlStartDate);
            caSt.setString(6, kh.getDiaChi());
            
            
            return caSt.executeUpdate() >0;
        }
    }
    //Phuong
    public int insert(String makh, String ten, String gioitinh, String sdt, Date ngSinh, String dchi) {
        int i = 0;
        try ( java.sql.Connection con = ConnectionUtils.getMyConnection()) {
            String strCall="{call sp_ins_kh(?,?,?,?,?,?)}";
            CallableStatement caSt = con.prepareCall(strCall);
            
            caSt.setString(1, makh);
            caSt.setString(2, ten);
            caSt.setString(3, gioitinh);
            caSt.setString(4, sdt);
            
            java.util.Date utilStarDate1 = ngSinh;
            java.sql.Date ngaysinh = new java.sql.Date(utilStarDate1.getTime());
            
            caSt.setDate(5, ngaysinh);
            caSt.setString(6, dchi);

            i = caSt.executeUpdate(); //tra ve so dong bi tac dong

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return i;
    }
    //Phuong
    public boolean delete(KhachHang kh) throws Exception{
        String strCall="{call sp_del_kh(?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            caSt.setString(1, kh.getMaKH());  
            return caSt.executeUpdate() >0;
        }
    }
    //Phuong
    public String getTenKH(String makh) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT HOTEN FROM KHACHHANG WHERE MAKH = '" + makh + "'";
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
    //Phuong
    public String getGioiTinh(String makh) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT GIOITINH FROM KHACHHANG WHERE MAKH = '" + makh + "'";
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
    //Phuong
    public String getSDT(String makh) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT SDT FROM KHACHHANG WHERE MAKH = '" + makh + "'";
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
    //Phuong
    public Date getNgSinh(String makh) {
        Date i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT NGSINH FROM KHACHHANG WHERE MAKH = '" + makh + "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getDate(1);
            }
            return i;
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    //Phuong
    public String getDiaChi(String makh) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT DIACHI FROM KHACHHANG WHERE MAKH = '" + makh + "'";
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
    ///Phuong
    public String TaoMaKH()throws Exception{
        String strCall="{? = call func_taomakh()}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            caSt.registerOutParameter(1, Types.CHAR);
            caSt.executeUpdate();
            String makh=caSt.getString(1);
            return makh;
        }
    }
}
