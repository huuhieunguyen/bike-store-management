/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class NhanVien {
    private String maNV, hoTen, gioiTinh, sdt, diaChi, CMND, maNgQL, maDV;
    private Date ngSinh, ngVL;
    private float heso;

    public NhanVien() {
    }

    public NhanVien(String maNV, String hoTen, String gioiTinh, String sdt, String diaChi, String CMND, String maNgQL, String maDV, Date ngSinh, Date ngVL, float heso) {
        this.maNV = maNV;
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

    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maKH) {
        this.maNV = maKH;
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
    public boolean update(NhanVien nv) throws Exception{
        String strCall="{call sp_upd_nv(?,?,?,?,?,?,?,?,?,?,?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            java.util.Date utilStartDate =nv.getNgSinh();
            java.sql.Date ngSinh = new java.sql.Date(utilStartDate.getTime());
            java.util.Date utilStartDate1 =nv.getNgVL();
            java.sql.Date ngVL = new java.sql.Date(utilStartDate1.getTime());
            caSt.setString(1, nv.getMaNV());
            caSt.setString(2, nv.getHoTen());
            caSt.setString(3, nv.getGioiTinh());
            caSt.setString(4, nv.getSdt());
            caSt.setDate(5, ngSinh);     
            caSt.setString(6, nv.getDiaChi());
            caSt.setString(7, nv.getCMND());
            caSt.setDate(8, ngVL);
            caSt.setString(9, nv.getMaNgQL());
            caSt.setFloat(10, nv.getHeso());
            caSt.setString(11, nv.getMaDV());
            
            return caSt.executeUpdate() >0;
        }
    }
    
    // Goi store procedure xoa san pham
    public boolean delete(NhanVien nv) throws Exception{
        String strCall="{call sp_del_nv(?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            caSt.setString(1, nv.getMaNV());  
            return caSt.executeUpdate() >0;
        }
    }
    
        // Goi store procedure them san pham
    public boolean insert(NhanVien nv) throws Exception{
        String strCall="{call sp_ins_nv(?,?,?,?,?,?,?,?,?,?,?)}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            java.util.Date utilStartDate =nv.getNgSinh();
            java.sql.Date ngSinh = new java.sql.Date(utilStartDate.getTime());
            java.util.Date utilStartDate1 =nv.getNgVL();
            java.sql.Date ngVL = new java.sql.Date(utilStartDate1.getTime());
            caSt.setString(1, nv.getMaNV());
            caSt.setString(2, nv.getHoTen());
            caSt.setString(3, nv.getGioiTinh());
            caSt.setString(4, nv.getSdt());
            caSt.setDate(5, ngSinh);     
            caSt.setString(6, nv.getDiaChi());
            caSt.setString(7, nv.getCMND());
            caSt.setDate(8, ngVL);
            caSt.setString(9, nv.getMaNgQL());
            caSt.setFloat(10, nv.getHeso());
            caSt.setString(11, nv.getMaDV());
            
            return caSt.executeUpdate() >0;
        }
    }
    //Phuong
    public String getHoTen(String manv) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT HOTEN FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public String getGioiTinh(String manv) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT GIOITINH FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public String getSDT(String manv) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT SDT FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public java.sql.Date getNgSinh(String manv) {
        java.sql.Date i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT NGSINH FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public String getDiaChi(String manv) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT DIACHI FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public String getCMND(String manv) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT CMND FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public java.sql.Date getNgVL(String manv) {
        java.sql.Date i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT NGVL FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public String getMaNGQL(String manv) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT MA_NGQL FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public float getHeSo(String manv) {
        float i = 0;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT HESO FROM NHANVIEN WHERE MANV = '" + manv + "'";
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                i = rs.getFloat(1);
            }
            return i;
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    public String getMaDV(String manv) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT MADV FROM NHANVIEN WHERE MANV = '" + manv + "'";
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
    public String TaoMaNV()throws Exception{
        String strCall="{? = call func_taomanv()}";
        try(
                Connection con = ConnectionUtils.getMyConnection();
                CallableStatement caSt = con.prepareCall(strCall);
        ){
            caSt.registerOutParameter(1, Types.CHAR);
            caSt.executeUpdate();
            String manv=caSt.getString(1);
            return manv;
        }
    }
}
