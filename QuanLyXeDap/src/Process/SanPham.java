
package Process;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Huu Hieu
 */
public class SanPham {
    // Tao List thuoc tinh Khach Hang
    private static List<String> SanPham = new ArrayList<>();
    // Them cac thuoc tinh (phan tu) vao List Khach Hang
    public static List<String> getDataSP(){
        SanPham = new ArrayList<>();
        SanPham.add("MÃ SP");
        SanPham.add("TÊN SP");
//        SanPham.add("DVT");
        SanPham.add("NƯỚC SẢN XUẤT");
//        SanPham.add("ĐƠN GIÁ");
//        SanPham.add("TỔNG SL");
        
        return SanPham;
    }
}
