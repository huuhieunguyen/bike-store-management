/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import java.util.Date;

/**
 *
 * @author Administrator
 */
public class NhanVien {
    private String maKH, hoTen, gioiTinh, sdt, diaChi, CMND, maNgQL, maDV;
    private Date ngSinh, ngVL;
    private float heso;

    public NhanVien() {
    }

    public NhanVien(String maKH, String hoTen, String gioiTinh, String sdt, String diaChi, String CMND, String maNgQL, String maDV, Date ngSinh, Date ngVL, float heso) {
        this.maKH = maKH;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.sdt = sdt;
        this.diaChi = diaChi;
        this.CMND = CMND;
        this.maNgQL = maNgQL;
        this.maDV = maDV;
        this.ngSinh = ngSinh;
        this.ngVL = ngVL;
        this.heso = heso;
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

    public String getCMND() {
        return CMND;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }

    public String getMaNgQL() {
        return maNgQL;
    }

    public void setMaNgQL(String maNgQL) {
        this.maNgQL = maNgQL;
    }

    public String getMaDV() {
        return maDV;
    }

    public void setMaDV(String maDV) {
        this.maDV = maDV;
    }

    public Date getNgSinh() {
        return ngSinh;
    }

    public void setNgSinh(Date ngSinh) {
        this.ngSinh = ngSinh;
    }

    public Date getNgVL() {
        return ngVL;
    }

    public void setNgVL(Date ngVL) {
        this.ngVL = ngVL;
    }

    public float getHeso() {
        return heso;
    }

    public void setHeso(float heso) {
        this.heso = heso;
    }
    
    
}
