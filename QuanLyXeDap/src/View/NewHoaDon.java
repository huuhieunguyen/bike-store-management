package View;

import ConnectDB.ConnectionUtils;
import Process.Menu;
import Process.SanPham;
import java.awt.Font;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

/**
 *
 * @author Nguyen Huu Hieu
 */
public class NewHoaDon extends javax.swing.JFrame {

    private String manv;

//    ArrayList<String> listSanPham = null;
    DefaultTableModel tblModel_SearchSP, tblModel_CTHD = new DefaultTableModel();

    Locale locale = new Locale("en", "EN");
    NumberFormat en = NumberFormat.getInstance(locale);

    /**
     * Creates new form NewHoaDon
     */
    public NewHoaDon() {
        initComponents();

        tblModel_SearchSP = (DefaultTableModel) tblSearchSP.getModel();
        tblModel_CTHD = (DefaultTableModel) tblCTHD_TT.getModel();
        tblModel_SearchSP.setRowCount(0);
        tblModel_CTHD.setRowCount(0);

        showComBoBoxData();

        // Khoi tao bang CTHD_ThanhToan
        initTable_CTHD_ThanhToan();

        // Khoi tao bang SanPham
        initTable_SP();

        // Load du lieu tu table SanPham trong csdl len jTable
        loadSanPham();

        // Dieu chinh do rong cot trong bang
        HeaderAdjust();

    }

    public NewHoaDon(String ma_nv) {

        initComponents();
        
        // Tu dong nhap manv vao thanh toan HD
        manv = ma_nv;
        txtMaNV.setText(ma_nv);
        
        // Tu dong nhap ma cua hang vao thanh toan HD
        Menu m = new Menu();
        txtMaCH.setText(m.getMadv(ma_nv));
        
        txtNgayTaoHD.setText(java.time.LocalDate.now().toString());

        tblModel_SearchSP = (DefaultTableModel) tblSearchSP.getModel();
        tblModel_CTHD = (DefaultTableModel) tblCTHD_TT.getModel();
        tblModel_SearchSP.setRowCount(0);
        tblModel_CTHD.setRowCount(0);

        showComBoBoxData();

        // Khoi tao bang CTHD_ThanhToan
        initTable_CTHD_ThanhToan();

        // Khoi tao bang SanPham
        initTable_SP();

        // Load du lieu tu table SanPham trong csdl len jTable
        loadSanPham();

        // Dieu chinh do rong cot trong bang
        HeaderAdjust();
    }
    
    public NewHoaDon(String ma_nv, String makh) {

        initComponents();
        
        // Tu dong nhap manv vao thanh toan HD
        manv = ma_nv;
        txtMaNV.setText(ma_nv);
        
        // Tu dong nhap ma cua hang vao thanh toan HD
        Menu m = new Menu();
        txtMaCH.setText(m.getMadv(ma_nv));
        
        txtNgayTaoHD.setText(java.time.LocalDate.now().toString());
        txtMaKH.setText(makh);
        
        tblModel_SearchSP = (DefaultTableModel) tblSearchSP.getModel();
        tblModel_CTHD = (DefaultTableModel) tblCTHD_TT.getModel();
        tblModel_SearchSP.setRowCount(0);
        tblModel_CTHD.setRowCount(0);

        showComBoBoxData();

        // Khoi tao bang CTHD_ThanhToan
        initTable_CTHD_ThanhToan();

        // Khoi tao bang SanPham
        initTable_SP();

        // Load du lieu tu table SanPham trong csdl len jTable
        loadSanPham();

        // Dieu chinh do rong cot trong bang
        HeaderAdjust();
    }

    // Load du lieu (items) tu List SanPham trong package Process vao combobox
    private void showComBoBoxData() {
        List<String> data = SanPham.getDataSP();
        for (String str : data) {
            cbxLoaiThongTin_SP.addItem(str);
        }
    }

    // Khoi tao bang SanPham
    private void initTable_SP() {
        String tieuDe[] = {"MÃ SP", "TÊN SP", "DVT", "NƯỚC SX", "GIÁ"};
        tblModel_SearchSP.setColumnIdentifiers(tieuDe);
    }

    // Khoi tao bang CTHD_ThanhToan
    private void initTable_CTHD_ThanhToan() {
        String tieuDe[] = {"MASP", "TÊN SP", "ĐƠN GIÁ", "SL", "THÀNH TIỀN"};
        tblModel_CTHD.setColumnIdentifiers(tieuDe);

        //Set tieu de
        JTableHeader THeader = tblCTHD_TT.getTableHeader();
        THeader.setFont(new Font("Segoe UI", Font.BOLD, 12));
        ((DefaultTableCellRenderer) THeader.getDefaultRenderer()).setHorizontalAlignment(JLabel.CENTER);
//        tblCTHD_TT.setModel(tblModel_CTHD);
    }

    // Load du lieu tu table SanPham trong csdl len jTable
    private void loadSanPham() {
        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String queryHD = "select * from SANPHAM";
            PreparedStatement ps = con.prepareStatement(queryHD);
            ResultSet rs = ps.executeQuery();

            // Xoa toan bo dong du lieu trong table
            tblModel_SearchSP.setRowCount(0);
            while (rs.next()) {
                String[] row = new String[]{
                    rs.getString("MASP"),
                    rs.getString("TENSP"),
                    rs.getString("DVT"),
                    rs.getString("NUOCSX"),
                    rs.getString("DONGIA")
                };
                tblModel_SearchSP.addRow(row);
            }

            // Cap nhat du lieu duoc hien thi trong table
            tblModel_SearchSP.fireTableDataChanged();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e.getMessage());
            e.printStackTrace();
        }

        // Gan tblModel_SearchSP vao jTable tblSearchSP
        tblSearchSP.setModel(tblModel_SearchSP);
        setVisible(true);
        tblSearchSP.setDefaultEditor(Object.class, null);
    }

    // Dieu chinh do rong cot trong bang
    public void HeaderAdjust() {
        //Set do rong cua bang
        tblSearchSP.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_LAST_COLUMN);

        tblSearchSP.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jScrollPane1.setViewportView(tblSearchSP);

        if (tblSearchSP.getColumnModel().getColumnCount() > 0) {
            tblSearchSP.getColumnModel().getColumn(0).setMinWidth(50);
            tblSearchSP.getColumnModel().getColumn(0).setMaxWidth(50);
            tblSearchSP.getColumnModel().getColumn(1).setMinWidth(240);
            tblSearchSP.getColumnModel().getColumn(1).setMaxWidth(240);
            tblSearchSP.getColumnModel().getColumn(2).setMinWidth(43);
            tblSearchSP.getColumnModel().getColumn(2).setMaxWidth(43);
            tblSearchSP.getColumnModel().getColumn(3).setMinWidth(100);
            tblSearchSP.getColumnModel().getColumn(3).setMaxWidth(100);
            tblSearchSP.getColumnModel().getColumn(4).setMinWidth(120);
            tblSearchSP.getColumnModel().getColumn(4).setMaxWidth(120);
        }
        //Set tieu de
        JTableHeader THeader = tblSearchSP.getTableHeader();
        THeader.setFont(new Font("Segoe UI", Font.BOLD, 12));
        ((DefaultTableCellRenderer) THeader.getDefaultRenderer()).setHorizontalAlignment(JLabel.CENTER);
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
        jLabel5 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txtMaKH = new javax.swing.JTextField();
        txtNgayTaoHD = new javax.swing.JFormattedTextField();
        jButton1 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblSearchSP = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblCTHD_TT = new javax.swing.JTable();
        btnXoa = new javax.swing.JButton();
        jLabel6 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jFormattedTextField2 = new javax.swing.JFormattedTextField();
        jLabel7 = new javax.swing.JLabel();
        btnHuy = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txtTuKhoa_SP = new javax.swing.JTextField();
        cbxLoaiThongTin_SP = new javax.swing.JComboBox<>();
        btnSearch_LoaiTT_SP = new javax.swing.JButton();
        txtMaCH = new javax.swing.JTextField();
        txtMaNV = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(153, 153, 0));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("TẠO HÓA ĐƠN");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(51, 102, 0));
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel2.setText("MÃ NHÂN VIÊN");

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(51, 102, 0));
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel5.setText("MÃ KHÁCH HÀNG");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(51, 102, 0));
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel3.setText("MÃ CỬA HÀNG");

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(51, 102, 0));
        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel4.setText("NGÀY TẠO");

        txtMaKH.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMaKHActionPerformed(evt);
            }
        });

        txtNgayTaoHD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtNgayTaoHDActionPerformed(evt);
            }
        });

        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Search.png"))); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        tblSearchSP.setModel(new javax.swing.table.DefaultTableModel(
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
        tblSearchSP.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblSearchSPMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblSearchSP);

        tblCTHD_TT.setModel(new javax.swing.table.DefaultTableModel(
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
        tblCTHD_TT.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        tblCTHD_TT.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                tblCTHD_TTKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                tblCTHD_TTKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                tblCTHD_TTKeyTyped(evt);
            }
        });
        jScrollPane2.setViewportView(tblCTHD_TT);

        btnXoa.setBackground(new java.awt.Color(255, 204, 204));
        btnXoa.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Delete.png"))); // NOI18N
        btnXoa.setText("XÓA");
        btnXoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaActionPerformed(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel6.setText("TỔNG");

        jFormattedTextField2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/VND.png"))); // NOI18N

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jFormattedTextField2, javax.swing.GroupLayout.DEFAULT_SIZE, 139, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel7)
                    .addComponent(jFormattedTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        btnHuy.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        btnHuy.setForeground(new java.awt.Color(255, 0, 102));
        btnHuy.setText("HỦY");
        btnHuy.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnHuyActionPerformed(evt);
            }
        });

        jButton4.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jButton4.setForeground(new java.awt.Color(0, 102, 255));
        jButton4.setText("THANH TOÁN");

        jLabel8.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel8.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel8.setText("LOẠI THÔNG TIN");

        jLabel9.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel9.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel9.setText("TỪ KHÓA");

        cbxLoaiThongTin_SP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbxLoaiThongTin_SPActionPerformed(evt);
            }
        });

        btnSearch_LoaiTT_SP.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resources/Search.png"))); // NOI18N
        btnSearch_LoaiTT_SP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSearch_LoaiTT_SPActionPerformed(evt);
            }
        });

        txtMaNV.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMaNVActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 1378, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(19, 19, 19)
                                .addComponent(jLabel8)
                                .addGap(18, 18, 18)
                                .addComponent(cbxLoaiThongTin_SP, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(29, 29, 29)
                                .addComponent(jLabel9)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtTuKhoa_SP)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(btnSearch_LoaiTT_SP))
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 528, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(btnXoa)
                        .addGap(18, 18, 18)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 529, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addGap(18, 18, 18)
                                .addComponent(txtMaKH, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(txtMaNV, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(159, 159, 159)
                                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 113, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(txtMaCH, javax.swing.GroupLayout.PREFERRED_SIZE, 153, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(67, 67, 67)
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 113, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(txtNgayTaoHD, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(71, 71, 71)
                                .addComponent(jLabel6))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(27, 27, 27)
                                .addComponent(jButton4)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(56, 56, 56)
                                .addComponent(btnHuy)))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 53, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtNgayTaoHD, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtMaCH, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtMaNV, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(txtMaKH, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jButton1))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(154, 154, 154)
                                .addComponent(jLabel6)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(38, 38, 38)
                                .addComponent(jButton4)
                                .addGap(36, 36, 36)
                                .addComponent(btnHuy))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(92, 92, 92)
                                .addComponent(btnXoa)))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 34, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnSearch_LoaiTT_SP)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel8)
                                .addComponent(cbxLoaiThongTin_SP, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel9)
                                .addComponent(txtTuKhoa_SP, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 400, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 400, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(33, 33, 33))))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 1375, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(8, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblSearchSPMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblSearchSPMouseClicked
        // TODO add your handling code here:
        DefaultTableModel tableModelChuyen, tableModelNhan = new DefaultTableModel();
        tableModelChuyen = (DefaultTableModel) tblSearchSP.getModel();

        String masp = tableModelChuyen.getValueAt(tblSearchSP.getSelectedRow(), 0).toString();
        String tensp = tableModelChuyen.getValueAt(tblSearchSP.getSelectedRow(), 1).toString();
        String gia = tableModelChuyen.getValueAt(tblSearchSP.getSelectedRow(), 4).toString();

        int soLuong = 1;
        long thanhTien = soLuong * Long.parseLong(gia);

        tableModelNhan = (DefaultTableModel) tblCTHD_TT.getModel();
        tableModelNhan.addRow(new Object[]{masp, tensp, gia, soLuong, thanhTien});
    }//GEN-LAST:event_tblSearchSPMouseClicked

    private void cbxLoaiThongTin_SPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbxLoaiThongTin_SPActionPerformed
        // TODO add your handling code here:
        int index = cbxLoaiThongTin_SP.getSelectedIndex();
        if (index > 0) {
            String selectedValue = SanPham.getDataSP().get(index);
            System.out.println("Lay gia tri thong qua chi so cua List SanPham trong cbb: "
                    + selectedValue);
        }
    }//GEN-LAST:event_cbxLoaiThongTin_SPActionPerformed

    private void btnSearch_LoaiTT_SPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSearch_LoaiTT_SPActionPerformed
        // TODO add your handling code here:
        try ( Connection con = ConnectionUtils.getMyConnection()) {
            String sql = null;
            switch (cbxLoaiThongTin_SP.getSelectedIndex()) {
                case 0:
                    sql = "select * from SANPHAM WHERE UPPER(MASP) like '%";
                    break;
                case 1:
                    sql = "select * from SANPHAM WHERE UPPER(TENSP) like '%";
                    break;
                case 2:
                    sql = "select * from SANPHAM WHERE UPPER(NUOCSX) like '%";
                    break;
                default:
                    break;
            }

            sql += txtTuKhoa_SP.getText().toUpperCase() + "%'";
            System.out.print(sql);
            Statement stat = con.createStatement();

            ResultSet rs = stat.executeQuery(sql);

            tblModel_SearchSP.setRowCount(0);
            while (rs.next()) {
                tblModel_SearchSP.addRow(new Object[]{
                    rs.getString("MASP"),
                    rs.getString("TENSP"),
                    rs.getString("DVT"),
                    rs.getString("NUOCSX"),
                    en.format(rs.getLong("DONGIA"))
                });
            }
            tblModel_SearchSP.fireTableDataChanged();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e.getMessage());
            e.printStackTrace();
        }
        tblSearchSP.setModel(tblModel_SearchSP);
        setVisible(true);

    }//GEN-LAST:event_btnSearch_LoaiTT_SPActionPerformed

    private void btnXoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaActionPerformed
        // TODO add your handling code here:
        tblModel_CTHD = (DefaultTableModel) tblCTHD_TT.getModel();

        if (tblCTHD_TT.getSelectedRowCount() > 0) {
            tblModel_CTHD.removeRow(tblCTHD_TT.getSelectedRow());
        } else {
            if (tblCTHD_TT.getRowCount() == 0) {
                JOptionPane.showMessageDialog(this, "Bảng trống!");
            } else {
                JOptionPane.showMessageDialog(this, "Hãy chọn một sản phẩm để xóa!");
            }
        }
    }//GEN-LAST:event_btnXoaActionPerformed

    private void tblCTHD_TTKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tblCTHD_TTKeyPressed
        // TODO add your handling code here:
    }//GEN-LAST:event_tblCTHD_TTKeyPressed

    private void tblCTHD_TTKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tblCTHD_TTKeyReleased
        // TODO add your handling code here:
        tblModel_CTHD = (DefaultTableModel) tblCTHD_TT.getModel();
        long a = Long.parseLong(tblModel_CTHD.getValueAt(tblCTHD_TT.getSelectedRow(), 2) + "");
        int b = Integer.parseInt(tblModel_CTHD.getValueAt(tblCTHD_TT.getSelectedRow(), 3) + "");
        tblModel_CTHD.setValueAt(a * b, tblCTHD_TT.getSelectedRow(), 4);
    }//GEN-LAST:event_tblCTHD_TTKeyReleased

    private void tblCTHD_TTKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tblCTHD_TTKeyTyped
        // TODO add your handling code here:
    }//GEN-LAST:event_tblCTHD_TTKeyTyped

    private void btnHuyActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnHuyActionPerformed
        // TODO add your handling code here:
        tblModel_CTHD.setRowCount(0);

    }//GEN-LAST:event_btnHuyActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        TimKiemKH_HD kh = new TimKiemKH_HD(manv);
        this.setVisible(false);
        kh.setVisible(true);

    }//GEN-LAST:event_jButton1ActionPerformed

    private void txtMaNVActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMaNVActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMaNVActionPerformed

    private void txtMaKHActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMaKHActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMaKHActionPerformed

    private void txtNgayTaoHDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtNgayTaoHDActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtNgayTaoHDActionPerformed

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
            java.util.logging.Logger.getLogger(NewHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(NewHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(NewHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(NewHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new NewHoaDon().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnHuy;
    private javax.swing.JButton btnSearch_LoaiTT_SP;
    private javax.swing.JButton btnXoa;
    private javax.swing.JComboBox<String> cbxLoaiThongTin_SP;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton4;
    private javax.swing.JFormattedTextField jFormattedTextField2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblCTHD_TT;
    private javax.swing.JTable tblSearchSP;
    private javax.swing.JTextField txtMaCH;
    private javax.swing.JTextField txtMaKH;
    private javax.swing.JTextField txtMaNV;
    private javax.swing.JFormattedTextField txtNgayTaoHD;
    private javax.swing.JTextField txtTuKhoa_SP;
    // End of variables declaration//GEN-END:variables
}
