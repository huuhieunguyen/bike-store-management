
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author My Phuong & Huu Hieu
 */
public class KhuyenMai {
    private String maKM, noiDung;
    private float dinhMuc, phanTram;

    public KhuyenMai() {
    }

    public KhuyenMai(String maKM, String noiDung, float dinhMuc, float phanTram) {
        this.maKM = maKM;
        this.noiDung = noiDung;
        this.dinhMuc = dinhMuc;
        this.phanTram = phanTram;
    }

    public String getMaKM() {
        return maKM;
    }

    public void setMaKM(String maKM) {
        this.maKM = maKM;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public float getDinhMuc() {
        return dinhMuc;
    }

    public void setDinhMuc(float dinhMuc) {
        this.dinhMuc = dinhMuc;
    }

    public float getPhanTram() {
        return phanTram;
    }

    public void setPhanTram(float phanTram) {
        this.phanTram = phanTram;
    }
    public int themKhuyenMai(String maKM, String noiDung, float dinhMuc, float phanTram) {
        int i = 0;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "INSERT INTO KHUYENMAI VALUES('"+maKM+"','"+noiDung+"',"+dinhMuc+","+phanTram+")";
            Statement stat = con.createStatement();
            i = stat.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    public int suaKhuyenMai(String maKM, String noiDung, float dinhMuc, float phanTram) {
        int i = 0;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "UPDATE KHUYENMAI SET MAKM='"+maKM+"', NOIDUNG='"+noiDung+"',DINHMUC='"+dinhMuc+"',PHANTRAM='"+phanTram+"'WHERE MAKM='"+maKM+"'";
            Statement stat = con.createStatement();
            i = stat.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    public int xoaKhuyenMai(String maKM) {
        int i = 0;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "DELETE FROM KHUYENMAI WHERE MAKM='"+maKM+"'";
            Statement stat = con.createStatement();
            i = stat.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }

    public String getNoiDung(String makm) {
        String i = null;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT NOIDUNG FROM KHUYENMAI WHERE MAKM = '" + makm + "'";
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
    public float getDinhMuc(String makm) {
        float i = 0;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT DINHMUC FROM KHUYENMAI WHERE MAKM = '" + makm + "'";
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
    public float getPhanTram(String makm) {
        float i = 0;

        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String query = "SELECT PHANTRAM FROM KHUYENMAI WHERE MAKM = '" + makm + "'";
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
    
    // Tao List Hoa Don
    private static List<String> KhuyenMai = new ArrayList<>();
    // Them cac thuoc tinh (phan tu) vao List Hoa Don
    public static List<String> getDataKM(){
        KhuyenMai.add("MÃ KM");
        KhuyenMai.add("NỘI DUNG");
        KhuyenMai.add("ĐỊNH MỨC");
        KhuyenMai.add("PHẦN TRĂM");
        
        return KhuyenMai;
    }
}
