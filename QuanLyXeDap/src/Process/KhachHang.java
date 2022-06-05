
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Nguyen Huu Hieu
 */
public class KhachHang {
    /**
    * @author Nguyen Huu Hieu
    */
    // Tao List thuoc tinh Khach Hang
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
    
    /**
    * @author Tran Ngoc My Phuong
    */
    private String maKH, hoTen, gioiTinh, sdt, diaChi;
    private Date ngSinh;

    public KhachHang() {
    }

    public KhachHang(String maKH, String hoTen, String gioiTinh, String sdt, String diaChi, Date ngSinh) {
        this.maKH = maKH;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.sdt = sdt;
        this.diaChi = diaChi;
        java.util.Date utilStartDate =ngSinh;
            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
        this.ngSinh = sqlStartDate;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public Date getNgSinh() {
        java.util.Date utilStartDate =this.ngSinh;
            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
        return sqlStartDate;
    }

    public void setNgSinh(Date ngSinh) {
        java.util.Date utilStartDate =ngSinh;
            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
        this.ngSinh = sqlStartDate;
    }
    
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
    public int insert(String makh, String ten, String gioitinh, String sdt, java.sql.Date ngSinh, String dchi) {
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
    public java.sql.Date getNgSinh(String makh) {
        java.sql.Date i = null;

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
