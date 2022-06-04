<<<<<<< Updated upstream

package Process;

import ConnectDB.ConnectionUtils;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;


public class SanPham {
    /**
    * @author Nguyen Huu Hieu
    */
    // Tao List thuoc tinh Khach Hang
    private static List<String> SanPham = new ArrayList<>();
    // Them cac thuoc tinh (phan tu) vao List Khach Hang
    public static List<String> getDataSP(){
        SanPham = new ArrayList<>();
        SanPham.add("MÃ SP");
        SanPham.add("TÊN SP");
//        SanPham.add("DVT");
        SanPham.add("NƯỚC SẢN XUẤT");
//        SanPham.add("ĐƠN GIÁ");
//        SanPham.add("TỔNG SL");
        
        return SanPham;
    }
    
    /**
    * @author Tran Ngoc My Phuong
    */
    private String maSP, tenSP, dvt, nuocSX;
    private float donGia;
    private int tongSL;

    // Ham Khoi tao Cunstructor khong tham so
    public SanPham() {
    }

    // Ham Khoi tao Cunstructor co tham so
    public SanPham(String maSP, String tenSP, String dvt, String nuocSX, float donGia, int tongSL) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.dvt = dvt;
        this.nuocSX = nuocSX;
        this.donGia = donGia;
        this.tongSL = tongSL;
    }

    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getDvt() {
        return dvt;
    }

    public void setDvt(String dvt) {
        this.dvt = dvt;
    }

    public String getNuocSX() {
        return nuocSX;
    }

    public void setNuocSX(String nuocSX) {
        this.nuocSX = nuocSX;
    }

    public float getDonGia() {
        return donGia;
    }

    public void setDonGia(float donGia) {
        this.donGia = donGia;
    }

    public int getTongSL() {
        return tongSL;
    }

    public void setTongSL(int tongSL) {
        this.tongSL = tongSL;
    }

    // Goi store procedure cap nhat san pham
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
    
    // Goi store procedure xoa san pham
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
    
        // Goi store procedure them san pham
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
=======
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author HOME
 */
public class SanPham {

    public String getTensp(String masp) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT TENSP FROM SANPHAM WHERE MASP = '" + masp + "'";
>>>>>>> Stashed changes
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getString(1);
            }
            return i;
<<<<<<< Updated upstream
        }
        catch(Exception e){
=======
        } catch (Exception e) {
>>>>>>> Stashed changes
            System.out.println(e);
        }
        return i;
    }
<<<<<<< Updated upstream
    
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
    
=======
>>>>>>> Stashed changes
}
