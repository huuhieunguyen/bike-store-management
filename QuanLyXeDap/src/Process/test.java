/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.*;
import java.util.Vector;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author HOME
 */
public class test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String manv = "NV01";
        try ( Connection conn = ConnectionUtils.getMyConnection()) {
            Connection con = ConnectionUtils.getMyConnection();

            Statement st = con.createStatement();
            CallableStatement stmt = con.prepareCall("{? = call func_ds_nhapkho}");
            stmt.registerOutParameter(1, OracleTypes.CURSOR);
            stmt.execute();
            ResultSet rs = (ResultSet) stmt.getObject(1);
            //int count = 0;
            while (rs.next()) {
                String ten = rs.getString(3);
                System.out.println(ten);
                //count++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        Menu q = new Menu();
    }

}
