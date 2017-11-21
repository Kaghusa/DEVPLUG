
package Operation;

import java.sql.*;

public class postproposition {
java.util.Date dt = new java.util.Date();
 java.sql.Date date = new java.sql.Date(dt.getTime());
 
  dbconnect cn=new dbconnect();
   public void fbdata(String UserName,String DOB,String Email,String Photo,String City,String Sex,String Action) throws SQLException, ClassNotFoundException
        {
                 if(Action.equals("INSERT"))
            {
              String SQL= "insert into User(UserName,DOB,Email,Photo,City,Sex) values ('"+UserName+"','"+DOB+"','"+Email+"','"+Photo+"','"+City+"','"+Sex+"')";
               
                                cn.connection();
                               cn.Stmt.execute(SQL);
                     }
        }
     public   void fbregister(int Level,String Country,int ProgramID,int UserCategoryID,String Name,String Tel,String Action) throws SQLException,ClassNotFoundException
                                  {
                                     
                                       if(Action.equals("INSERT"))
                                     {
           
                                      String SQL = "update User set LevelID="+Level+",ProgramID="+ProgramID+", UserCategoryID="+UserCategoryID+", Country='"+Country+"',Tel='"+Tel+"' where UserName = '"+Name+"' ";
                                     cn.connection();
                                        cn.Stmt.execute(SQL);
                                       }
                             
                               }
      public void registration1(String UserName,String Passwd,String Email,String Tel,String Photo,String Action) throws SQLException, ClassNotFoundException
        {
         
                               if(Action.equals("INSERT"))
                               {
                               String SQL="insert into User (UserName,Passwd,Email,Tel,Photo) values ('"+UserName+"','"+Passwd+"','"+Email+"','"+Tel+"','"+Photo+"')";
                               cn.connection();
                                        cn.Stmt.execute(SQL);
                               } 
        }
      public   void registration(int Level,String Country,String City,String Sex,String DOB,int ProgramID,int UserCategoryID,String Action,String Email) throws SQLException,ClassNotFoundException
                                  {
                                    
                                      
                                       if(Action.equals("UPDATE"))
                                 {
           
                                       String SQL=" update User set LevelID="+Level+", Country='"+Country+"', City='"+City+"', Sex='"+Sex+"', DOB='"+DOB+"', DateTime='"+date+"', ProgramID="+ProgramID+",  UserCategoryID="+UserCategoryID+" where Email='"+Email+"' ";
                                        cn.connection();
                                        cn.Stmt.execute(SQL);
                                       }
                             
                               }
     
   
      
    //this is the method to post a proposition
    public void postpropositionn(String PropositionContent, java.sql.Timestamp date ,int DomainID,int UserID,String Action) throws SQLException,ClassNotFoundException
                                  {
                                     
                               if(Action.equals("INSERT"))
                               {
                               String SQL="insert into Proposition (PropositionContent,Datetime,DomainID,UserID) values ('"+PropositionContent+"','"+date+"',"+DomainID+","+UserID+")";
                               cn.connection();
                               cn.Stmt.execute(SQL);
                               }
                               
                                  
                                      
                                  }
    //method to requestPartener

  //  private static void PatnerRequest(String patReqContent, Timestamp date, int i, int i0, String insert) {
    //    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    //}
 
    public void PatnerRequest(String PatReqContent, java.sql.Timestamp date, int DomainID, int ProgramID,int UserID ,String Action ) throws SQLException, ClassNotFoundException
    {  //connect cn=new dbconnect();
        if (Action.equals("INSERT"))
        {
        String SQL="insert into PartnerRequest (PatReqContent,DateTime,DomainID,ProgramID,UserID) values ('"+PatReqContent+"','"+date+"',"+DomainID+","+ProgramID+","+UserID+")";
        cn.connection();
                               cn.Stmt.execute(SQL);
    }
    }
    //this is the method to request a service
  //  public  void requestservice(String ReqServContent,java.sql.Timestamp date,int DomainID,int UserID,String Action) throws SQLException, ClassNotFoundException{
    //   dbconnect cp=new dbconnect();
     //if(Action.equals("INSERT")) 
     //{
     
   //  String SQL="insert into RequestService (ReqServContent,Datetime,DomainID,UserID) values ('"+ReqServContent+"','"+date+"',"+DomainID+","+UserID+")";
     // cp.connexion();
      //cp.stmt.execute(SQL);
     //} 
    //}   
    
    //this is a method to set interview
 // public  void makeinterview(java.sql.Timestamp date,int DomainID,String InterviewDescription,int OppID,int PrototypeID,String Action) throws SQLException, ClassNotFoundException 
   //{
   //dbconnect ci=new dbconnect();
    //if(Action.equals("INSERT")) 
    //{
    //String SQL="insert into Interview (DateTime,UserID,InterviewDescription,OppID,PrototypeID) values ('"+date+"',"+DomainID+",'"+InterviewDescription+"',"+OppID+","+PrototypeID+")";
    //ci.connexion();
    //ci.stmt.execute(SQL);
    //}
   
   
 //  }
   
   
   public void comment(String CommentContent,int concenedID,java.sql.Timestamp date,int UserID,String Action) throws SQLException, ClassNotFoundException
   {
  
    if(Action.equals("INSERT")) 
    {
    String SQL = "insert into Comment (CommentContent,ConcernedID,DateTime,UserID) values ('"+CommentContent+"',"+concenedID+",'"+date+"',"+UserID+")";
     cn.connection();
                               cn.Stmt.execute(SQL);
    }
   }
   public void shareExperience(String ExperienceContent,java.sql.Timestamp date,int UserID,String Action) throws SQLException,ClassNotFoundException
   {
    dbconnect ce=new dbconnect();
    if(Action.equals("INSERT"))
       {
       String SQL = "insert into Experience (ExperienceContent, DateTime,UserID) values ('"+ExperienceContent+"','"+date+"',"+UserID+");";
        cn.connection();
                               cn.Stmt.execute(SQL);
       }
   
   }
   
   public void Resources(String ResourceDescription,String ResourcePDF,String ResourceRef1,String ResourceRef2,String ResourceRef3,String ResourceRef4,String ResourceRef5,java.sql.Timestamp DateTime,int ProgramID,String Action) throws SQLException,ClassNotFoundException
   {
   
   String SQL="insert into Resources(ResourceDescription,ProjectDocPDF,ProjectIcon,ResourceRef2,ResourceRef3,ResourceRef4,ResourceRef5,Datetime,ProgramID) values ('"+ResourceDescription+"','"+ResourcePDF+"','"+ResourceRef1+"','"+ResourceRef2+"','"+ResourceRef3+"','"+ResourceRef4+"','"+ResourceRef5+"','"+DateTime+"',"+ProgramID+")";
     cn.connection();
                               cn.Stmt.execute(SQL);
   }
   
    public void Project(String ProjectDescription,String ProjectDocPDF,String ProjectIcon,int UserID,int TeamID,int DomainID,String Action) throws SQLException,ClassNotFoundException
   {
   dbconnect cr=new dbconnect();
   String SQL="insert into Project(ProjectDescription,ProjectDocPDF,ProjectIcon,UserID,TeamID,DomainID) values ('"+ProjectDescription+"','"+ProjectDocPDF+"','"+ProjectIcon+"',"+UserID+","+TeamID+","+DomainID+")";
     cn.connection();
                               cn.Stmt.execute(SQL);
   }
  //cart method
  //    public  void cart(java.sql.Timestamp date,int UserID,int PrototypeID,String Action) throws SQLException,ClassNotFoundException
   //{
     //dbconnect ca=new dbconnect();
     //if(Action.equals("INSERT"))
      // {
       //String SQL = "insert into Cart (DateTime, UserID,PrototypeID) values ('"+date+"',"+UserID+","+PrototypeID+");";
       //ca.connexion();
       //ca.stmt.execute(SQL);
       //}
   
   //}
      
      public void registration(int Level,String UserName,String Passwd,String Email,String Country,String City,String Tel,String Sex,java.sql.Date DOB,java.sql.Date date ,String Photo,int ProgramID,int FieldID,int UserCategoryID,String Action) throws SQLException,ClassNotFoundException
                                  {
                                       
                               if(Action.equals("INSERT"))
                               {
                               String SQL="insert into User (UserName,Passwd,Email,Tel,Photo) values ('"+UserName+"','"+Passwd+"','"+Email+"','"+Tel+"','"+Photo+"')";
                                cn.connection();
                               cn.Stmt.execute(SQL);
                               }
                               else if(Action.equals("UPDATE"))
                                       {
                                       String SQL=" update User set Level="+Level+", Country='"+Country+"', City='"+City+"', Sex='"+Sex+"', DOB='"+DOB+"', DateTime='"+date+"',Photo='"+Photo+"', ProgramID="+ProgramID+", FieldID="+FieldID+", UserCategoryID="+UserCategoryID+" where Email='"+Email+"' ";
                                          cn.connection();
                               cn.Stmt.execute(SQL);
                                       }
                             
                               }
     
      
      public void approveRequest(int MentorID,int UserID,String Action) throws SQLException ,ClassNotFoundException
      
      {
      
       if(Action.equals("UPDATE"))
       {
       String SQL="update MentorRequest set Status=1 where MentorID="+MentorID+" and UserID="+UserID+" ";
         cn.connection();
                               cn.Stmt.execute(SQL);
       }
      }
      
      
      public void Favorite(int ResourceID,int UserID,String Action) throws SQLException ,ClassNotFoundException
      {
     
      if(Action.equals("INSERT"))
      {
      String SQL="insert into Favorite (ResourceID,UserID) values ("+ResourceID+","+UserID+")";
       cn.connection();
                               cn.Stmt.execute(SQL);
      }
      }
      public void  MentorMMsg(String MsgContent,java.sql.Timestamp Date,int SenderID,int ReceiverID,String Action) throws SQLException, ClassNotFoundException
      {
          
          if(Action.equals("INSERT"))
          {
          String SQL="insert into MentorMMsg (MsgContent,date,SenderID,ReceiverID) values ('"+MsgContent+"',date,"+SenderID+","+ReceiverID+")";
            cn.connection();
                               cn.Stmt.execute(SQL);
          }
      
      }
       public void AdminDeveloper(String NotificationContent,int UserID,int AdminID,java.sql.Timestamp date,String Action) throws SQLException,ClassNotFoundException
                                  {
                                      
                               if(Action.equals("INSERT"))
                               {
                               String SQL="insert into AdminDeveloper (NotificationContent,UserID,AdminID,Date) values ('"+NotificationContent+"',"+UserID+","+AdminID+",'"+date+"')";
                                cn.connection();
                               cn.Stmt.execute(SQL);
                               }
     
                                  }
        public void AdminMentor(String NotifFicationContent,int UserID,int AdminID,java.sql.Timestamp date,String Action) throws SQLException,ClassNotFoundException
                                  {
                                      
                               if(Action.equals("INSERT"))
                               {
                               String SQL="insert into AdminMentor (NotifFicationContent,UserID,AdminID,Date) values ('"+NotifFicationContent+"',"+UserID+","+AdminID+",'"+date+"')";
                                cn.connection();
                               cn.Stmt.execute(SQL);
                               }
     
                                 }
        
        
   //     public void prototype(String PrototypeContent,String PrototypeLink,String PrototypePic1,String PrototypePic2,String PrototypePic3,String PrototypePic4,String PrototypePic5,String Dec1,String Dec2, String Dec3,String Dec4,String Dec5,int FieldID,int UserID,java.sql.Date date ,String  ProjectName,String  Action) throws SQLException, ClassNotFoundException
    //{
      //  dbconnect cn=new dbconnect();
        //if (Action.equals("INSERT"))
        //{
          //         String SQL="insert into Prototype (PrototypeContent,PrototypeLink,PrototypePic1,Dec1,PrototypePic2,Dec2,PrototypePic3,Dec3,PrototypePic4,Dec4,PrototypePic5,Dec5,FieldID,UserID,Date,ProjectName) values ('"+PrototypeContent+"','"+PrototypeLink+"','"+PrototypePic1+"','"+Dec1+"','"+PrototypePic2+"','"+Dec2+"','"+PrototypePic3+"','"+Dec3+"','"+PrototypePic4+"','"+Dec4+"','"+PrototypePic5+"','"+Dec5+"',"+FieldID+","+UserID+",'"+date+"','"+ProjectName+"')";
            //      cn.connexion();
              //  cn.stmt.execute(SQL);
        //}
    //}
  public void Team(String DomainName,java.sql.Timestamp DateTime,int UserID,String Action) throws SQLException ,ClassNotFoundException
  {
 
  if(Action.equals("INSERT"))
  {
  String SQL="insert into Team(DomainName,DateTime,UserID) values ('"+DomainName+"','"+DateTime+"',"+UserID+")";
    cn.connection();
                               cn.Stmt.execute(SQL);
  }
  }
        
  public void TeamChat(int TeamID,int UserID,String MsgContent,java.sql.Timestamp Date,String Action) throws SQLException, ClassNotFoundException
  {
  
  if(Action.equals("INSERT"))
  {
      String SQL="inert into TeamChat(TeamID,UserID,MsgContent,Date) values ("+TeamID+","+UserID+",'"+MsgContent+"',Date) ";
        cn.connection();
                               cn.Stmt.execute(SQL);
  }
  }  
  
  public void TeamMembers(int TeamID,int UserID,String Action) throws SQLException,ClassNotFoundException
  {
  
  if(Action.equals("INSERT"))
  {
  String SQL="insert into TeamMembers(TeamID,UserID) values ("+TeamID+","+UserID+")";
    cn.connection();
                               cn.Stmt.execute(SQL);
  }
  }
  
  public void Partner(int UserID , int PatReqID,String Action) throws SQLException,ClassNotFoundException
  {
   
   if(Action.equals("INSERT"))
   {
   String SQL="insert into Partner(UserID,PatReqID) values ("+UserID+","+PatReqID+")";
    cn.connection();
                               cn.Stmt.execute(SQL);
   }
   
  }
  
  public void Opportunity(String OppContent,int DomainID,int UserID,String Action) throws SQLException,ClassNotFoundException
  {
      
  if(Action.equals("INSERT"))
  {
  String SQL="insert into Opportunity (OppContent,DomainID,UserID) values ('"+OppContent+"',"+DomainID+","+UserID+")";
   cn.connection();
                               cn.Stmt.execute(SQL);
  }
  }
  
  public  void MentorReq(int MentorID,int UserID,int Status,java.sql.Timestamp Date,String Action) throws SQLException ,ClassNotFoundException
  {
    
      if(Action.equals("INSERT"))
      {
      String SQL="insert into MentorRequest(MentorID,UserID,Status,DateTime) values ("+MentorID+","+UserID+","+Status+",'"+Date+"') ";
       cn.connection();
                               cn.Stmt.execute(SQL);
      }
  
  }
    
//  public static void main(String [] args) throws SQLException, ClassNotFoundException{
//        java.util.Date dt = new java.util.Date();
//        java.sql.Timestamp date = new java.sql.Timestamp(dt.getTime());
//    
//String Action=" ";
//    
// 
       // MentorMMsg(12,"sdhfghsd",date,23,23,"INSERT");
//first approach
//Action ="INSERT";
//registration(1,"UserName","Passwd","Email","Country","City","078","M",date,date,"Photo",1,1,1,Action);
//Action="UPDATE";
//registration(1,"UserName","Passwd","Email","Country","City","078","M",date,date,"Photo",1,1,1,Action);
//registration("username","passwd","email@ict.cv",3,"jshdf","INSERT");
  //    PatnerRequest("PatReqContent",date,1,1,1,"INSERT");
 //     postpropositionn("wdfssw", date ,1,1,"INSERT");
//requestservice("Chickson", date ,1 ,1,"INSERT");
//makeinterview("adsfsf",date,1,"INSERT");
 //     comment("Matata conyo",1,date,1,"INSERT");
 //     shareExperience("SowetoMusicdfgdg",date,1,"INSERT");
//cart(date,1,1,"INSERT");
//   Resources("ResourceDescription","ResourcePDF","ResourceRef1","ResourceRef2","ResourceRef3","ResourceRef4","ResourceRef5",date,1,"INSERT"); 
  //    AdminMentor("GgpsniyajSDFSDFSDr",4,1, date ,"INSERT");
  //    AdminDeveloper("Gpsnirfgdgdfgd435jour",12,1, date ,"INSERT");
      //Project("ProjectDescription","ProjectDocPDF","ProjectIcon",1,1,1,"INSERT");
  //    Favorite(1,1,"INSERT");
    //  TeamChat(1,1,"This is the mssage content for test",date,"INSERT");
 //     Team("DomainName",date,1,"INSERT");
  //    TeamMembers(1,1,"INSERT");
   //   Partner(1,4,"INSERT");
  //    Opportunity("Opportunity ",1,1,"INSERT");
//    }
    //   MentorReq(1,1,1,date,"INSERT");
  }

  

