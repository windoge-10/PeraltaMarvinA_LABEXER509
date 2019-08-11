import java.sql.*;
public class LABEXER5094 {
    public static void main(String [] args) {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","marvinperalta","09177500499");
            Statement sta = con.createStatement();
            int c = sta.executeUpdate("DELETE from samdb101.samdb101 where Account_No = 4444");
            System.out.println("Record Deleted");
            sta.close();
            con.close();
        }
        catch (Exception e) {
            System.err.println("Exception: "+e.getMessage());
        }
    }
}