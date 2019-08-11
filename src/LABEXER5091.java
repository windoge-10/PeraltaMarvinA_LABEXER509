import java.sql.*;
public class LABEXER5091 {
    public static void main(String[] args) {
        String query = "select * from samdb101.samdb101";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","marvinperalta","09177500499");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                System.out.println("Account No: " + rs.getString(1));
                System.out.println("Surname: " + rs.getString(2));
                System.out.println("First Name: " + rs.getString(3));
            }
        } catch (SQLException ex) {
            while (ex != null) {
                System.out.println("SQL Exception: " + ex.getMessage());
                ex = ex.getNextException();
            }
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
        }
    }
}