
package Process;

import ConnectDB.ConnectionUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.sql. *;

/**
 *
 * @author Nguyen Huu Hieu
 */
public class SanPham {
    // Tao List thuoc tinh Khach Hang
    private static List<String> SanPham = new ArrayList<>();
    // Them cac thuoc tinh (phan tu) vao List Khach Hang
    public static List<String> getDataSP(){
        SanPham.add("MÃ SP");
        SanPham.add("TÊN SP");
        SanPham.add("DVT");
        SanPham.add("NƯỚC SẢN XUẤT");
        SanPham.add("ĐƠN GIÁ");
        SanPham.add("TỔNG SL");
        
        return SanPham;
    }
    
    /**
     * ArrayList Lay danh sach san pham
     * 
     * @return 
     */
//    public HashMap<String,String> getListSanPham() {
//        HashMap<String,String> listSanPham = new HashMap<>();
//        
//        try (Connection con = ConnectionUtils.getMyConnection()) {
//            String SQL = "SELECT * FROM SANPHAM";
//            Statement statement = con.createStatement();
//            ResultSet rs = statement.executeQuery(SQL);
//            while (rs.next()) {
//                listSanPham.put(
//                        rs.getString("MASP"),
////                        rs.getString("TENSP"),
////                        rs.getString("DVT"),
////                        rs.getString("NUOCSX"),
//                        rs.getString("DONGIA"),
//                        rs.getString("TONGSL")
//                    );
//            }
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
//        return listSanPham;
//    }
}
