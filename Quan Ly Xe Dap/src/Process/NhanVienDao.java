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
import java.sql.Types;

/**
 *
 * @author Administrator
 */
public class NhanVienDao {
    public String getTenNV(String manv) {
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
    //Phuong
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
    public Date getNgSinh(String manv) {
        Date i = null;

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
    public Date getNgVL(String manv) {
        Date i = null;

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
