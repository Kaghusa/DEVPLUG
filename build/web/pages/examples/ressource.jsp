<%@page import="Operation.dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<% 
     if (session.getAttribute("Mname")==null )
        {
            response.sendRedirect("login.jsp");
        } 
   
    String username = session.getAttribute("Mname").toString(); 
    int id= Integer.parseInt(session.getAttribute("Mid").toString());
    String profile= session.getAttribute("Mprofile").toString();
   // we call the class for the database connectivity 
    dbconnect cn= new dbconnect ();
    // we call the mysql drive class 
    cn.GetDrive();
    // we create a resultset variable for out data collection 
    ResultSet rs=null;    
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>DevPlug| Ressources</title>
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
      <span class="logo-mini"><b>PluG</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>DevPluG</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <span style="font-size: 28px;color:#fff;line-height: 50px;text-align: center;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;font-weight: 300;"><span class="ion-briefcase"></span>Resources</span>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
    <div class="content">
      <div class="row">
        <div class="col-md-12 ">
          <!-- TABLE: LATEST ORDERS -->
            <div class="box box-info ">
              <div class="box-header with-border">
                <h3 class="box-title">Tutorials</h3>
              </div>
            <!-- /.box-header -->
            <div class="box-body">
              
              <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" href="#collapse1">Java Technologies</a>
                    </h4>
                  </div>
                  <div id="collapse1" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="col-md-12">
                        <div class="table-responsive">
                          <!-- java tutorial starts here -->
                          
                          <table class="table no-margin">
                            <thead>
                            <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 2 ").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a> </td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                            </tbody>
                          </table><hr><!--  ENDS OF JAVA TUTORIAL -->
                          
                                           
                        </div>
                      </div>
                   </div>                   
                  </div>
                </div>
              </div>
                
              <!-- START PHP TUTOTIAL --> 
              <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" href="#php">Scripts</a>
                    </h4>
                  </div>
                  <div id="php" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="table-responsive">
                        
                        <table class="table no-margin">
                          <thead>
                           <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 6 ").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a> </td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                         
                        
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div><!-- END OF PHP TUTORIALS -->
              

                <!-- START C++ TUTORIALS -->
              <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#c">
                      Computer Programming </a>
                    </h4>
                  </div>
                  <div id="c" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="table-responsive">
                       
                          <table class="table no-margin">
                            <thead>
                           <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 7 ").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a> </td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                            
                            </tbody>
                          </table><!-- END OF C++ TUTORIALS -->
                        </div>
                    </div>
                  </div>
                </div>
              </div>
                

              <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" href="#ios">Apple Technologies</a>
                    </h4>
                  </div>
                  <div id="ios" class="panel-collapse collapse">
                    <div class="panel-body">
                       <!-- START PYTHON TUTORIALS -->
                      <div class="col-md-12">
                        <div class="table-responsive">  
                          
                          <table class="table no-margin">
                            <thead>
                            <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 3 ").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a> </td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                            
                            
                            </tbody>
                          </table><hr><!-- END OF PYTHON TUTORIALS -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
                <!-- Ruby tutorials-->
             <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" href="#ruby"> Embeded System</a>
                    </h4>
                  </div>
                  <div id="ruby" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="col-md-12">
                        <div class="table-responsive">
                          <!-- java tutorial starts here -->
                       
                          <table class="table no-margin">
                            <thead>
                           <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 8").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a></td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                            
                           
                            </tbody>
                          </table><hr><!--  ENDS OF RUBY TUTORIAL -->
                          
                                           
                        </div>
                      </div>
                   </div>                   
                  </div>
                
            </div>

          </div><!-- \\ END OF BOX BODY -->
          
                          <!-- Ruby C# mobile apps-->
             <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" href="#cmobile"> Microsoft Technologies</a>
                    </h4>
                  </div>
                  <div id="cmobile" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="col-md-12">
                        <div class="table-responsive">
                          <!-- c# tutorial starts here -->
                       
                          <table class="table no-margin">
                            <thead>
                            <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 1 ").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a> </td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                            
                          
                            </tbody>
                          </table><hr><!--  ENDS OF RUBY TUTORIAL -->
                          
                                           
                        </div>
                      </div>
                   </div>                   
                  </div>
                
            </div>

          </div> <!-- end of SQL tutorials-->
          
           <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" href="#sqlopen"> DATABASE </a>
                    </h4>
                  </div>
                  <div id="sqlopen" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="col-md-12">
                        <div class="table-responsive">
                          <!-- c# tutorial starts here -->
                       
                          <table class="table no-margin">
                            <thead>
                            <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 4 ").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a> </td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                            
                           
                            </tbody>
                          </table><hr><!--  ENDS OF SQL TUTORIAL -->
                          
                                           
                        </div>
                      </div>
                   </div>                   
                  </div>
                
            </div>

          </div> <!-- end of SQL tutorials-->
          
           <div class="col-md-6 panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" href="#javascriptopen"> Web Technology </a>
                    </h4>
                  </div>
                  <div id="javascriptopen" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="col-md-12">
                        <div class="table-responsive">
                          <!-- c# tutorial starts here -->
                       
                          <table class="table no-margin">
                            <thead>
                           <tr>
                              <th>PDF Tutorial</th>
                              <th>Description</th>
                              <th>References</th>
                              <th>Operation</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                               rs=cn.getcon().prepareStatement("Select ResourceID, ResourcePDF from Resources where ProgramID = 5 ").executeQuery();
                               while (rs.next())
                               {
                            %>
                               
                            <tr>
                                <td><img src="../../dist/img/pdf7.jpg" class="img-circle img-sm"><%=rs.getString(2) %></td>
                              <td><a href="" data-toggle="modal" data-target="#Des<%=rs.getInt(1)%>">View</a> </td>
                              <td><a href="" data-toggle="modal" data-target="#Ref<%=rs.getInt(1)%>">View</a></td>
                              <td><a  href="../../ressources/<%=rs.getString(2)%>" class="btn btn-info btn-sm" style="border-radius: 50px;">Read<span class="glyphicon glyphicon-download "></span></a> </td>
                              
                            </tr>
                          <%} cn.getcon().close(); %>
                            
                            
                            </tbody>
                          </table><hr><!--  ENDS OF SQL TUTORIAL -->
                          
                                           
                        </div>
                      </div>
                   </div>                   
                  </div>
                
            </div>

          </div> <!-- end of javascript-->
        </div>
        <!-- /.box-footer -->
      </div><!-- \\ END OF COLUMN 12 -->
    </div><!-- END OF ROW -->
  </div><!-- END OF CONTENT -->
</div>

<!-- STARTS ALL MODALS -->


  <!-- MODALS OF JAVA TUTORIAL-->


    <!-- START VIEW REFERENCE OF JAVA INTRODUCTION -->
                        <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 2 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
           
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
                      <%/// teckno 1
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 1 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
          
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <%//3
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 3 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%// 3
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
          
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <%//4
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 4 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
          
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <%//5
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 5 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
        
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <%//6
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 6 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
          
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <%//7
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 7").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
       
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 7 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 8 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Ref<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4, ResourceRef5 from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
        
            <p>[1]<a href="<%=st.getString(1)%>"><%=st.getString(1)%></a><br>
              [2]<a href="<%=st.getString(2)%>"><%=st.getString(2)%></a><br>
              [3]<a href="<%=st.getString(3)%>"><%=st.getString(3)%></a><br>
              [4]<a href="<%=st.getString(4)%>"><%=st.getString(4)%></a><br>
              [5]<a href="<%=st.getString(5)%>"><%=st.getString(5)%></a><br>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
      <!-- START VIEW REFERENCE OF JAVA INTRODUCTION -->
  

    
  <!-- start of sql reference -->
   
    
    <!-- START INTRODUCTION TO JAVA FRAME -->
    <!-- START INTRODUCTION TO JAVA SERVELET -->
   

    <!-- START VIEW REFERENCE OF JAVA FRAME -->
    <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 2 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
     <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 3 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
     <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 4 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
     <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 5 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
     <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 6 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
     <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 7 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
     <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 8 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
     <%
                               rs=cn.getcon().prepareStatement("Select ResourceID from Resources where ProgramID = 1 ").executeQuery();
                               while (rs.next())
                               {
                            %>
     <div class="modal fade" id="Des<%=rs.getInt(1)%>">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
            <%
                ResultSet st= cn.getcon().prepareStatement("select ResourceDescription from Resources where ResourceID = "+rs.getInt(1)+"").executeQuery();
                if (st.next())
                {
            %>
          <div class="modal-body">
            
            <p>
                <%=st.getString(1) %>
              </p>
          </div>  
            <%}  %>  
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA INTRODUCTION --><%} cn.getcon().close(); %>
    <div class="modal fade" id="javaserveletreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JAVA FRAME -->
    

    <!-- START INTRODUCTION TO JSP -->
    <div class="modal fade" id="jsp">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- end of introduction to JSP -->

    <!-- START VIEW REFERENCE OF JSP -->
    <div class="modal fade" id="jspreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF JSP -->
    <!-- \\\\\  END OF JAVA MODALS \\\\\\ -->

    <!-- START C++ TUTOLRIAL MODALS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <!-- START C++ INTRODUCTION  -->
    <div class="modal fade" id="cintro">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF C++ INTRODUCTION  -->

    <!-- START VIEW REFERENCE OF C++ INTRODUCTION-->
    <div class="modal fade" id="cintroreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF C++ INTRODUCTION -->

    <!-- START C++BASICS  -->
    <div class="modal fade" id="cbasic">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF C++ BASICS  -->

    <!-- START VIEW REFERENCE OF C++ BASICS-->
    <div class="modal fade" id="cbasicreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF C++ BASICS-->


    <!-- START C++ FUNCTIONS -->
    <div class="modal fade" id="cfunction">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF C++ FUNCTION -->

    <!-- START VIEW REFERENCE OF C++ FUNCTION-->
    <div class="modal fade" id="cfunctionreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF C++ FUNCTION-->
    
      <!-- START of JS overview -->
    <div class="modal fade" id="jsoverview">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Js overview </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END of Java sript overview -->
    
    
    <!-- START C++  ARRAYS -->
    <div class="modal fade" id="carrays">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF C++ ARRAYS -->

    <!-- START VIEW REFERENCE OF C++ ARRAYS-->
    <div class="modal fade" id="carraysreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF C++ ARRAYS-->

    <!-- START C++  STRING -->
    <div class="modal fade" id="cstring">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF C++ STRING -->

    <!-- START VIEW REFERENCE OF C++ STRING-->
    <div class="modal fade" id="cstringreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF C++ STRING-->
    <!-- END OF C++ TUTORIAL MODALS ##################################################-->

    <!-- START PHP TUTORIALS MODAL @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <!-- START INTRODUCTION TO PHP -->
    <div class="modal fade" id="phpintro">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- end of introduction to php -->

    <!-- START VIEW REFERENCE OF php INTRODUCTION -->
    <div class="modal fade" id="phpreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF PHP INTRODUCTION -->


    <!-- START PHP BASICS -->
    <div class="modal fade" id="phpbasic">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;">  Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- end of php basics -->

    <!-- START VIEW REFERENCE OF PHP BASIC -->
    <div class="modal fade" id="basicreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- OF VIEW REFERENCE OF PHP BASICS -->

    <!-- START PHP FUNCTION -->
    <div class="modal fade" id="phpfunction">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF PHP FUNCTION -->

    <!-- START VIEW REFERENCE OF PHP FUNCTION -->
    <div class="modal fade" id="phpfunctionreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!--END  OF VIEW REFERENCE OF PHP -->
    

    <!-- START PHP ARRAY -->
    <div class="modal fade" id="phparray">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF PHP ARRAY -->

    <!-- START VIEW REFERENCE OF PHP ARRAY -->
    <div class="modal fade" id="phparrayreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF PHP ARRAY -->

    <!-- START PHP STRING  -->
    <div class="modal fade" id="phpstring">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF PHP STRING -->

    <!-- START VIEW REFERENCE OF PHP STRING -->
    <div class="modal fade" id="phpstringreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF PHP string -->
    <!--END PHP TUTORIAL MODALS ################################################################
    ########################################################################################-->


    <!-- START PYTHON TUTORIAL MODALS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <!-- START PYTHON INTRODUCTION  -->
    <div class="modal fade" id="pythonintro">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF PYTHON INTRODUCTION  -->

    <!-- START VIEW REFERENCE OF PYTHON -->
    <div class="modal fade" id="pythonreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF PYTHON -->


    <!-- START PYTHON BASIC  -->
    <div class="modal fade" id="pythonbasic">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF PYTHON BASIC  -->

    <!-- START VIEW REFERENCE OF PYTHON BASIC -->
    <div class="modal fade" id="pythonbasicreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF PYTHON BASIC -->

    <!-- START PYTHON FUNCTION  -->
    <div class="modal fade" id="pythonfunction">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF PYTHON FUNCTION  -->

    <!-- START VIEW REFERENCE OF PYTHON FUNCTION -->
    <div class="modal fade" id="pythonfunctionreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF PYTHON FUNCTION -->

    <!-- START PYTHON ARRAY  -->
    <div class="modal fade" id="pythonarray">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Abstract of this tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>Introduction</h3>
            <p>It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF PYTHON ARRAY  -->

    <!-- START VIEW REFERENCE OF PYTHON ARRAY-->
    <div class="modal fade" id="pythonarrayreference">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> Reference of Tutorial </h4>
          </div>
          <div class="modal-body">
            <h3>References:</h3>
            <p>[1]It is a long established fact that a reader will be distracted<br>
              [2]by the readable content of a page when looking at its layout.<br>
              [3]It is a long established fact that a reader will be distracted
              </p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div><!-- END OF VIEW REFERENCE OF PYTHON ARRAY -->
    <!-- END PYTHON TUTORIAL MODALS -->
</div>









      
      

<footer class="main-footer">
     <p style="margin-left:250px; font-size:20px;">&copy 2017 <strong>DevPlug</strong> All rights reserved. </p>
</footer>
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
