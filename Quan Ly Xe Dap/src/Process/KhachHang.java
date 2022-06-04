/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HOME
 */
public class KhachHang {

    private static List<String> KhachHang = new ArrayList<>();
    // Them cac thuoc tinh (phan tu) vao List Khach Hang
    public static List<String> getDataKH(){
        KhachHang.add("MÃ KHÁCH HÀNG");
        KhachHang.add("HỌ TÊN");
//        KhachHang.add("ĐỊA CHỈ");
//        KhachHang.add("GIỚI TÍNH");
        KhachHang.add("SĐT");
//        KhachHang.add("NGÀY SINH");
        
        return KhachHang;
    }
    
    public String getTenKH(String makh){
        String i = null;

        try (Connection con = ConnectionUtils.getMyConnection()){
            String query = "SELECT HOTEN FROM KHACHHANG WHERE MAKH = '" +makh+ "'";
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
    
    public int themKhachHang(String ten, String gioitinh, String sdt, Date ngSinh, String dchi) {
        int i = 0;
        try ( java.sql.Connection con = ConnectionUtils.getMyConnection()) {
            String strCall="{call sp_ins_kh(?,?,?,?,?)}";
            CallableStatement caSt = con.prepareCall(strCall);
            
            caSt.setString(1, ten);
            caSt.setString(2, gioitinh);
            caSt.setString(3, sdt);
            
            java.util.Date utilStarDate1 = ngSinh;
            java.sql.Date ngaysinh = new java.sql.Date(utilStarDate1.getTime());
            
            caSt.setDate(4, ngaysinh);
            caSt.setString(5, dchi);

            i = caSt.executeUpdate(); //tra ve so dong bi tac dong

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return i;
    }
}
