
package Process;

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
}
