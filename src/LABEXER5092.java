import java.sql.*;
public class LABEXER5092 {
    public static void main(String [] args) {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/samdb101","marvinperalta","09177500499");
            Statement sta = con.createStatement();
// insert 3 rows
            int count = 0;
            int c = sta.executeUpdate("INSERT INTO samdb101" +
                    " (Account_No, First_Name, Surname)"
                    + " VALUES (4444, 'Melo', 'Abante')");
            count = count + c;
            c = sta.executeUpdate("INSERT INTO samdb101"
                    + " (Account_No, First_Name, Surname)"
                    + " VALUES (5555, 'Melvin', 'Nipas')");
            count = count + c;
            c = sta.executeUpdate("INSERT INTO samdb101"
                    + " (Account_No, First_Name, Surname)"
                    + " VALUES (6666, 'Herbert', 'Semana')");
            count = count + c;
            System.out.println("Number of rows inserted: "+count);
            sta.close();
            con.close();
        }
        catch (Exception e) {
            System.err.println("Exception: "+e.getMessage());
        }
    }
}