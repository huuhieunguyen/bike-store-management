/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.*;
import java.util.*;
/**
 *
 * @author Administrator
 */
public class SanPham {
    private String maSP, tenSP, dvt, nuocSX;
    private float donGia;
    private int tongSL;

    public SanPham() {
    }

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
}
