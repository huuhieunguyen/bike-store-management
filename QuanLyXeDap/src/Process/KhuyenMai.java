
package Process;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author My Phuong & Huu Hieu
 */
public class KhuyenMai {
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
