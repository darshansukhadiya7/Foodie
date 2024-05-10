package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider 
{
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/food_ordering";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    public static Connection getcon()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            System.out.println("connect with database..");
            return con;
        }
        catch (ClassNotFoundException e) 
        {
            System.out.println(e);
            return null; // Return null or handle the exception appropriately
        }
        catch (SQLException v)
        {
            System.out.println(v);
            return null;
        }
    }
    
    public static void main(String args[])
    {
        getcon();
    }
}
