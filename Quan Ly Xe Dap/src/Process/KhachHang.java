/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class KhachHang {
    private String maKH, hoTen, gioiTinh, sdt, diaChi;
    private Date ngSinh;

    public KhachHang() {
    }

    public KhachHang(String maKH, String hoTen, String gioiTinh, String sdt, Date ngSinh, String diaChi) {
        this.maKH = maKH;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.sdt = sdt;
        java.util.Date utilStartDate =ngSinh;
            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
        this.ngSinh = sqlStartDate;
        this.diaChi = diaChi;
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

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
   
}
