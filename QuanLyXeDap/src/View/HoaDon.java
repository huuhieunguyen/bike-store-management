
package View;

import javax.swing.JOptionPane;
import java.sql.* ;
import ConnectDB.ConnectionUtils;
import Process.Hoa_Don;
import java.awt.Font;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import javax.swing.JLabel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

/**
 *
 * @author Nguyen Huu Hieu
 */
public class HoaDon extends javax.swing.JFrame {
    private String manv;
    
    DefaultTableModel tblModel;
    Locale locale = new Locale("en", "EN");
    NumberFormat en = NumberFormat.getInstance(locale);
    
    /**
     * Creates new form HoaDon
     */
    public HoaDon() {
        initComponents();
        
        //Load du lieu (items) tu List Hoa_Don trong Package Process vao combobox
        showComBoBoxData();
        
        // Khoi tao bang Hoa Don
        initTable_HD();
        
        // Load du lieu tu table HoaDon trong csdl len jTable
        loadHoaDon();
        
        // Dieu chinh do rong cot trong bang HD
        HeaderAdjust();
        
        // Load MaHD len combobox de tra cuu CTHD
        initComboBox_HD();
    }
    
    public HoaDon(String ma_nv){
        
<<<<<<< Updated upstream
=======
//        System.out.println(manv);
>>>>>>> Stashed changes
        initComponents();
        manv = ma_nv;

        
        //Load du lieu (items) tu List Hoa_Don trong Package Process vao combobox
        showComBoBoxData();
        
        // Khoi tao bang Hoa Don
        initTable_HD();
        
        // Load du lieu tu table HoaDon trong csdl len jTable
        loadHoaDon();
        
        // Dieu chinh do rong cot trong bang HD
        HeaderAdjust();
        
        // Load MaHD len combobox de tra cuu CTHD
        initComboBox_HD();
    }
    
    // Load du lieu (items) tu List Hoa_Don trong Package Process vao combobox
    private void showComBoBoxData(){
        List<String> data = Hoa_Don.getData();
        for (String str : data) {
            cbxLoaiThongTin.addItem(str);
        }
    }
    
    // Khoi tao bang Hoa Don
    private void initTable_HD(){
        tblModel = new DefaultTableModel();
        String tieuDe[] = {"MAHD", "NGHD", "MAKH", "MANV", "MAKM", "TRIGIA"};
        tblModel.setColumnIdentifiers(tieuDe);
    }
    
    // Load du lieu tu table HoaDon trong csdl len jTable
    private void loadHoaDon(){
        try(Connection con = ConnectionUtils.getMyConnection()){
           String queryHD = "select * from HOADON";
           PreparedStatement ps = con.prepareStatement(queryHD);
           ResultSet rs = ps.executeQuery();
           
           // Xoa toan bo dong du lieu trong table
           tblModel.setRowCount(0);
           while(rs.next()){
               String[] row = new String[]{
                 rs.getString("MAHD"),
                 rs.getString("NGHD"),
                 rs.getString("MAKH"), 
                 rs.getString("MANV"),
                 rs.getString("MAKM"),
                 en.format(rs.getLong("TRIGIA"))
               };
               tblModel.addRow(row);
           }
           
           // Cap nhat du lieu duoc hien thi trong table
           tblModel.fireTableDataChanged();
           
        }catch (Exception e){
            JOptionPane.showMessageDialog(this, e.getMessage());
            e.printStackTrace();
        }
        
        // Gan tblModel vao jTable tblHoaDon
        tblHoaDon.setModel(tblModel);
        setVisible(true);
        tblHoaDon.setDefaultEditor(Object.class, null);
    }
    
    // Dieu chinh do rong cot trong bang
    public void HeaderAdjust() {
        //Set do rong cua bang
        tblHoaDon.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_LAST_COLUMN);

        tblHoaDon.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jScrollPane1.setViewportView(tblHoaDon);

        if (tblHoaDon.getColumnModel().getColumnCount() > 0) {
            tblHoaDon.getColumnModel().getColumn(0).setMinWidth(50);
            tblHoaDon.getColumnModel().getColumn(0).setMaxWidth(50);
            tblHoaDon.getColumnModel().getColumn(1).setMinWidth(150);
            tblHoaDon.getColumnModel().getColumn(1).setMaxWidth(150);
            tblHoaDon.getColumnModel().getColumn(2).setMinWidth(80);
            tblHoaDon.getColumnModel().getColumn(2).setMaxWidth(80);
            tblHoaDon.getColumnModel().getColumn(3).setMinWidth(100);
            tblHoaDon.getColumnModel().getColumn(3).setMaxWidth(100);
            tblHoaDon.getColumnModel().getColumn(4).setMinWidth(120);
            tblHoaDon.getColumnModel().getColumn(4).setMaxWidth(120);
        }
        //Set tieu de
        JTableHeader THeader = tblHoaDon.getTableHeader();
        THeader.setFont(new Font("Segoe UI", Font.BOLD, 12));
        ((DefaultTableCellRenderer) THeader.getDefaultRenderer()).setHorizontalAlignment(JLabel.CENTER);
    }
    
    // Load MaHD len combobox de tra cuu CTHD
    private void initComboBox_HD(){
        try(Connection con = ConnectionUtils.getMyConnection()){
            String query = "select MAHD from HOADON";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            cbxHoaDon.removeAllItems();
            while(rs.next()){
                cbxHoaDon.addItem(rs.getString("MAHD"));
            }
            con.close();
        }catch (Exception e){
            JOptionPane.showMessageDialog(this, e.getMessage());
            e.printStackTrace();
        }
    }
    
    

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        PanelHoaDon = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblHoaDon = new javax.swing.JTable();
        btnTaoHD = new javax.swing.JButton();
        btnTraCuu = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtTuKhoa = new javax.swing.JTextField();
        cbxLoaiThongTin = new javax.swing.JComboBox<>();
        btnTimKiem = new javax.swing.JButton();
        cbxHoaDon = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        PanelHoaDon.setBackground(new java.awt.Color(204, 255, 204));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(153, 153, 0));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText(" HÓA ĐƠN");

        tblHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(tblHoaDon);

        btnTaoHD.setBackground(new java.awt.Color(153, 255, 204));
        btnTaoHD.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        btnTaoHD.setForeground(new java.awt.Color(51, 51, 0));
        btnTaoHD.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Add.png"))); // NOI18N
        btnTaoHD.setText("TẠO HÓA ĐƠN");
        btnTaoHD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTaoHDActionPerformed(evt);
            }
        });

        btnTraCuu.setBackground(new java.awt.Color(204, 255, 255));
        btnTraCuu.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        btnTraCuu.setForeground(new java.awt.Color(0, 102, 255));
        btnTraCuu.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Tra cuu (right).png"))); // NOI18N
        btnTraCuu.setText("TRA CỨU");
        btnTraCuu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTraCuuActionPerformed(evt);
            }
        });

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel3.setText("LOẠI THÔNG TIN");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel2.setText("TỪ KHÓA");

        txtTuKhoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtTuKhoaActionPerformed(evt);
            }
        });

        cbxLoaiThongTin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbxLoaiThongTinActionPerformed(evt);
            }
        });

        btnTimKiem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Search.png"))); // NOI18N
        btnTimKiem.setBorder(null);
        btnTimKiem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTimKiemActionPerformed(evt);
            }
        });

        cbxHoaDon.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbxHoaDonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout PanelHoaDonLayout = new javax.swing.GroupLayout(PanelHoaDon);
        PanelHoaDon.setLayout(PanelHoaDonLayout);
        PanelHoaDonLayout.setHorizontalGroup(
            PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(PanelHoaDonLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(txtTuKhoa)
                    .addComponent(cbxLoaiThongTin, javax.swing.GroupLayout.PREFERRED_SIZE, 168, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(btnTimKiem, javax.swing.GroupLayout.PREFERRED_SIZE, 49, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(195, 195, 195))
            .addGroup(PanelHoaDonLayout.createSequentialGroup()
                .addGap(49, 49, 49)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 634, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 49, Short.MAX_VALUE))
            .addGroup(PanelHoaDonLayout.createSequentialGroup()
                .addGap(119, 119, 119)
                .addComponent(cbxHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnTraCuu)
                .addGap(81, 81, 81)
                .addComponent(btnTaoHD)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        PanelHoaDonLayout.setVerticalGroup(
            PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelHoaDonLayout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(PanelHoaDonLayout.createSequentialGroup()
                        .addGroup(PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(cbxLoaiThongTin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(12, 12, 12)
                        .addGroup(PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(txtTuKhoa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(btnTimKiem, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(32, 32, 32)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(PanelHoaDonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnTaoHD)
                    .addComponent(btnTraCuu)
                    .addComponent(cbxHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(36, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(PanelHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(PanelHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnTaoHDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTaoHDActionPerformed
        // TODO add your handling code here:
        NewHoaDon hd = new NewHoaDon(manv);
        this.setVisible(false);
        hd.setVisible(true);
    }//GEN-LAST:event_btnTaoHDActionPerformed

    private void btnTraCuuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTraCuuActionPerformed
        // TODO add your handling code here:
        String maHD = cbxHoaDon.getSelectedItem().toString();
        
        CTHD form = new CTHD(maHD);
        form.setVisible(true);
    }//GEN-LAST:event_btnTraCuuActionPerformed

    private void cbxLoaiThongTinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbxLoaiThongTinActionPerformed
        // TODO add your handling code here:
        int index = cbxLoaiThongTin.getSelectedIndex();
        if(index > 0){
            String selectedValue = Hoa_Don.getData().get(index);
            System.out.println("Lay gia tri thong qua chi so cua List Hoa_Don trong cbb: "
            + selectedValue);
        }
    }//GEN-LAST:event_cbxLoaiThongTinActionPerformed

    private void txtTuKhoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTuKhoaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtTuKhoaActionPerformed

    private void btnTimKiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimKiemActionPerformed
        // TODO add your handling code here: 
        
        try(Connection con = ConnectionUtils.getMyConnection()){
            String sql = null;
            switch (cbxLoaiThongTin.getSelectedIndex()) {
                case 0:
                    sql = "select * from HOADON WHERE UPPER(MAHD) like '%";
                    break;
                case 1:
                    sql = "select * from HOADON WHERE NGHD like '%";
                    break;
                case 2:
                    sql = "select * from HOADON WHERE UPPER(MAKH) like '%";
                    break;
                case 3:
                    sql = "select * from HOADON WHERE UPPER(MANV) like '%";
                    break;
                case 4:
                    sql = "select * from HOADON WHERE TRIGIA like '%";
                    break;
                case 5:
                    sql = "select * from HOADON WHERE UPPER(MAKM) like '%";
                    break;
                default:
                    break;
            }
            
            sql +=txtTuKhoa.getText().toUpperCase()+"%'";
            System.out.print(sql);
            Statement stat = con.createStatement();

            ResultSet rs = stat.executeQuery(sql);
            
            tblModel.setRowCount(0);
            while(rs.next()){
                tblModel.addRow(new Object[] {
                    rs.getString("MAHD"),
                    rs.getString("NGHD"),
                    rs.getString("MAKH"), 
                    rs.getString("MANV"),
                    rs.getString("MAKM"),
                    en.format(rs.getLong("TRIGIA"))
                });
            }
            tblModel.fireTableDataChanged();
            
        }catch (Exception e){
            JOptionPane.showMessageDialog(this, e.getMessage());
            e.printStackTrace();
        }
        tblHoaDon.setModel(tblModel);
        setVisible(true);
    }//GEN-LAST:event_btnTimKiemActionPerformed

    private void cbxHoaDonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbxHoaDonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cbxHoaDonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(HoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(HoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(HoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(HoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new HoaDon().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel PanelHoaDon;
    private javax.swing.JButton btnTaoHD;
    private javax.swing.JButton btnTimKiem;
    private javax.swing.JButton btnTraCuu;
    private javax.swing.JComboBox<String> cbxHoaDon;
    private javax.swing.JComboBox<String> cbxLoaiThongTin;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblHoaDon;
    private javax.swing.JTextField txtTuKhoa;
    // End of variables declaration//GEN-END:variables
}
