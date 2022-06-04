/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HOME
 */
public class SanPham {

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
    
    public String getTensp(String masp) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT TENSP FROM SANPHAM WHERE MASP = '" + masp + "'";
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
