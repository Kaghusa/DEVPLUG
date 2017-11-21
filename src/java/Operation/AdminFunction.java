/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Operation;

import java.sql.SQLException;

/**
 *
 * @author boniface
 */
public class AdminFunction 

{
    dbconnect cn=  new  dbconnect();
    
    
    // Post Opportinity 
    public void Opportinity (String OppContent,String CompanyName,int UserID,java.sql.Timestamp dtime,String Action ) throws ClassNotFoundException, SQLException
        {
            if (Action.equals("INSERT"))
            {
            String SQL="insert into Opportunity (OppContent,CompanyName,UserID,dttime )values ('"+OppContent+"','"+CompanyName+"',"+UserID+",'"+dtime+"')";
            cn.connection();
            cn.Stmt.executeUpdate(SQL);
            }
        }
    // Post Event 
    public void Event (String EventName,String InstitutionName,String Description, java.sql.Timestamp dttime,String Action) throws ClassNotFoundException, SQLException
        
        {
            if (Action.equals("INSERT"))
                {
                    String SQL= "insert into Event (EventName,InstitutionName,Description,dttime)values ('"+EventName+"','"+InstitutionName+"','"+Description.trim()+"','"+dttime+"') ";
                    cn.connection();
                    cn.Stmt.executeUpdate(SQL);
                }
        }
    // Registration of a new admin 
    public  void Admin(String UserName,int ProgramID,String City,String Email ,String  Tel,String Passwd, String Action) throws ClassNotFoundException, SQLException
        {
            if (Action.equals("INSERT"))
                {
                    String SQL="insert into User (UserName, ProgramID,City,Email,Tel,Passwd,UserCategoryID) values ('"+UserName+"',"+ProgramID+",'"+City+"','"+Email+"','"+Tel+"','"+Passwd+"',3)";
                    cn.connection();
                    cn.Stmt.executeUpdate(SQL);
                }
            
        }
    // Changed Password 
    public void changePwd(int UserID, String Passwd,String Old, String Action ) throws SQLException, ClassNotFoundException
        {
            if (Action.equals("UPDATE"))
                {
                    String SQL= "Update User  set  Passwd='"+ Passwd+"' where UserID="+UserID+" and Passwd='"+Old+"'";
                    cn.connection();
                    cn.Stmt.executeUpdate(SQL);
                }
        }
    // insert idea comment 
    public void ideacomment (String CommentContent, int ConcernedID,java.sql.Timestamp DateTime,int UserID, String Action ) throws ClassNotFoundException, SQLException
        {
            if (Action.equals("INSERT"))
                {
                    String SQL="insert into Comment (CommentContent,ConcernedID,DateTime,UserID) values ('"+CommentContent+"',"+ConcernedID+",'"+DateTime+"',"+UserID+")";
                    cn.connection();
                    cn.Stmt.executeUpdate(SQL);
                }
        }
     public void Epcomment (String CommentContent, int ConcernedID,java.sql.Timestamp DateTime,int UserID, String Action ) throws ClassNotFoundException, SQLException
        {
            if (Action.equals("INSERT"))
                {
                    String SQL="insert into CommentExp (CommentContent,ConcernedID,DateTime,UserID) values ('"+CommentContent+"',"+ConcernedID+",'"+DateTime+"',"+UserID+")";
                    cn.connection();
                    cn.Stmt.executeUpdate(SQL);
                }
        }
     public void Patcomment (String CommentContent, int ConcernedID,java.sql.Timestamp DateTime,int UserID, String Action ) throws ClassNotFoundException, SQLException
        {
            if (Action.equals("INSERT"))
                {
                    String SQL="insert into CommentPat (CommentContent,ConcernedID,DateTime,UserID) values ('"+CommentContent+"',"+ConcernedID+",'"+DateTime+"',"+UserID+")";
                    cn.connection();
                    cn.Stmt.executeUpdate(SQL);
                }
        }
     public void createteam(String DomainName, java.sql.Timestamp time, String Action ) throws SQLException, ClassNotFoundException
        {
            if (Action.equals("INSERT"))
                {
                    String SQL ="insert into Team ( DomainName,DateTime) values ('"+DomainName+"','"+time+"') ";
                    cn.connection();
                    cn.Stmt.executeUpdate(SQL);
                }
            
        }
     public void AddMembers (int TeamID, int UserID, String Action ) throws SQLException, ClassNotFoundException
        {
            if (Action.equals("INSERT"))
            {
            String SQL="insert into  TeamMembers (TeamID,UserID) values ("+TeamID+","+UserID+")";
                     cn.connection();
                     cn.Stmt.executeUpdate(SQL);
            }
            if (Action.equals("UPDATE"))
                {
                    String SQL="update Team set UserID ="+UserID+" where  TeamID="+TeamID+"" ;
                    cn.connection();
                     cn.Stmt.executeUpdate(SQL);
                }
        }
     
    
    
}
