<%-- 
    Document   : developer
    Created on : Nov 15, 2017, 12:35:49 AM
    Author     : mcganza
--%>
<%@page import="Operation.AdminFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Operation.dbconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Operation.postproposition"%>
<%@page import="java.util.Date"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>

<%
                //global variable
    if (session.getAttribute("Mname")==null )
        {
            response.sendRedirect("login.jsp");
        } 
   
    String username = session.getAttribute("Mname").toString(); 
    int id= Integer.parseInt(session.getAttribute("Mid").toString());
    String profile= session.getAttribute("Mprofile").toString();
        dbconnect cn=new dbconnect();                int ResourceID;
                int DomainID=0;
                int SenderID;
                int UserID;
                int AdminID;
                int ReceiverID;
                int ProgramID;
                int TeamID=0;
                int MentorID;
                int Status;
                int MsgID;
                String Action="";
                String MsgContent="";
                java.util.Date date=new Date();
                java.sql.Timestamp dte=new java.sql.Timestamp(date.getTime());

                 postproposition globalobj=new postproposition();
                 dbconnect ccc=new dbconnect();
                 
                 ccc.GetDrive();
                 ResultSet rs=null;
                 
                //parteneRrequest
                String PatReqContent="";
                if(request.getParameter("SubmitPat")!=null)
                {
                PatReqContent=request.getParameter("PatReqContent");
                DomainID=Integer.parseInt(request.getParameter("DomainID"));
                ProgramID=Integer.parseInt(request.getParameter("ProgramID"));
               // UserID=Integer.parseInt(request.getParameter("UserID"));
                Action="INSERT";
                UserID= id;
                globalobj.PatnerRequest(PatReqContent, dte, DomainID, ProgramID, UserID, Action);

                }


                //AdminDeveloper
                int NotificationID;
                String NotificationContent="";
                if(request.getParameter("SubmitAdminDev")!=null)
                {
                NotificationID=Integer.parseInt(request.getParameter("NotificationID"));
                NotificationContent=request.getParameter("NotificationContent");
                UserID=Integer.parseInt(request.getParameter("UserID"));
                AdminID=Integer.parseInt(request.getParameter("AdminID"));

                globalobj.AdminDeveloper(NotificationContent, UserID, AdminID, dte, Action);
                }



                //proposition

                String PropositionContent="";
                if(request.getParameter("SubmitProposition")!=null)
                {
                PropositionContent=request.getParameter("PropositionContent");
                DomainID=Integer.parseInt(request.getParameter("DomainID"));
                //UserID=Integer.parseInt(request.getParameter("UserID"));
                UserID= id;
                Action="INSERT";

                globalobj.postpropositionn(PropositionContent, dte, DomainID, UserID, Action);
                }

                //Share Experience

                String ExperienceContent="";
                if(request.getParameter("SubmitExperience")!=null)
                {
                ExperienceContent=request.getParameter("ExperienceContent");
                //UserID=Integer.parseInt(request.getParameter("UserID"));
                UserID= id;
                Action="INSERT";
                
                globalobj.shareExperience(ExperienceContent, dte, UserID, Action);
                }

                //Project
                String ProjectDescription="";
                String ProjectDocPDF="";
                String ProjectIcon="";
                if(request.getParameter("SubmitProject")!=null)
                {
                ProjectDescription=request.getParameter("ProjectDescription");
                ProjectDocPDF=request.getParameter("ProjectDocPDF");
                ProjectIcon=request.getParameter("ProjectIcon");
                UserID=Integer.parseInt(request.getParameter("UserID"));
                TeamID=Integer.parseInt(request.getParameter("TeamID"));
                DomainID=Integer.parseInt(request.getParameter("DomainID"));

                globalobj.Project(ProjectDescription, ProjectDocPDF, ProjectIcon, UserID, TeamID, DomainID, Action);
                }
                //favorate

             
                
                    String CommentContent="";
                    int ConcernedID;
                    AdminFunction op= new AdminFunction();
                   if (request.getParameter("SubmComm")!=null)
        {
            ConcernedID=Integer.parseInt(request.getParameter("adi"));
            CommentContent=request.getParameter("CommentContent");
           //UserID=(int)session.getAttribute("UserID");
            UserID= id ;
            Action="INSERT";
            op.ideacomment(CommentContent, (ConcernedID/2017), dte, UserID, Action);
            response.sendRedirect("mentor.jsp");
            
        }
                   // to insert the comment to the experience 
       
               if (request.getParameter("ExpCom")!=null)
        {
            ConcernedID=Integer.parseInt(request.getParameter("pxe"));
            CommentContent=request.getParameter("CommentContent");
           //UserID=(int)session.getAttribute("UserID");
            UserID= id;
            Action="INSERT";
            op.Epcomment(CommentContent, (ConcernedID/2017), dte, UserID, Action);
            response.sendRedirect("mentor.jsp");
            
        }
                 if (request.getParameter("PatCom")!=null)
        {
            ConcernedID=Integer.parseInt(request.getParameter("tap"));
            CommentContent=request.getParameter("CommentContent");
           //UserID=(int)session.getAttribute("UserID");
            UserID= id;
            Action="INSERT";
            op.Patcomment(CommentContent, (ConcernedID/2017), dte, UserID, Action);
            response.sendRedirect("mentor.jsp");
            
        }

                   //makerequest

                    if(request.getParameter("sur")!=null && request.getParameter("sur").equals("tseuqer"))
                    {
                        
                    
                    MentorID=Integer.parseInt(request.getParameter("M"))/1239870;
                    UserID=Integer.parseInt(request.getParameter("U"))/1239870;
                    Action="INSERT";
                    Status=0;
                            globalobj.MentorReq(MentorID, UserID, Status, dte, Action);
                            response.sendRedirect("mentor.jsp");
                    }

                    //teammembers

                    if(request.getParameter("SubmitTeamM")!=null)
                    {
                    TeamID=Integer.parseInt(request.getParameter("TeamID"));
                    UserID=Integer.parseInt(request.getParameter("UserID"));

                    globalobj.TeamMembers(TeamID, UserID, Action);
                    }


                    //teamchat
                    if(request.getParameter("SubmitTeamChat")!=null)
                    {
                    MsgID=Integer.parseInt(request.getParameter("MsgID"));
                    TeamID=Integer.parseInt(request.getParameter("TeamID"));
                    UserID=Integer.parseInt(request.getParameter("UserID"));
                    MsgContent=request.getParameter("MsgContent");

                    globalobj.TeamChat(TeamID, UserID, MsgContent, dte, Action);
                    }


                    //Team
                    String DomainName;
                    if(request.getParameter("SubmitDom")!=null)
                    {
                    TeamID=Integer.parseInt(request.getParameter("TeamID"));
                    DomainName=request.getParameter("DomainName");
                    UserID=Integer.parseInt(request.getParameter("UserID"));

                    globalobj.Team(DomainName, dte, UserID, Action);
                    }

                    //Admin Developer Notification


                    if(request.getParameter("SubmitNotiFication")!=null)
                    {
                    //NotificationID=Integer.parseInt(request.getParameter("NotificationID"));
                    NotificationContent=request.getParameter("NotificationContent");
                    UserID=Integer.getInteger(request.getParameter("UserID"));
                    AdminID=Integer.getInteger(request.getParameter("AdminID"));

                    globalobj.AdminMentor(NotificationContent, UserID, AdminID, dte, Action);

                    }

                    //NOTIFICATION ADMIN Mentor
                    int NotifFicationID;
                    String NotifFicationContent="";
                    if(request.getParameter("SubmitNotif")!=null)
                    {
                    //NotifFicationID=Integer.parseInt(request.getParameter("NotifFicationID"));
                    NotifFicationContent=request.getParameter("NotifFicationContent");
                    UserID=Integer.parseInt(request.getParameter("UserID"));
                    AdminID=Integer.parseInt(request.getParameter("AdminID"));


                    globalobj.AdminMentor(NotifFicationContent, UserID, AdminID, dte, Action);
                    }


                    //MentorMMsg Mentor Developer Msg
                    if(request.getParameter("SubmitMsgMD")!=null){
                    MsgID=Integer.parseInt(request.getParameter("MsgID"));
                    MsgContent=request.getParameter("MsgContent");
                    SenderID=Integer.parseInt(request.getParameter("SenderID"));
                    ReceiverID=Integer.parseInt(request.getParameter("ReceiverID"));

                    globalobj.MentorMMsg(MsgContent, dte, SenderID, ReceiverID, Action);
                    }
                    
                    // UPLOAD pROJECT 
                    String ProjectName="";
                 String ProjectDOcPDF="";
               
                    try
                    {
                                String ImageFile="";
                                String itemName = "";
                                String [ ] logo = new String [2];
                             int c=0;
                                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                                if (!isMultipart)
                            {
                            }
                            else
                            {
                            FileItemFactory factory = new DiskFileItemFactory();
                            ServletFileUpload upload = new ServletFileUpload(factory);
                            List items = null;
                            try
                            {
                            items = upload.parseRequest(request);
                            }
                            catch (FileUploadException e)
                            {
                            e.getMessage();
                            }

                            Iterator itr = items.iterator();
                            while (itr.hasNext())
                            {
                                  boolean pic=false;
                            FileItem item = (FileItem) itr.next();
                            if (item.isFormField())
                            {
                            String name = item.getFieldName();
                            String value = item.getString();
                            if(name.equals("ProjectDOcPDF"))
                            {
                            ImageFile=value;
                            pic=true;
                            }
                            else if (name.equals("ProjectName"))
                            {
                                ProjectName=value;
                            }
                            else if (name.equals("ProjectDescription"))
                                {
                                    ProjectDescription=value;
                                }
                            else if (name.equals("ProjectIcon"))
                                {
                                    ProjectIcon=value;
                                     pic=false;
                                }
                            else if (name.equals("DomainID"))
                                {
                                    DomainID=Integer.parseInt(value);
                                }
                            else if(name.equals("TeamID"))
                                 {
                                   TeamID=Integer.parseInt(value);
                                 }
                                 }
                            else
                            {
                            try
                            {
                              
                                    itemName = item.getName();
                                    File savedFile = new File(cn.uploadUrl()+"/Projects/"+itemName);
                                    item.write(savedFile);
                                    if (c==0)
                                        {
                                            logo[0]=itemName;
                                        }
                                    else logo[1]=itemName;
                                    c++;
                               
                           
                            }
                            catch (Exception e)
                            {
                            out.println("Error"+e.getMessage());
                            }
                            }
                            }
                            try
                            {
                                UserID= id;
                            //UserID=(int)session.getAttribute("useidr");
                                 String SQL=" insert into Project(ProjectName,ProjectDescription,ProjectDocPDF, ProjectIcon,UserID,TeamID, DomainID) values ('"+ProjectName+"','"+ProjectDescription+"','"+logo[0]+"','"+logo[1]+"',"+UserID+","+TeamID+","+DomainID+")";
                               cn.connection();
                               cn.Stmt.executeUpdate(SQL);
                            }
                            catch(Exception el)
                            {
                            out.println("Inserting error"+el.getMessage());
                            }
                            }
                    }
                            catch (Exception e){
                            out.println(e.getMessage());
                    }
                    if (request.getParameter("act")!=null && request.getParameter("act").equals("app"))
                        {
                            UserID=Integer.parseInt(request.getParameter("mafi"))/650;
                            MentorID=id;
                            String SQL =" update MentorRequest set Status = 1 where UserID="+UserID+" and MentorID="+id+"  ";
                            cn.connection();
                            cn.Stmt.execute(SQL);
                            response.sendRedirect("mentor.jsp");
                        }
                    // Create a Group
                   
                    if (request.getParameter("Create")!=null)
                        {
                            String [ ] menbers;
                            menbers=request.getParameterValues("select");
                            DomainName=request.getParameter("DomainName");
                            Action="INSERT";
                           op.createteam(DomainName, dte, Action);
                           rs=cn.getcon().prepareStatement("select TeamID from Team where UserID is null ").executeQuery();
                           if (rs.next())
                            { 
                                if (menbers!=null)
                                {
                            
                                for (int i=0;i<menbers.length;i++)
                                    {
                                        op.AddMembers(rs.getInt(1), Integer.parseInt(menbers[i]), Action);
                                    }
                                        op.AddMembers(rs.getInt(1), id, Action);
                                   }
                                 Action="UPDATE";
                                op.AddMembers(rs.getInt(1), id, Action);
                         
                           cn.getcon().close();
                            
                        }
                            
                        }

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>DevPluG|Developer</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b></b>Plug</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>DevPluG</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <span style="font-size: 28px;color:#fff;line-height: 50px;text-align: center;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;font-weight: 300;"><span class="ion-person-stalker"></span> Mentors Dashboard</span>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         <div class="pull-right hidden-sm">
         </div>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <!--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>-->
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
            <img src="../../profile/<%=profile%>" class="img-circle img-md" alt="User Image">
        </div>
        <div class="pull-left info">
            <p><%=username%></p>
          <a href="#"><i class="fa fa-circle text-success"></i> </a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" >
        <li><a href="" data-toggle="modal" data-target="#postideas" style="color:white;"><span class="ion-compose"> </span> Post Idea </a></li>
    <li><a href="" data-toggle="modal" data-target="#partnerrequest" style="color:white;"><span class="ion-person-stalker"></span> Request a Partner</a></li>
            
            <li><a href="" data-toggle="modal" data-target="#project" style="color:white;"><span class="ion-clipboard"></span> Upload Project</a></li>
            <li><a href="#" data-toggle="modal" data-target="#shareexperience" style="color:white;" ><span class="ion-chatbox-working"></span> What's  happening</a></li>
            <li><a href="project.jsp" style="color:white;"><span class="ion-ios-paper"></span> Project</a></li>
            <li><a href="ressource.jsp" style="color:white;"> <span class="ion-ios-folder"></span> Resources</a></li>
             <li><a href="#" data-toggle="modal" data-target="#team" style="color:white;"> <span class="ion-ios-people"> </span> Build a Team</a></li>
             <li><a href="Conversion.jsp" style="color:white;"> <span class="ion-ios-folder"></span> Discussion</a></li>
            <li> <a href="login.jsp" style="color:white;"> <span class="ion-log-out"></span> Logout</a></li>
          </ul>
      </ul>
      
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Opportunities</a></li>
              <li><a href="#conference" data-toggle="tab">Events</a></li>
              <li><a href="#experience" data-toggle="tab">View Experiences</a></li>
              <li><a href="#ideas" data-toggle="tab">View Ideas</a></li>
              <li><a href="#parteners" data-toggle="tab">View Partenership Request</a></li>
              <li><a href="#pool" data-toggle="tab">Manage Mentee</a></li>
              <li><a href="#request" data-toggle="tab">View Request</a></li>


            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                <%
                   
                   ResultSet rS=ccc.getcon().prepareStatement("select OppContent,CompanyName,dttime FROM Opportunity ORDER BY OppID DESC LIMIT 50  ").executeQuery();
               while(rS.next())
               {
                %>
                <div class="post">
                  <div class="user-block">
                 
                        <span class="username">
                            <a href="#"><%=rS.getString(2)  %></a>
                        </span>
                            <span class="description"> <%=rS.getTimestamp(3) %></span>
                  </div>
                  <!-- /.user-block -->
                  <p>
                    <p>
                    <%=rS.getString(1)%>
                  </p>
                  </p>
                </div>
                <%} ccc.getcon().close(); %>
                
              
              
              </div>
              <!-- /end of job opportunity -->

              <!-- start conferences -->
              <div class="tab-pane" id="conference">
                   <%
                    ResultSet RS=ccc.getcon().prepareStatement("select EventName,InstitutionName,Description,dttime FROM Event ORDER BY EventID DESC LIMIT 50 ").executeQuery();
               while(RS.next())
               {
                %>
                <div class="post">
                  <div class="user-block">
                  
                        <span class="username">
                            <a href="#"><%=RS.getString(2)  %> : <%=RS.getString(1)  %></a>
                        </span>
                            <span class="description"> <%=RS.getTimestamp(4) %></span>
                  </div>
                  <!-- /.user-block -->
                  <p>
                    <p>
                    <%=RS.getString(3)%>
                  </p>
                  </p>
                </div>
                <%}  ccc.getcon().close(); %>
 
              </div>
              <!-- end conferences -->

              <!-- start view experience -->
              <div class="tab-pane" id="experience">
                 
                <div class="row">
                  <div class="col-md-12">
                    <%
                          rs=cn.getcon().prepareStatement("select Experience.ExperienceID,Experience.ExperienceContent,Experience.DateTime, User.UserName,User.Photo from Experience,User where User.UserID=Experience.UserID ORDER BY ExperienceID DESC limit 50").executeQuery();
                          while (rs.next())
                          {
                      %>
                    <div class="box box-widget">
                      <div class="box-body">
                        <div class="post">
                          <div class="user-block">
                               <img class="img-circle img-sm" src="../../profile/<%=rs.getString(5)%>" alt="User Image">

                            <span class="username">
                                <a href="#"><%=rs.getString(4) %></a>
                            </span>
                                <span class="description"> Published on <%=rs.getTimestamp(3) %></span>
                          </div>
                  <!-- /.user-block -->
                          <p>
                            <p>
                            <%=rs.getString(2) %>
                          </p>
                          </p>
                        </div>
                        <span class="pull-right text-muted"></span>
                      </div>
                      <div class="box-footer box-comments">
                          <%
                              ResultSet Set= cn.getcon().prepareStatement("select CommentExp.CommentContent,CommentExp.DateTime,User.UserName, User.Photo from CommentExp,User where User.UserID=CommentExp.UserID  and CommentExp.ConcernedID ="+rs.getInt(1)+"").executeQuery();
                              while(Set.next())
                                {
                               %>
                        <div class="box-comment">
                          <!-- User image -->
                          <img class="img-circle img-sm" src="../../profile/<%=Set.getString(4)%>" alt="User Image">

                          <div class="comment-text">
                                <span class="username">
                                    <%=Set.getString(3) %>
                                    <span class="text-muted pull-right"><%=Set.getTimestamp(2) %></span>
                                </span><!-- /.username -->
                           <%=Set.getString(1) %>
                          </div>
                          <!-- /.comment-text -->
                        </div>
                        <%}%> 
                        <a href="#"data-toggle="modal" data-target="#<%=rs.getInt(1)%>" > Add Comment </a>
                        
                        <!-- /.box-comment -->
                      </div>
                      <div class="box-footer">
                                                   
                          <div class="modal fade" id="<%=rs.getInt(1)%>">
          <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Add Comment</h4>
                  </div>
                  <div class="">

                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="mentor.jsp?pxe=<%=rs.getInt(1)*2017%>" method="post">
                  <div class="box-body">
                    <div class="form-group">

                        <textarea name="CommentContent" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" required>  </textarea>
                    </div>

                    </div>
                  <!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" name="ExpCom"class="btn btn-primary pull-right ion-ios-redo">Post </button>
                    <button type="button" class="btn btn-default pull-left ion-close-round" data-dismiss="modal"> Close</button>
                  </div>
                </form>
              </div>
            <!-- /.box-body -->           
          </div>
     <!-- /.modal-content -->
       </div>
</div>
                      </div>
                    </div>
                    <%} cn.getcon().close(); %>
                  </div>
                </div>
                          
              </div><!-- end of view experience -->

              <!-- start view ideas -->
               <div class="tab-pane" id="ideas">
                  
                   
                <div class="row">
                  <div class="col-md-12">
                               <%
                          rs=cn.getcon().prepareStatement("select Proposition.PropositionID, Proposition.PropositionContent,Proposition.DateTime, Domain.DomainName, User.UserName, User.Photo from Proposition,User, Domain  where User.UserID=Proposition.UserID and  Domain.DomainID =  Proposition.DomainID  ORDER BY Proposition.PropositionID DESC limit 10").executeQuery();
                          while (rs.next())
                          {
                      %>
                    <div class="box box-widget">
                      <div class="box-body">
                        <div class="post">
                          <div class="user-block">
                            <img class="img-circle img-bordered-sm" src="../../profile/<%=rs.getString(6)%>" alt="user image">
                            <span class="username">
                                <a href="#"><%=rs.getString(5) %></a>
                            </span>
                            
                                <span class="description"> Domain :  <%=rs.getString(4) %></span>
                          </div>
                  <!-- /.user-block -->
                          
                            <p>
                            <%=rs.getString(2) %>
                          </p>
                          
                        </div>
                        <span class="pull-right text-muted"> Published on <%=rs.getTimestamp(3) %>   </span>
                      </div>
                      <div class="box-footer box-comments">
                          <%
                              ResultSet Set= cn.getcon().prepareStatement("select Comment.CommentContent,Comment.DateTime,User.UserName,Comment.CommentID, User.Photo from Comment,User where User.UserID=Comment.UserID  and Comment.ConcernedID ="+rs.getInt(1)+"").executeQuery();
                              while(Set.next())
                                {
                               %>
                        <div class="box-comment">
                          <!-- User image -->
                           <img class="img-circle img-sm" src="../../profile/<%=Set.getString(5)%>" alt="User Image">

                          <div class="comment-text">
                                <span class="username">
                                    <%=Set.getString(3) %>
                                    <span class="text-muted pull-right"><%=Set.getTimestamp(2) %></span>
                                </span><!-- /.username -->
                           <%=Set.getString(1) %>
                          </div>
                          <!-- /.comment-text -->
                        </div>
                        <%}%> 
                        <!-- /.box-comment -->
                        
                        <!-- /.box-comment -->
                        <a href="#" data-toggle="modal" data-target="#<%=rs.getInt(1)*2%>" > Add comment </a>
                        <a href="#" data-toggle="modal" data-target="#addcomment" style="margin-right:10;"class="text-muted pull-right"> Participate </a>
                        
                      </div>
                                               
                  <div class="modal fade" id="<%=rs.getInt(1)*2%>">
          <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Add Comment</h4>
                  </div>
                  <div class="">

                <!-- /.box-header -->
                <!-- form start -->
                <form role="" action="mentor.jsp?adi=<%=rs.getInt(1)*2017%>" method="post">
                  <div class="box-body">
                    <div class="form-group">

                        <textarea name="CommentContent" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;">  </textarea>
                    </div>

                    </div>
                  <!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" name="SubmComm"class="btn btn-primary pull-right ion-ios-redo"> Comment </button>
                    <button type="button" class="btn btn-default pull-left ion-close-round" data-dismiss="modal"> Close</button>
                  </div>
                </form>
              </div>
            <!-- /.box-body -->           
          </div>
     <!-- /.modal-content -->
       </div>
</div>
                          
                      
                    </div>
                    <%} cn.getcon().close(); %>
                  </div>
                </div>
              </div>
              <!--// end of view ideas -->

              <!-- start view partenership request -->
              <div class="tab-pane" id="parteners">
                <div class="row">
                  <div class="col-md-12">
                    <%
                         rs=cn.getcon().prepareStatement("select PartnerRequest.PatReqID, PartnerRequest.PatReqContent,PartnerRequest.DateTime,  User.UserName, User.Photo,Domain.DomainName,Program.ProgramName from PartnerRequest,User,Program, Domain where User.UserID=PartnerRequest.UserID and Domain.DomainID=PartnerRequest.DomainID and Program.ProgramID = PartnerRequest.ProgramID ORDER BY PartnerRequest.PatReqID DESC limit 50").executeQuery();
                          while (rs.next())
                          {
                      %>
                    <div class="box box-widget">
                      <div class="box-body">
                        <div class="post">
                          <div class="user-block">
                            <img class="img-circle img-bordered-sm" src="../../profile/<%=rs.getString(5)%>"  alt="user image">
                            <span class="username">
                                <a href="#"><%=rs.getString(4) %></a>
                                  <span class="description"> Domain : <%=rs.getString(6)%> </span> 
                                 <span class="description">  Programming Language  : <%=rs.getString(7)%> </span> 
                            </span>
                             
                          </div>
                  <!-- /.user-block -->
                          
                            <p>
                            <%=rs.getString(2) %>
                          </p>
                          
                        </div>
                        <span class="pull-right text-muted"> Published on <%=rs.getTimestamp(3) %>   </span>
                      </div>
                      <div class="box-footer box-comments">
                          <%
                              ResultSet Set= cn.getcon().prepareStatement("select CommentPat.CommentContent,CommentPat.DateTime,User.UserName,CommentPat.CommentID,User.Photo from CommentPat,User where User.UserID=CommentPat.UserID  and CommentPat.ConcernedID ="+rs.getInt(1)+"").executeQuery();
                              while(Set.next())
                                {
                               %>
                        <div class="box-comment">
                          <!-- User image -->
                           <img class="img-circle img-sm" src="../../profile/<%=Set.getString(5)%>"  alt="User Image">

                          <div class="comment-text">
                                <span class="username">
                                    <%=Set.getString(3) %>
                                    <span class="text-muted pull-right"><%=Set.getTimestamp(2) %></span>
                                </span><!-- /.username -->
                           <%=Set.getString(1) %>
                          </div>
                          <!-- /.comment-text -->
                        </div>
                        <%}%> 
                        <!-- /.box-comment -->
                        
                        <!-- /.box-comment -->
                        <a href="#" data-toggle="modal" data-target="#<%=rs.getInt(1)*3%>" > Add comment </a>
                        <a href="#" data-toggle="modal" data-target="#addcomment" style="margin-right:10;"class="text-muted pull-right"> Participate </a>
                        
                      </div>
                                               
                  <div class="modal fade" id="<%=rs.getInt(1)*3%>">
          <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Add Comment</h4>
                  </div>
                  <div class="">

                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="mentor.jsp?tap=<%=rs.getInt(1)*2017%>" method="post">
                  <div class="box-body">
                    <div class="form-group">

                        <textarea name="CommentContent" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;">  </textarea>
                    </div>

                    </div>
                  <!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" name="PatCom"class="btn btn-primary pull-right ion-ios-redo"> Comment </button>
                    <button type="button" class="btn btn-default pull-left ion-close-round" data-dismiss="modal"> Close</button>
                  </div>
                </form>
              </div>
            <!-- /.box-body -->           
          </div>
     <!-- /.modal-content -->
       </div>
</div>
                          
                      
                    </div>
                    <%} cn.getcon().close(); %>
                  </div>
                </div>
              </div>
              <!-- // end view partnership request -->

                   <!--VIEW REQUEST-->
                                                   
                                              <div class="tab-pane" id="request">
                                                
                                               <div class="box box-info">
                                               <div class="box-header with-border">

                                              </div>
                                                    <!-- /.box-header -->
                                              <div class="box-body">
                                              <div class="table-responsive">
                                              <table class="table no-margin">
                                              <thead>
                                              <tr>
                                               <th>Name</th>
                                               <th>Programming Language</th>
                                               <th>Date</th>
                                               <th>Action</th>
                                               </tr>
                                                          </thead>
                                                          <tbody>
                                                          
                                                <%
                                                 cn.GetDrive();
                                                 ResultSet Rst=cn.getcon().prepareStatement("select User.UserName,Program.ProgramName,MentorRequest.DateTime ,User.UserID from User,Program,MentorRequest where User.UserID=MentorRequest.UserID and Program.ProgramID = User.ProgramID and MentorRequest.MentorID= "+id+" and MentorRequest.Status=0").executeQuery();
                                                 while(Rst.next())
                                                 {
                                                     
                                                %>  
                                                          <tr>
                                                              <td><%=Rst.getString(1) %></td>
                                                              <td><%=Rst.getString(2) %></td>
                                                              <td><%=Rst.getTimestamp(3) %></td>
                                                               
                                                              <td><a style= "border-radius: 10px;" href="mentor.jsp?act=app&mafi=<%=Rst.getInt(4)*650%>" class="btn btn-primary btn-sm">Aprove</a> <button type="button" style="border-radius: 10px;" class="btn btn-primary btn-sm">Ignore</button></td>
                                                          </tr>
                                                          
                                                         <%} cn.getcon().close(); %> 
                                                          </tbody>
                                                        </table>
                                        <!-- /.col -->
                                                    </div>
                                                    </div>
                                                      <!-- /.table-responsive -->
                                                    </div>                                                   
                                                  </div>
                                      <!--End-view request -->
              
                    <!--MANAGE MENTEE-->
                                              <div class="tab-pane" id="pool">
                                                  <div class="row">
                                                <!-- /.box-header -->
                                                    <div class="col-md-12">
                                                      <div class="table-responsive">
                                                        <table class="table no-margin">
                                                          <thead>
                                                          <tr>
                                                            <th>Profile</th>
                                                            <th>Names</th>
                                                        
                                                            <th>Programming Language</th>
                                                            <th>Project</th>
                                                          </tr>
                                                          </thead>
                                                          <tbody>
                                                              <%
                                                       
                                                           rs=cn.getcon().prepareStatement("select User.UserName,User.Photo, Program.ProgramName, User.UserID from MentorRequest, User,Program  WHERE User.UserID= MentorRequest.UserID and Program.ProgramID= User.ProgramID   and MentorRequest.MentorID = "+id+" and  MentorRequest.Status=1").executeQuery();
                                                           while (rs.next()) 
                                                           {
                                                           
                                                              %>
                                                          <tr>
                                                              <td><img class="img-circle img-sm" src="../../profile/<%= rs.getString(2)  %>" alt="User Image"></td>
                                                          <td><%=rs.getString(1) %></td>
                                                          
                                                          <td><%=rs.getString(3) %></td>
                                                          <td><li>
                                                              <a href="#" data-toggle="modal" data-target="#pro<%=rs.getInt(4)%>">
                                                          <i class="fa fa-th"></i><span> View List</span>
                                                          </a>
                                                          </td>
                                                          </tr>
                                                  <%} cn.getcon().close(); %>
                                                          </tbody>
                                                        </table>
                                        <!-- /.col -->
                                                    </div>
                                                    </div>
                                                      <!-- /.table-responsive -->
                                                    </div>                                                    
                                                  </div>
              <!-- Manage mentee --->
           

              
              </div>
              <!-- /.tab-pane -->
            </div>
   
            <!-- /.tab-content -->
          </div>



 </div>  <!-- END CHAT  -->




          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  </div>
 
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
       <li><a href="#control-sidebar-plus-tab" data-toggle="tab"><i class="fa fa-plus"></i></a></li>
    </ul>
    <!-- Tab panes -->

    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Contacts</h3>
            <div class="direct-chats-contacts">
              <ul class="contacts-list">
                <li>
                  <a href="#">
                    <img class="contacts-list-img" src="../../dist/img/topher.jpg" alt="User Image">

                    <div class="contacts-list-info">
                      <span class="contacts-list-name">
                        WILY
                      </span>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img class="contacts-list-img" src="../../dist/img/11.jpg" alt="User Image">

                    <div class="contacts-list-info">
                      <span class="contacts-list-name">
                        WILY
                      </span>
                    </div>
                  </a>
                </li>
                
                <li>
                  <a href="#">
                    <img class="contacts-list-img" src="../../dist/img/5.jpg" alt="User Image">

                    <div class="contacts-list-info">
                      <span class="contacts-list-name">
                        WILY
                      </span>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img class="contacts-list-img" src="../../dist/img/2.jpg" alt="User Image">

                    <div class="contacts-list-info">
                      <span class="contacts-list-name">
                        WILY
                      </span>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img class="contacts-list-img" src="../../dist/img/1.jpg" alt="User Image">

                    <div class="contacts-list-info">
                      <span class="contacts-list-name">
                        WILY
                      </span>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
      </div>

      <div class="tab-pane" id="control-sidebar-plus-tab">
        <div class="direct-chats-contacts">
        <form class="form-group">
          <div class="form-group">
            <input type="text" name="" placeholder="group name"><hr>
            <ul class="contacts-list">
            <li>
              <a href="#">
                    <img class="contacts-list-img" src="../../dist/img/rihana.jpg" alt="User Image">

                    <div class="contacts-list-info">
                      <span class="contacts-list-name">
                        WILY
                      </span>
                    </div>
                    <span> <div class="form-group">
                      <input type="checkbox" name="">
                    </div></span>
                  </a>
            </li>
          </ul>
          </div>
        </form>
          
        </div>
      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      
      </div>
      <!-- /.tab-pane -->
    </div>
  
  </aside>
</div>
<!-- ./wrapper -->
<section class="">
  <div class="example-modal">
    <!-- start post ideas -->
    <div class="modal fade" id="postideas">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color:darkblue ;"> Share your Idea with us </h4>
              </div>
              <div class="modal-body">
                  <form class="form-group" method="post" action="mentor.jsp">
                  <div class="form-group" >
                 
                      <select class="form-control" name="DomainID" >
                           <option value=" " selected>Select Domain</option>
                 <%
                    
                 rs=ccc.getcon().prepareStatement("select DomainID,DomainName from Domain ").executeQuery();
                 while (rs.next())
                         {
                 
                 %>
                     
                 <option value="<%=rs.getInt(1)%>"><%=rs.getString(2) %></option>
                     <%} ccc.getcon().close(); %>
                      </select>
                 
                 
                
                  </div>
                  <div class="form-group" >
                      <textarea class="form-control" name="PropositionContent" style="border-radius:20px;" placeholder="Describe your idea ..." required></textarea>
                      
                  </div> 
                  <div> <button class="btn btn-primary" name="SubmitProposition" style="border-radius:10px;" > <span class="ion-ios-redo"> </span>Post</button> </div>
                              
                      
                </form>
              </div>    
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div><!-- end of post ideas -->

        <!-- start partnership request -->
        <div class="modal fade" id="partnerrequest">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color:darkblue ;">Request partners</h4>
              </div>
              <div class="modal-body">
                <form class="form-group" method="post" action="mentor.jsp"  >
                  <div class="form-group">
                      <select class="form-control" name="DomainID">
                      <option selected>Select Domain</option>
                        <%
                    
                 rs=ccc.getcon().prepareStatement("select DomainID,DomainName from Domain ").executeQuery();
                 while (rs.next())
                         {
                 
                 %>
                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2) %></option>
                      <%} ccc.getcon().close(); %>
                    </select>
                  </div>
                  <div class="form-group">
                    <select class="form-control" name="ProgramID">
                      <option selected>Programming Language</option>
                      
                             <%
                    
                 rs=ccc.getcon().prepareStatement("select ProgramID,ProgramName from Program ").executeQuery();
                 while (rs.next())
                         {
                 
                 %>
                 <option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
                     <%}ccc.getcon().close(); %>
                    </select>
                  </div>
                  <div class="form-group">
                      <textarea class="form-control" style="border-radius:20px;" placeholder="Describe other criteria" name="PatReqContent" required></textarea>
                  </div>
                  <div class="modal-footer">
                     <button type="submit" name="SubmitPat" style="border-radius:20px;" class="btn btn-primary pull-right "> <span class="ion-ios-redo"> </span>Post</button>
                  </div>
                </form>
              </div>    
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div><!-- end partnership request -->
        
        <!-- start request mentol -->
        <!-- end of request mentol -->   
      </div> 


      <!-- start Build a team  -->
        <div class="modal fade" id="team">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Select Group Members</h4>
              </div>
              <div class="modal-body">
               
                <div class="box-body">
                    <form action="mentor.jsp" method="post">
                        <input type="text" name="DomainName" class="form-control" placeholder="Input group name" required>
                  <div class="col-md-12">
                    <div class="table-responsive">
                     <div class="tab-pane">
                     </div>
                      
                     <table class="table no-margin">
                       <thead>
                          <tr>
                            <th>Profile</th>
                            <th>Name</th>
                            <th>Expertise</th>
                            <th>Operation</th>
                          </tr>
                        </thead>
                        <tbody>
                            <%
                                    rs=cn.getcon().prepareStatement("select User.UserID, User.Photo,User.UserName, Program.ProgramName from User, Program where Program.ProgramID = User.ProgramID  and User.UserCategoryID != 3").executeQuery();
                                    while (rs.next())
                                    {
                            %>
                          <tr>
                            <td><img  class="img-circle img-sm" src="../../dist/img/topher.jpg" width="60" height="50"></td>
                            <td><%=rs.getString(3) %></td>
                            <td><%=rs.getString(4) %></td>
                            <td><input type="checkbox" name ="select" value="<%=rs.getInt(1) %>"></td>
                          </tr><%} cn.getcon().close(); %>
                            </tbody>
                          </table>
                   </div>
                   <div> <button type="submit" name="Create"class="btn btn-primary col-md-offset-10"> Create </button></div>
                  </div>
                    </form>
                </div>     
              </div>                     
            </div>              
          </div>
           
        </div> <!-- end of Build A team  -->   
</div>


      <div class="modal fade" id="mylibrary">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Mylibrary</h4>
              </div>
              <div class="modal-body">
                <form class="form-group">
                  
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary">Submit</button>
                  </div>
                </form>
              </div>    
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>      
    
        <!-- project and documentation start -->
        <div class="modal fade" id="project">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color:darkblue;">Project Description</h4>
              </div>
              <div class="modal-body">
                <form class="form-group" method="post" action ="mentor.jsp"  enctype="multipart/form-data">

                 <div class="form-group">
                    <select class="form-control"name="DomainID">
                      <option selected>Select Domain</option>
                       <%
                    
                       rs=ccc.getcon().prepareStatement("select DomainID,DomainName from Domain ").executeQuery();
                       while (rs.next())
                         {  
                         
                            %>
                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2) %></option>
                      <%}ccc.getcon().close(); %>
                    </select>
                  </div>
                     <div class="form-group">
                         
                          <input type="text"name="ProjectName" class="form-control" placeholder="Project Name" name="DomainName" required>  
                      
                  </div>
                  <div class="form-group">
                      <textarea class="form-control" name="ProjectDescription" placeholder="Description abstract" style="border-radius:20px;" required></textarea>
                  </div>

                    <div class="form-group has-feedback ">
                         <label> Uplaod Documentation</label>
                        <input type="file" value="Upload PDF" name="ProjectDocPDF">
                        <br>
                       
                    </div>
                    <br>
                  <div class="form-group has-feedback">
                        <label> Uplaod Project Logo</label>
                      <input type="file" value="Upload picture"  name="logo">
                       <br>
                      
                  </div>
                  
                  
                 
                  <div class="modal-footer">
                      <button  type="submit"class="btn btn-primary pull-right" name="Apply"><span class="ion-android-done-all"> </span>Publish</button>
                  </div>         
                </form>
              </div>    
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div><!-- end project and documentation -->
       
                                      <!--modal view project list-->
   <%
                      rs=cn.getcon().prepareStatement("select UserID from MentorRequest where  MentorID=347  ").executeQuery();
                      while (rs.next())
                      {
   %>
   <div class="modal fade" id="pro<%=rs.getInt(1)%>">
                                            <div class="modal-dialog">
                                            <div class="modal-content">
                                            <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title ">List of Project</h4>
                                           
                                            <div class="modal-body">
                                           <!--ICON-->

                                            <!--ICON-->
                                            <div class="modal-body">
                                            
                                            <div class="box-body">
                                              <div class="table-responsive">
                                                <table class="table no-margin">
                                                  <thead>
                                                  <tr>
                                                    <th>ICON</th>
                                                    <th>Name</th>
                                                  </tr>
                                                  </thead>
                                                  <tbody>
                                                     <%
                                                     ResultSet Rt= cn.getcon().prepareStatement("select  ProjectID, ProjectName from Project where UserID="+rs.getInt(1)+" ").executeQuery();
                                                     while (Rt.next())
                                                     {
                                                     %>
                                                  <tr>
                                                  <td><img class="img-circle img-sm" src="../../dist/img/hou.jpg" alt="User Image"></td>
                                                  <td><%=Rt.getString(2)%></td>
                                                  </tr><% } cn.getcon().close(); %>
                                                  
                                                  
                                                </table>
                                    <!-- /.col -->
                                            </div>
                                            </div> 
                                            </div>
                                            </div>
                                            <div class="modal-footer">
                                                    
                                                    <button type="button" style="border-radius: 15px;" class="btn btn-primary" data-dismiss="modal">Close</button>
                                            </div>
                                            </div>
                                            </div>
                                            <!-- /.modal-content -->
                                            </div>
                                              <!-- /.modal-dialog -->
                                            </div> <%}cn.getcon().close();  %>       
                                        <!--end modal-project list -->
                                        
                                        
        <!-- start share experience -->
        <div class="modal fade" id="shareexperience">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">What's going on with your career</h4>
              </div>
              <div class="modal-body">
                  <form class="form-group" action="mentor.jsp" method="post">
                  <div class="form-group">
                    <textarea class="form-control" style="border-radius:20px;" name="ExperienceContent" placeholder="Share your experience here" required></textarea>
                  </div>
                  <div class="modal-footer">
                     <button type="submit" name="SubmitExperience" class="btn btn-primary"><span class="ion-android-share-alt"></span> Share</button>
                  </div>
                </form>
              </div>    
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div><!-- end of sharing experience -->
      </div>
</section>
<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>
                                              




