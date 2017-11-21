/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Operation;

import java.sql.*;

/**
 *
 * @author boniface
 */
public class dbconnect

{
    public Connection con=null;
    public String Username="root";
    public String Passwword="Kansi@5995";
   public  Statement Stmt=null;
    PreparedStatement psmt=null;
    public  String Url="jdbc:mysql://127.0.0.1:3306/DevPlug?useUnicode=yes&characterEncoding=UTF-8";
    public Connection getcon() throws SQLException
        {
            con=DriverManager.getConnection(Url, Username, Passwword);
            return con;
        }
    public void GetDrive() throws ClassNotFoundException
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
    public String uploadUrl()
        {
            String url="/home/espoir/NetBeansProjects/Devplug/web";
           return url; 
        }
    public void connection() throws ClassNotFoundException, SQLException
            {   GetDrive();
                getcon();
                Stmt=getcon().createStatement();
                
            }
}
