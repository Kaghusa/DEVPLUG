<%-- 
    Document   : Admin
    Created on : Nov 16, 2017, 9:47:36 PM
    Author     : boniface
--%>

<%@page import="java.io.File"%>
<%@page import="Operation.AdminFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Operation.dbconnect"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        if (session.getAttribute("Mname")==null )
        {
            response.sendRedirect("login.jsp");
        } 
   
    String username = session.getAttribute("Mname").toString(); 
    int id= Integer.parseInt(session.getAttribute("Mid").toString());
    String profile= session.getAttribute("Mprofile").toString();
    //General Declarations 
    dbconnect cn= new dbconnect();
    cn.GetDrive();
    ResultSet rs=null;
   java.util.Date dt= new java.util.Date();
   java.sql.Timestamp time= new java.sql.Timestamp(dt.getTime());
   AdminFunction op= new AdminFunction();
    // Method  to insert a new opportinity 
    String OppContent="";
    String CompanyName="";
    int UserID;
    String Action="INSERT";
    if (request.getParameter("SubmOpp")!=null)
        {
            OppContent= request.getParameter("OppContent");
            CompanyName= request.getParameter("CompanyName");
            //UserID=(int) session.getAttribute("id");
            UserID=id;
            
            op.Opportinity(OppContent, CompanyName, UserID, time, Action);
            
        }
    // Method to insert an Event 
    String EventName="", InstitutionName="", Description="";
    if (request.getParameter("SubmEV")!=null)
        {
            EventName=request.getParameter("EventName");
            InstitutionName= request.getParameter("InstitutionName");
            Description =request.getParameter("Description");
            op.Event(EventName, InstitutionName, Description, time, Action);
            
        }
    // Method to Upload the ressources 
    String  ResourceDescription="";
    String ResourceRef1="";
    String ResourceRef2="";
    String ResourceRef3="";
    String ResourceRef4="";
    String ResourceRef5="";
      int ProgramID=0;
      try
                    {
                                String ImageFile="";
                                String itemName = "";
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
                            FileItem item = (FileItem) itr.next();
                            if (item.isFormField())
                            {
                            String name = item.getFieldName();
                            String value = item.getString();
                            if(name.equals("ResourcePDF"))
                            {
                            ImageFile=value;
                            }
                            else if (name.equals("ResourceDescription"))
                            {
                                ResourceDescription=value;
                            }
                            else if (name.equals("ResourceRef1"))
                                {
                                    ResourceRef1=value;
                                }
                            else if (name.equals("ResourceRef2"))
                                {
                                    ResourceRef2=value;
                                }
                            else if (name.equals("ResourceRef3"))
                                {
                                    ResourceRef5=value;
                                }
                            else if (name.equals("ResourceRef4"))
                                {
                                    ResourceRef4=value;
                                }
                            else if (name.equals("ResourceRef5"))
                                {
                                    ResourceRef5=value;
                                }
                            else if (name.equals("ProgramID"))
                                {
                                      ProgramID=Integer.parseInt(value);
                                }

                            }
                            else
                            {
                            try
                            {
                            itemName = item.getName();
                            File savedFile = new File(cn.uploadUrl()+"/ressources/"+itemName);
                            item.write(savedFile);
                            }
                            catch (Exception e)
                            {
                            out.println("Error"+e.getMessage());
                            }
                            }
                            }
                            try
                            {
                            //st.executeUpdate("insert into Student(Name) values ('"+itemName+"')");
                               String SQL=" insert into Resources(ResourceDescription,ResourcePDF, ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4,ResourceRef5,Datetime,ProgramID,Status) values ('"+ResourceDescription+"','"+itemName+"','"+ResourceRef1+"','"+ResourceRef2+"','"+ResourceRef3+"','"+ResourceRef4+"','"+ResourceRef5+"','"+time+"',"+ProgramID+",0)";
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
      // method or operation to register a new admin in the system 
     String  UserName="", City="",Email="",Tel,Passwd="";
       if (request.getParameter("NewAdmi")!=null)
        {
            UserName = request.getParameter("UserName");
            City =request.getParameter("City");
            Email= request.getParameter("Email");
            Tel =request.getParameter("Tel");
            Passwd=request.getParameter("Passwd");
            ProgramID= Integer.parseInt(request.getParameter("ProgramID"));
            op.Admin(UserName, ProgramID, City, Email, Tel, Passwd, Action);
        }
       // Change password 
      
       String Old="";
       if (request.getParameter("Change")!=null)
        {
            
        Action="UPDATE";
            Old=request.getParameter("Old");
            Passwd=request.getParameter("Passwd");
            //UserID=(int)session.getAttribute("UserID");
            UserID=id;
        if (request.getParameter("Check").equals(request.getParameter("Passwd")))
        {
            rs=cn.getcon().prepareStatement("select UserName from User where UserID="+UserID+" and Passwd='"+Old+"'").executeQuery();
            if (rs.next())
                {
                    op.changePwd(UserID, Passwd, Old, Action);
                }
            cn.getcon().close();
            
        }
        }
       // to insert idea comment 
       String CommentContent=""; int ConcernedID;
       if (request.getParameter("SubmComm")!=null)
        {
            ConcernedID=Integer.parseInt(request.getParameter("adi"));
            CommentContent=request.getParameter("CommentContent");
           //UserID=(int)session.getAttribute("UserID");
            UserID=id;
            op.ideacomment(CommentContent, (ConcernedID/2017), time, UserID, Action);
            response.sendRedirect("Admin.jsp");
            
        }
       // to insert the comment to the experience 
       
               if (request.getParameter("ExpCom")!=null)
        {
            ConcernedID=Integer.parseInt(request.getParameter("pxe"));
            CommentContent=request.getParameter("CommentContent");
           //UserID=(int)session.getAttribute("UserID");
            UserID=id;
            op.Epcomment(CommentContent, (ConcernedID/2017), time, UserID, Action);
            response.sendRedirect("Admin.jsp");
            
        }
               
            
        
    
    
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Admin | Page</title>
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


  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<style>
    .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
  </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="../../index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">Plug</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">DevPLUG</span>
    </a>

     <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="icon-bar">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
       
      </a>
      <span> <h3 style="color:white;font-weight:bold;"> <span class="ion-cube"> </span> Administrator Dashboard</h3>  </span>
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

    <!-- Header Navbar: style can be found in header.less --> 
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
            <img src="../../profile/<%=profile%>" class="img-circle" style=" height:60px;" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=username%></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
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

      <ul class="sidebar-menu" data-widget="tree">        
        <!--Post opportunities-->
        <li>
          <a href="#" data-toggle="modal" data-target="#modal-opportunity" style="color:white;">
            <i class="ion-compose"></i> <span> Post opportunity</span>
          </a>
        </li>
        <li>
          <a href="#" data-toggle="modal" data-target="#modal-event" style="color:white;">
            <i class="ion-calendar"></i> <span>Post Event</span>
          </a>
        </li>
        <li>
          <a href="#" data-toggle="modal" data-target="#modal-ressource" style="color:white;">
            <i class="ion-ios-paper"></i> <span>Post resources</span>
          </a>
        </li>
        <li>
          <a href="#" data-toggle="modal" data-target="#modal-regadmin" style="color:white;">
            <i class="ion-person-add"></i> <span>Register admin</span>
          </a>
        </li>
        <li>
          <a href="#" data-toggle="modal" data-target="#modal-changepassword" style="color:white;">
            <i class="ion-ios-compose-outline"></i> <span>Change password</span>
          </a>
        </li>
        <li>
          <a href="login.html" style="color:white;">
            <i class="ion-log-out"></i> <span>Logout</span>
          </a>
        </li>
        <!--end. Post-->
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

<!--Modals content-->
     <div class="modal fade" id="modal-event">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Post event</h4>
              </div>
        <div class="">
            
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post">
              <div class="box-body">
                <div class="form-group">
                  
                    <input type="text" name="EventName" class="form-control" id="exampleInputEmail1" style="border-radius:15px;" placeholder="Event's name" required>
                </div>
                <div class="form-group">
                  
                    <input type="text" name="InstitutionName" class="form-control" id="exampleInputPassword1" style="border-radius:15px;" placeholder="Institution's name" required>
                </div>
                <div>
                    <textarea class="form-control" name="Description" rows="4" cols="5" style="border-radius:15px;" placeholder="Description" required></textarea>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
              <button type="button" class="btn btn-default pull-left ion-close-round" data-dismiss="modal" >Close</button>
                <button type="submit" name="SubmEV" class="btn btn-primary pull-right ion-ios-redo">Post</button>
              </div>
            </form>
          </div>
        <!-- /.box-body -->
                 
          <!--box-footer -->             
      </div>
 <!-- /.modal-content -->
  </div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal content -->

<div class="modal fade" id="modal-opportunity">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Post Opportunity</h4>
              </div>
              <div class="">
          
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="Admin.jsp" method="post">
              <div class="box-body">
                <div class="form-group">
                  
                    <input type="text" name="CompanyName" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="Title" required>
                </div>
                <div class="form-group">                  
                    <textarea class="form-control" name="OppContent" rows="4" cols="5" style="border-radius: 15px;" placeholder="Description" required></textarea>                
                </div>
                </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" name="SubmOpp"class="btn btn-primary pull-right ion-ios-redo">Post </button>
                <button type="button" class="btn btn-default pull-left ion-close-round" data-dismiss="modal"> Close</button>
              </div>
            </form>
          </div>
        <!-- /.box-body -->           
      </div>
 <!-- /.modal-content -->
   </div>
<!-- /.modal-dialog -->
</div>


<!--Modals content-->
     <div class="modal fade" id="modal-ressource">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Post resources</h4>
              </div>
        <div class="">
            
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post" enctype="multipart/form-data" action="Admin.jsp">
              <div class="box-body">
                <div class="form-group" >                  
                  <textarea class="form-control" name="ResourceDescription" rows="4" cols="5" style="border-radius: 15px;" placeholder="Description" required></textarea>
                </div>
                    <div class="form-group">
                        <select name="ProgramID" class="form-control" style="border-radius: 15px;">
                            
                            <option value="<%=7%>">Select technology </option>
                            <%
                                rs=cn.getcon().prepareStatement("select TechnID,TechName from  Techno where 1 ").executeQuery();
                            while(rs.next()) {
                            %>
                            <option value="<%= rs.getInt(1) %>"><%= rs.getString(2) %></option>
                           
                            <%} cn.getcon().close(); %>
                            
                        </select>
                   </div>

                <div class="form-group">
                  
                  <input type="file" name="ResourcePDF" id="exampleInputFile">                  
                </div>
                <div class="form-group">
                  
                  <input type="text" name="ResourceRef1"class="form-control" id="reference" style="border-radius: 15px;" placeholder="Reference 1" required>
                </div>
                <div class="form-group">
                  
                  <input type="text"  name="ResourceRef2" class="form-control" id="reference2" style="border-radius: 15px;" placeholder="Reference 2" required>
                </div>
                <div class="form-group">
                  
                  <input type="text" name="ResourceRef3" class="form-control" id="reference3" style="border-radius: 15px;" placeholder="Reference 3" required>
                </div>
                <div class="form-group">
                
                  <input type="text" name="ResourceRef4"  class="form-control" id="reference4" style="border-radius: 15px;" placeholder="Reference 4" required>
                </div>
                <div class="form-group">
                
                  <input type="text"  name="ResourceRef5"  class="form-control" id="reference4" style="border-radius: 15px;" placeholder="Reference 5" required>
                </div>
                                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
              <button type="button" class="btn btn-default pull-left ion-close-round" data-dismiss="modal"> Close</button>
                <button type="submit" class="btn btn-primary pull-right ion-ios-redo">  Post</button>
              </div>
            </form>
          </div>
        <!-- /.box-body -->
                 
          <!--box-footer -->             
      </div>
 <!-- /.modal-content -->
  </div>
<!-- /.modal-dialog -->
</div>



<div class="modal fade" id="modal-regadmin">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Register Administrator</h4>
              </div>
              <div class="">
          
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post">
              <div class="box-body">
                <div class="form-group">
                 
                  <input type="text"name="UserName"  style="border-radius: 15px;" class="form-control" id="exampleInputEmail1" placeholder="Enter names" required>
                </div>
                <div class="form-group">
                  
                    <select class="form-group col-sm-12" name="ProgramID">
                    <option name="">Area of expertize</option> 
                    <%
                        rs=cn.getcon().prepareStatement("select ProgramID,ProgramName from Program ").executeQuery();
                        while (rs.next())
                        {
                    %>
                    <option value="<%= rs.getInt(1) %>"><%= rs.getString(2) %></option>
                    <%} cn.getcon().close(); %>
                    
                    
                  </select>
                </div>
                <div class="form-group">
                    <input type="text" name="City"class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="Adress" required>
                </div>
                <div class="form-group">
                  
                    <input type="email" name="Email" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="email" required>
                </div>
                <div class="form-group">
                    <input type="text" name="Tel" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="Phone number">
                </div>
                    <div class="form-group">
                        <input type="password" name="Passwd" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="Password" required>
                </div>
               
                </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit"  name="NewAdmi" class="btn btn-primary pull-right"><span class="ion-ios-redo"></span>Register</button>
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal"><span class="ion-close-round"></span>Close</button>
              </div>
            </form>
          </div>
        <!-- /.box-body -->           
      </div>
 <!-- /.modal-content -->
  </div>
<!-- /.modal-dialog -->
</div>

 <div class="modal fade" id="modal-changepassword">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="color: #483D8B;font-weight:bold;">Change password</h4>
              </div>
              <div class="">
          
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post">
              <div class="box-body">
                <div class="form-group">

                    <input type="password" name="Old" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="enter Current password" required>
                </div>
                <div class="form-group">
                  <input type="password" name="Passwd"class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="enter new password" required>
                </div>
                <div class="form-group">
                  <input type="password" name="Check"class="form-control" id="exampleInputEmail1" style="border-radius: 15px;" placeholder="re-enter new password" required>
                </div>             
                </div>
              <!-- /.box-body -->

              <div class="box-footer">
                  <button type="submit" name="Change"class="btn btn-primary pull-right"><span class="ion-ios-redo"> </span>Confirm</button>
                <button type="button" class="btn btn-default pull-left ion-close-round" data-dismiss="modal">Close</button>
              </div>
            </form>
          </div>
        <!-- /.box-body -->           
      </div>
 <!-- /.modal-content -->
  </div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal content -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   

    <!-- Main content -->
 <section class="content">

    <div class="row">
                  
      <div class="col-md-12">
          <div class="nav-tabs-custom">
             <ul class="nav nav-tabs">                               
              <li><a href="#viewopportunity" data-toggle="tab">View oppurtunity</a></li>
              <li><a href="#viewevent" data-toggle="tab">View event</a></li>                           
              <li><a href="#viewexperience" data-toggle="tab">View experience</a></li>
              <li><a href="#viewidea" data-toggle="tab">View ideas</a></li>              
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="viewopportunity">
                <!-- Post -->
                <%
                    rs=cn.getcon().prepareStatement("select OppContent, CompanyName, dttime from Opportunity ORDER BY OppID DESC ").executeQuery();
                    while (rs.next())
                        {
                %>
                <div class="post">
                  <div class="user-block">
                   <!-- <img class="img-circle img-bordered-sm" src="../../dist/img/2.jpg" alt="user image">-->
                        <span class="username">
                            <a href="#" style="margin-left : -10 ;"><%=rs.getString(2) %></a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                            <span class="description">Shared on <%=rs.getTimestamp(3) %> </span>
                  </div>
                  <!-- /.user-block -->
                  <p>
                      <%= rs.getString(1) %>
                  </p>
                </div><%} cn.getcon().close(); %>
                
                
                <!-- /.post -->
                 

              </div>
              <!-- /.tab-pane -->

             <!-- view experience posts and comment-->
<!-- start view experience -->
              <div class="tab-pane" id="viewexperience">
                <div class="row">
                  <div class="col-md-12">
                      <%
                          rs=cn.getcon().prepareStatement("select Experience.ExperienceID,Experience.ExperienceContent,Experience.DateTime, User.UserName, User.Photo from Experience,User where User.UserID=Experience.UserID ORDER BY ExperienceID DESC limit 2").executeQuery();
                          while (rs.next())
                          {
                      %>
                    <div class="box box-widget">
                      <div class="box-body">
                        <div class="post">
                          <div class="user-block">
                              <img class="img-circle img-bordered-sm" src="../../profile/<%=rs.getString(5)%>" alt="User Image">
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
                              ResultSet Set= cn.getcon().prepareStatement("select CommentExp.CommentContent,CommentExp.DateTime,User.UserName ,User.Photo from CommentExp,User where User.UserID=CommentExp.UserID  and CommentExp.ConcernedID ="+rs.getInt(1)+"").executeQuery();
                              while(Set.next())
                                {
                               %>
                        <div class="box-comment">
                          <!-- User image -->
                           <img class="img-circle img-sm" src="../../profile/<%=rs.getString(4)%>" alt="User Image">

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
                <form role="form" action="Admin.jsp?pxe=<%=rs.getInt(1)*2017%>" method="post">
                  <div class="box-body">
                    <div class="form-group">

                        <textarea name="CommentContent" class="form-control" id="exampleInputEmail1" style="border-radius: 15px;">  </textarea>
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
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="viewevent">
                  <%
                    rs=cn.getcon().prepareStatement("select EventName, InstitutionName,Description, dttime from Event ORDER BY EventID DESC ").executeQuery();
                    while (rs.next())
                        {
                %>
                <div class="post">
                  <div class="user-block">
                   <!-- <img class="img-circle img-bordered-sm" src="../../dist/img/2.jpg" alt="user image">-->
                        <span class="username">
                            <a href="#" ><%=rs.getString(2)  %> : <%=rs.getString(1)  %> </a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                            <span class="description">Shared on <%=rs.getTimestamp(4) %> </span>
                  </div>
                  <!-- /.user-block -->
                  <p>
                      <%= rs.getString(3) %>
                  </p>
                </div><%} cn.getcon().close(); %>
              
              </div>

              <div class="tab-pane" id="viewidea">
                <div class="row">
                  <div class="col-md-12">
                    <%
                          rs=cn.getcon().prepareStatement("select Proposition.PropositionID, Proposition.PropositionContent,Proposition.DateTime, Domain.DomainName, User.UserName , User.Photo from Proposition,User, Domain  where User.UserID=Proposition.UserID and  Domain.DomainID =  Proposition.DomainID  ORDER BY Proposition.PropositionID DESC limit 2").executeQuery();
                          while (rs.next())
                          {
                      %>
                    <div class="box box-widget">
                      <div class="box-body">
                        <div class="post">
                          <div class="user-block">
                            <img class="img-circle img-bordered-sm" src="../../profile/<%=rs.getString(6)%>" alt="User Image">
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
                              ResultSet Set= cn.getcon().prepareStatement("select Comment.CommentContent,Comment.DateTime,User.UserName,Comment.CommentID ,User.Photo from Comment,User where User.UserID=Comment.UserID  and Comment.ConcernedID ="+rs.getInt(1)+"").executeQuery();
                              while(Set.next())
                                {
                               %>
                        <div class="box-comment">
                          <!-- User image -->
                           <img class="img-circle img-sm" src="../../profile/<%=rs.getString(5)%>" alt="User Image">

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
                        <a href="#" data-toggle="modal" data-target="#<%=rs.getInt(1)%>" > Add comment </a>
                        <a href="#" data-toggle="modal" data-target="#addcomment" style="margin-right:10;"class="text-muted pull-right"> Participate </a>
                        
                      </div>
                                               
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
                <form role="form" action="Admin.jsp?adi=<%=rs.getInt(1)*2017%>" method="post">
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
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>

     <!-- STARTING OF PART 2 -->

        <div class="col-md-12">
         <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#developper" data-toggle="tab">Manage developpers</a></li>
              <li><a href="#mentors" data-toggle="tab">Manage mentors</a></li>
              <li><a href="#group" data-toggle="tab">Manage groups</a></li>
              <li><a href="#admin" data-toggle="tab">Manage admins</a></li>              
            </ul>
           <!-- /mange mentors table --> 
   <div class="tab-content">
        <div class="tab-pane" id="mentors">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                                
                        <div class="box-body table-responsive no-padding">
                          <table class="table table-hover">
                            <tr>
                              <th>Name</th>
                              <th>Domain</th>
                              <th>Expertise</th> 
                               <th>Country/City</th> 
                               <th>Telephone</th> 
                              <th>Action</th>
                            </tr>
                          <%
                    rs=cn.getcon().prepareStatement("select User.UserID, User.UserName,Domain.DomainName,Program.ProgramName, User.Country, User.City, User.Tel from User,Program,Domain where Program.ProgramID = User.ProgramID and Domain.DomainID = User.DomainID and User.UserCategoryID= 2").executeQuery();
                    while (rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString(2) %></td>
                      <td><%=rs.getString(3) %></td>
                      <td><%=rs.getString(4) %></td>  
                       <td><%=rs.getString(5)%>/<%=rs.getString(6)%></td>  
                        <td><%=rs.getString(7) %></td>  
                     
                      <td><button type="button" class="btn btn-info btn-xs">Remove</button> <button type="button" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#<%=rs.getInt(1)*2015%>">View Project</button></td>
                    </tr>
                    <%} cn.getcon().close(); %>
                        </table>
                        </div>                
                </div>       
            </div>
          </div>
      </div>
      <!-- /. manage mentors table-->

       <!-- manage developper table -->
      <div class="active tab-pane" id="developper">                
        <div class="active tab-pane" id="developper">
          <div class="row">
             <div class="col-xs-12">
                <div class="box">                       
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>Name</th>
                      <th>Domain</th>
                      <th>Prog Lag</th>
                       <th>Country/City</th>
                       <th> Tel</th>
                     <th>Action</th>
                    </tr>
                    <%
                    rs=cn.getcon().prepareStatement("select User.UserID, User.UserName,Domain.DomainName,Program.ProgramName, User.Country, User.City, User.Tel from User,Program,Domain where Program.ProgramID = User.ProgramID and Domain.DomainID = User.DomainID and User.UserCategoryID= 1").executeQuery();
                    while (rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString(2) %></td>
                      <td><%=rs.getString(3) %></td>
                      <td><%=rs.getString(4) %></td>  
                       <td><%=rs.getString(5)%>/<%=rs.getString(6)%></td>  
                        <td><%=rs.getString(7) %></td>  
                     
                      <td><button type="button" class="btn btn-info btn-xs">Remove</button> <button type="button" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#<%=rs.getInt(1)%>">View Project</button></td>
                    </tr>
                    <%} cn.getcon().close(); %>
                    
                    
                  </table>
               </div>               
             </div>             
            </div>
          </div>
        </div>
      </div>
      <!--.\ manage developper table-->

<!--.\ manage group table-->
        <div class="tab-pane" id="group">                
                <div class="tab-pane" id="group">
                  <div class="row">
                     <div class="col-xs-12">
                        <div class="box">                                      
                        <div class="box-body table-responsive no-padding">
                          <table class="table table-hover">
                            <tr>
                              <th>Name</th>
                              <th>Creator</th>
                              <th>Date of Creation</th>
                              <th>Action</th>
                            </tr>
                   <%
                    rs=cn.getcon().prepareStatement("select Team.TeamID,Team.DomainName,User.UserName,Team.DateTime from User, Team where User.UserID= Team.UserID  ").executeQuery();
                    while (rs.next()){
                    %>
                    <tr>
                      <td><%=rs.getString(2) %></td>
                      <td><%=rs.getString(3) %></td>
                      <td><%=rs.getTimestamp(4) %></td>  
                      <td><button type="button" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#<%=rs.getInt(1)+2015%>">View Project</button>     <button type="button" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#<%=rs.getInt(1)+2017%>">View Members</button></td>
                    </tr>
                    <%} cn.getcon().close(); %>
                            </table>
                       </div>               
                     </div>             
                    </div>
                  </div>
                </div>
              </div>
<!-- .\ manage groups table-->

          <!--.\ manage Admin table-->
        <div class="tab-pane" id="admin">                
                <div class="tab-pane" id="admin">
                  <div class="row">
                     <div class="col-xs-12">
                        <div class="box">                                       
                        <div class="box-body table-responsive no-padding">
                          <table class="table table-hover">
                           <tr>
                              <th>Name</th>
                              <th>Creator</th>
                              <th>Date of Creation</th>
                              <th>Action</th>
                            </tr>
                             <%
                    rs=cn.getcon().prepareStatement("select User.UserID, User.UserName,Domain.DomainName,Program.ProgramName, User.Country, User.City, User.Tel from User,Program,Domain where Program.ProgramID = User.ProgramID and Domain.DomainID = User.DomainID and User.UserCategoryID= 3").executeQuery();
                    while (rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString(2) %></td>
                      <td><%=rs.getString(3) %></td>
                      <td><%=rs.getString(4) %></td>  
                       <td><%=rs.getString(5)%>/<%=rs.getString(6)%></td>  
                        <td><%=rs.getString(7) %></td>  
                     
                      <td><button type="button" class="btn btn-info btn-xs">Remove</button> <button type="button" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#<%=rs.getInt(1)%>">View Project</button></td>
                    </tr>
                    <%} cn.getcon().close(); %>
                           
                        
                          </table>
                       </div>               
                     </div>             
                    </div>
                  </div>
                </div>
              </div>
        <!-- .\ manage Admin table-->

        <!--View list modals-->
        <%
                    rs= cn.getcon().prepareStatement("Select UserID,UserName from User where UserCategoryID = 1  ").executeQuery();
                    while (rs.next())
                    {
        %>
        <div class="modal" id="<%=rs.getInt(1)%>" >
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title">List of projects</h4>
                      </div>
                      <div class="box box-primary">
                  
                    <!-- /.box-header -->
                    <!-- form start -->
                   
                      <div class="box-body">  
                          <%
                          ResultSet Ts= cn.getcon().prepareStatement("Select ProjectIcon,ProjectName,ProjectDescription from Project  where UserID="+rs.getInt(1)+"").executeQuery();
                          while(Ts.next())
                          {
                          %>
                            <div class="user-block">
                              <img class="img-circle img-bordered-sm" src="../../dist/img/1.jpg" alt="user image">
                                  <span class="username">
                                      <a href="#"> <b><%= Ts.getString(2) %></b></a>                            
                                  </span>
                              <p>
                                <%= Ts.getString(3) %>
                            </p>
                          </div><%} %>
                        <hr>
                     
                         
                                <!-- /.box-body -->

                      <div class="box-footer">
                          <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                      </div>
                    
                  </div>
                <!-- /.box-body -->           
              </div>
         <!-- /.modal-content -->
           </div>
        <!-- /.modal-dialog -->
        </div>
        </div>
                        <%}
                    cn.getcon().close();
                  %>
                  <!--Group Members-->
                   <%
                    rs= cn.getcon().prepareStatement("Select TeamID from Team where  1  ").executeQuery();
                    while (rs.next())
                    {
        %>
        <div class="modal" id="<%=rs.getInt(1)+2015%>" >
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title">List of projects</h4>
                      </div>
                      <div class="box box-primary">
                  
                    <!-- /.box-header -->
                    <!-- form start -->
                   
                      <div class="box-body">  
                          <%
                          ResultSet Ts= cn.getcon().prepareStatement("Select ProjectIcon,ProjectName,ProjectDescription from Project  where TeamID="+rs.getInt(1)+"").executeQuery();
                          while(Ts.next())
                          {
                          %>
                            <div class="user-block">
                              <img class="img-circle img-bordered-sm" src="../../dist/img/1.jpg" alt="user image">
                                  <span class="username">
                                      <a href="#"> <b><%= Ts.getString(2) %></b></a>                            
                                  </span>
                              <p>
                                <%= Ts.getString(3) %>
                            </p>
                          </div><%} %>
                        <hr>
                     
                         
                                <!-- /.box-body -->

                      <div class="box-footer">
                          <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                      </div>
                    
                  </div>
                <!-- /.box-body -->           
              </div>
         <!-- /.modal-content -->
           </div>
        <!-- /.modal-dialog -->
        </div>
        </div>
                        <%}
                    cn.getcon().close();
                  %>
                 
                  <!-- Mentees -->
                   <%
                    rs= cn.getcon().prepareStatement("Select UserID,UserName from User where UserCategoryID = 2  ").executeQuery();
                    while (rs.next())
                    {
                    %>
        <div class="modal" id="<%=rs.getInt(1)*2015%>" >
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title">List of projects</h4>
                      </div>
                      <div class="box box-primary">
                  
                    <!-- /.box-header -->
                    <!-- form start -->
                   
                      <div class="box-body">  
                          <%
                          ResultSet Ts= cn.getcon().prepareStatement("Select User.UserName, User.Photo from User, MentorRequest where User.UserID = MentorRequest.UserID and MentorRequest.Status = 1 and MentorRequest.MentorID ="+rs.getInt(1)+"").executeQuery();
                          while(Ts.next()) 
                          {
                          %>
                            <div class="user-block">
                              <img class="img-circle img-bordered-sm" src="../../dist/img/1.jpg" alt="user image">
                                  <span class="username">
                                      <a href="#"> <b><%= Ts.getString(1) %></b></a>                            
                                  </span>
                                  <hr
                             </div><%} %>
                        <hr>
                     
                         
                                <!-- /.box-body -->

                      <div class="box-footer">
                          <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                      </div>
                    
                  </div>
                <!-- /.box-body -->           
              </div>
         <!-- /.modal-content -->
           </div>
        <!-- /.modal-dialog -->
        </div>
        </div>
                        
                        <%}
                    cn.getcon().close();
                  %>
                  <!--Group Member--> 
                   <%
                    rs= cn.getcon().prepareStatement("Select  TeamID from Team where  1 ").executeQuery();
                    while (rs.next())
                    {
                    %>
        <div class="modal" id="<%=rs.getInt(1)+2017%>" >
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title">List of projects</h4>
                      </div>
                      <div class="box box-primary">
                  
                    <!-- /.box-header -->
                    <!-- form start -->
                   
                      <div class="box-body">  
                          <%
                          ResultSet Ts= cn.getcon().prepareStatement("Select User.UserName, User.Photo from User, TeamMembers where User.UserID = TeamMembers.UserID and TeamMembers.TeamID ="+rs.getInt(1)+"").executeQuery();
                          while(Ts.next()) 
                          {
                          %>
                            <div class="user-block">
                              <img class="img-circle img-bordered-sm" src="../../dist/img/1.jpg" alt="user image">
                                  <span class="username">
                                      <a href="#"> <b><%= Ts.getString(1) %></b></a>                            
                                  </span>
                                  <hr
                             </div><%} %>
                        <hr>
                            <!-- /.box-body -->
                  <div class="box-footer">
                          <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                      </div>
                    
                  </div>
                <!-- /.box-body -->           
              </div>
         <!-- /.modal-content -->
           </div>
        <!-- /.modal-dialog -->
        </div>
        </div>
   </div>
                        <%}
                    cn.getcon().close();
                  %>
                  
                   
                <div class="modal" id="view-message">
                 
                    <div class="modal-content">
                      <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title">List of projects</h4>
                      </div>
                      <div class="box box-primary">
                  
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form role="form">
                      <div class="box-body"> 
                          
                            <div class="user-block">
                              <img class="img-circle img-bordered-sm" src="../../dist/img/1.jpg" alt="user image">
                                  <span class="username">
                                    <a href="#"> <b>Dev</b>Plug</a>                            
                                  </span>
                            <!-- /.user-block -->
                            <p>
                              Lorem ipsum represents a long-held tradition for designers,
                              typographers and the like.
                            </p>
                          </div>
                        <hr>
                     
                        
                          
                                <!-- /.box-body -->

                      <div class="box-footer">
                        
                        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                      </div>
                    </form>
                  </div>
                <!-- /.box-body -->           
              </div>
         <!-- /.modal-content -->
           </div>
        <!-- /.modal-dialog -->
        </div>

          

              

              <!-- /.tab-pane -->
            </div>
                  
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
    </section>

 
      <!-- /.row -->
    <!-- /.content -->
  </div>  <!-- END PART 2-->
 
    
     </div>
  </section>
  </div>
  </div>


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-clear">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
  </aside>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

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
