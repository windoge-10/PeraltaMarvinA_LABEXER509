import java.sql.*;
public class LABEXER5093 {
    public static void main(String [] args)
    {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","marvinperalta","09177500499");
            Statement sta = con.createStatement();
            int c = sta.executeUpdate("UPDATE samdb101.samdb101 set First_Name='network', Surname='nirva' where Account_No=5555");
                    System.out.println("Record updated");

        sta.close();
        con.close();
    } catch (Exception e) {
        System.err.println("Exception: "+e.getMessage());
    }
}
}