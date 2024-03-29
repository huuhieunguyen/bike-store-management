/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package View;

import ConnectDB.ConnectionUtils;
import java.awt.Font;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Vector;
import javax.swing.JLabel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

/**
 *
 * @author User
 */
public class QL_NhanVien extends javax.swing.JFrame {

    /**
     * Creates new form QL_NhanVien
     */
    public QL_NhanVien() {
        initComponents();
    }
    private String manv;
    public void HeaderAdjust() {
        //Set do rong cua bang
        TableNV.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_LAST_COLUMN);

        TableNV.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jScrollPane1.setViewportView(TableNV);

        if (TableNV.getColumnModel().getColumnCount() > 0) {
            TableNV.getColumnModel().getColumn(0).setMinWidth(50);
            TableNV.getColumnModel().getColumn(0).setMaxWidth(50);
            TableNV.getColumnModel().getColumn(1).setMinWidth(140);
            TableNV.getColumnModel().getColumn(1).setMaxWidth(140);
            TableNV.getColumnModel().getColumn(2).setMinWidth(60);
            TableNV.getColumnModel().getColumn(2).setMaxWidth(60);
            TableNV.getColumnModel().getColumn(3).setMinWidth(90);
            TableNV.getColumnModel().getColumn(3).setMaxWidth(90);
            TableNV.getColumnModel().getColumn(4).setMinWidth(85);
            TableNV.getColumnModel().getColumn(4).setMaxWidth(85);
            TableNV.getColumnModel().getColumn(5).setMaxWidth(100);
            TableNV.getColumnModel().getColumn(5).setMinWidth(100);
            TableNV.getColumnModel().getColumn(6).setMaxWidth(70);
            TableNV.getColumnModel().getColumn(6).setMinWidth(70);
            TableNV.getColumnModel().getColumn(7).setMaxWidth(30);
            TableNV.getColumnModel().getColumn(7).setMinWidth(30);
            TableNV.getColumnModel().getColumn(8).setMaxWidth(20);
            TableNV.getColumnModel().getColumn(8).setMinWidth(20);
            TableNV.getColumnModel().getColumn(9).setMaxWidth(20);
            TableNV.getColumnModel().getColumn(9).setMinWidth(20);
        }
        //Set tieu de
        JTableHeader THeader = TableNV.getTableHeader();
        THeader.setFont(new Font("Segoe UI", Font.BOLD, 12));
        ((DefaultTableCellRenderer) THeader.getDefaultRenderer()).setHorizontalAlignment(JLabel.CENTER);
    }
    DefaultTableModel tbn = new DefaultTableModel();
    public void loadData() {
        String[] columnNames = {"Mã NV", "Họ tên", "Giới tính", "Số điện thoại", "Ngày sinh", "Địa chỉ","CMND","Ngày vào làm","Mã NGQL","Hệ số","Đơn vị"};
        tbn = new DefaultTableModel(columnNames, 0);
        try ( Connection con = ConnectionUtils.getMyConnection()) {
            int number;
            Vector row, column;
            column = new Vector();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * from NHANVIEN ORDER BY MANV");
            ResultSetMetaData metadata = rs.getMetaData();
            // tra ve so cot
            number = metadata.getColumnCount();

            while (rs.next()) {
                row = new Vector();
                for (int i = 1; i <= number; i++) {
                    // lay ra tieu de cua cac cot
                    row.addElement(rs.getObject(i));
                }
                tbn.addRow(row);
                TableNV.setModel(tbn);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        //Khong cho user edit
        TableNV.setDefaultEditor(Object.class, null);
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtTuKhoa = new javax.swing.JTextField();
        cbxLoaiThongTin = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        TableNV = new javax.swing.JTable();
        btnChon = new javax.swing.JButton();
        btnThem = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("DANH SÁCH NHÂN VIÊN");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel2.setText("TỪ KHÓA");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel3.setText("LOẠI THÔNG TIN");

        cbxLoaiThongTin.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Mã NV", "Họ tên", "Số điện thoại", "CMND", "Mã người quản lý", "Mã đơn vị" }));

        TableNV.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        TableNV.getTableHeader().setReorderingAllowed(false);
        TableNV.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TableNVMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(TableNV);

        btnChon.setBackground(new java.awt.Color(153, 153, 153));
        btnChon.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        btnChon.setForeground(new java.awt.Color(204, 255, 204));
        btnChon.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Selection.png"))); // NOI18N
        btnChon.setText("CHỌN");
        btnChon.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnChonActionPerformed(evt);
            }
        });

        btnThem.setBackground(new java.awt.Color(204, 255, 153));
        btnThem.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        btnThem.setForeground(new java.awt.Color(0, 153, 0));
        btnThem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Add.png"))); // NOI18N
        btnThem.setText("THÊM");
        btnThem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemActionPerformed(evt);
            }
        });

        jButton1.setBackground(new java.awt.Color(204, 204, 204));
        jButton1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jButton1.setForeground(new java.awt.Color(51, 51, 51));
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Backward (black).png"))); // NOI18N
        jButton1.setText("QUAY LẠI ");
        jButton1.setMaximumSize(new java.awt.Dimension(131, 38));
        jButton1.setMinimumSize(new java.awt.Dimension(131, 38));
        jButton1.setPreferredSize(new java.awt.Dimension(131, 38));
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Search16x16.png"))); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(99, 99, 99)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 248, Short.MAX_VALUE)
                .addComponent(btnChon)
                .addGap(29, 29, 29)
                .addComponent(btnThem, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(97, 97, 97))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 747, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(48, 48, 48))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(241, 241, 241)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(txtTuKhoa)
                    .addComponent(cbxLoaiThongTin, 0, 168, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton5)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(cbxLoaiThongTin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(12, 12, 12)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtTuKhoa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton5))
                .addGap(38, 38, 38)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnChon, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnThem, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(22, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnThemActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed

    private void btnChonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnChonActionPerformed
        // TODO add your handling code here:
        if(manv != null) {
            TT_NhanVien kh = new TT_NhanVien(manv);
            this.setVisible(false);
            kh.setVisible(true);
        }
    }//GEN-LAST:event_btnChonActionPerformed

    private void TableNVMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TableNVMouseClicked
        // TODO add your handling code here:
        manv = TableNV.getValueAt(TableNV.getSelectedRow(), 0) + "";
    }//GEN-LAST:event_TableNVMouseClicked

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
            java.util.logging.Logger.getLogger(QL_NhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(QL_NhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(QL_NhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(QL_NhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new QL_NhanVien().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable TableNV;
    private javax.swing.JButton btnChon;
    private javax.swing.JButton btnThem;
    private javax.swing.JComboBox<String> cbxLoaiThongTin;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton5;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField txtTuKhoa;
    // End of variables declaration//GEN-END:variables
}
