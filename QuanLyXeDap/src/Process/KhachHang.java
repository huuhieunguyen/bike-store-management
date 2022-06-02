
package Process;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Huu Hieu
 */
public class KhachHang {
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
    
}
