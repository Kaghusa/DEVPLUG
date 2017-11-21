<%@page import="java.sql.ResultSet"%>
<%@page import="Operation.dbconnect"%>
<!DOCTYPE html>
<% 
   // we call the class for the database connectivity 
    dbconnect cn= new dbconnect ();
    // we call the mysql drive class 
    cn.GetDrive();
    // we create a resultset variable for out data collection 
    ResultSet rs=null; 
    if (session.getAttribute("Mname")==null )
        {
            response.sendRedirect("login.jsp");
        } 
   
    String username = session.getAttribute("Mname").toString(); 
    int id= Integer.parseInt(session.getAttribute("Mid").toString());
    String profile= session.getAttribute("Mprofile").toString();
    
    
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Project/DevPlug</title>
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
  <!-- Pace style -->
  <link rel="stylesheet" href="../../plugins/pace/pace.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="../../index2.html" class="logo">
      <!-- logo for regular state and mobile devices -->
       <p>DevpluG</p>
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
      <span style="font-size: 20px;color:#fff;line-height: 50px;text-align: center;font-family: "Helvetica Neue" ,Helvetica,Arial,sans-serif,font-weight: 300;" class="ion-ios-cart"> DevPlug Store </span>
    </nav>
  </header>

  <!-- =============================================== -->

  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar" >
        <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="margin-top:20px;">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree" style="color:white;font-weight:bold;">
   <li class="active" ><a href="#allcategory" data-toggle="tab" style="color:white;font-weight:bold;"><i class="ion-ios-keypad"> </i> <span>All Category</span> </a></li>
<%
// get all domains fro the database 
    rs=cn.getcon().prepareStatement("select DomainID,DomainName from Domain where 1" ).executeQuery();
    while (rs.next())
    {
%>     
   <li><a href="#<%=rs.getInt(1)%>" data-toggle="tab" style="color:white;font-weight:bold;"><i class="ion-medkit"> </i> <span><%=rs.getString(2).toLowerCase()  %></span> </a></li>
    <%} cn.getcon().close(); %>   
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <div class="tab-content">

        <!--ALL CATEGORY-->
  <div class="active tab-pane" id="allcategory">

  <div class="box-body">
  <div class="col-md-10">
    <div class="table-responsive">
       <table class="table table-bordered">
        <thead>
        <tr>
          <th>Icon</th>
           <th>Project Name  </th>
            <th>Developer Name  </th>
          <th>Documentation </th>
          <th>Description</th>
        </tr>
        <br>
      <div class="tab-pane">
          <h4 class="" style="font-weight:bold; font-family:sans-serif;">All Categories  </h4>
      </div>
        </thead>
        <tbody>
            <% 
            // get top 100 Projects on the system
            ResultSet et= cn.getcon().prepareStatement(" select Project.ProjectID,Project.ProjectName,Project.ProjectIcon, User.UserName,Project.ProjectDocPDF from Project, User where User.UserID= Project.UserID ORDER BY Project.ProjectID DESC LIMIT 100 ").executeQuery();
            while(et.next())
            { 
            %>
        <tr>
            <td><img class="img-circle img-sm" src="../../Projects/<%=et.getString(3) %>" alt="User Image"></td>
            <td align="center"><%=et.getString(2) %></td>
              <td align="center"><%=et.getString(4) %></td>
          <!--<td><button type="button"  class="btn btn-primary ">Like <span class="glyphicon glyphicon-thumbs-up"></span></button></td>-->
          <td align="center"><a href="../../Projects/<%=et.getString(5) %>" class="ion-archive btn btn-primary"> Docs <span class=""></span></a></td>
          <td><a href="" data-toggle="modal" data-target="#d<%=et.getInt(1)%>">Description</a> </td>
          
        </tr>
        <%} cn.getcon().close(); %>
         </tbody>
      </table><!--  ENDS OF HEALTH -->
        </table>
       </div>
     </div><!-- \\ END OF BOX BODY -->
    <div class="post">
  <div class="row margin-bottom">
  <!-- /.col -->
  <div class="col-sm-6">
    <div class="row">
    </div>
    <!-- /.row -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.post -->
</div>

</div>
<!-- END ALL CATEGORY -->

   <!--MODAL ALL CATEGORY-->
  <div class="modal fade" id="ht">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a long established fact that a reader will be distracted
          by the readable content of a page when looking at its layout.
          It is a long established fact that a reader will be distracted
          by the readable content of a page when looking at its layout.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

            <!--MODAL HEALTH-->
          


            <!--MODAL ALL CATEGORY-->
  
  <!--HEALTH-->
    <%
// get all domains fro the database 
    rs=cn.getcon().prepareStatement("select DomainID,DomainName from Domain where 1" ).executeQuery();
    while (rs.next())
    {
%>     
<div class="tab-pane" id="<%=rs.getInt(1)%>">
<div class="box-body">
  <div class="col-md-10">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Icon</th>
           <th>Project Name  </th>
            <th>Developer Name  </th>
          <th>Documentation </th>
          <th>Description</th>
        </tr>
        <br>
      <div class="tab-pane">
          <h4 class="" style="font-weight:bold; font-family:sans-serif;"><%=rs.getString(2) %> </h4>
      </div>
        </thead>
        <tbody>
            <% 
            // get top 100 Projects on the system
            ResultSet Set= cn.getcon().prepareStatement(" select Project.ProjectID,Project.ProjectName,Project.ProjectIcon, User.UserName,Project.ProjectDocPDF from Project, User where User.UserID= Project.UserID and Project.DomainID="+rs.getInt(1)+" ORDER BY Project.ProjectID DESC LIMIT 100 ").executeQuery();
            while(Set.next())
            { 
            %>
        <tr>
            <td><img class="img-circle img-sm" src="../../Projects/<%=Set.getString(3) %>" alt="User Image"></td>
            <td align="center"><%=Set.getString(2) %></td>
              <td align="center"><%=Set.getString(4) %></td>
          <!--<td><button type="button"  class="btn btn-primary ">Like <span class="glyphicon glyphicon-thumbs-up"></span></button></td>-->
          <td align="center"><a href="../../Projects/<%=Set.getString(5) %>" class="ion-archive btn btn-primary"> Docs <span class=""></span></a></td>
          <td><a href="" data-toggle="modal" data-target="#d<%=Set.getInt(1)%>">Description</a> </td>
          
        </tr>
        <%}%>
         </tbody>
      </table><!--  ENDS OF HEALTH -->
    </div>
  </div><!-- \\ END OF BOX BODY -->
    <div>
      <div>
       <div>
          <div>
          </div>
        </div>
      </div>
      </div>
  </div>
</div>
  <%} cn.getcon().close(); %>

        <!--MODAL HEALTH-->
        <%
            rs=cn.getcon().prepareStatement("select ProjectID from Project where 1").executeQuery();
            while (rs.next())
            {
        %>
        <div class="modal fade" id="d<%=rs.getInt(1)%>">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
        <%
        ResultSet set=cn.getcon().prepareStatement("select ProjectDescription from Project where ProjectID="+rs.getInt(1)+"" ).executeQuery();
        if (set.next())
        {
        %>
      <div class="modal-body">
          <p><%=set.getString(1) %>.</p>
      </div>
      <%}%>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div><%} cn.getcon().close(); %>

            <!--MODAL HEALTH-->
  <div class="modal fade" id="jonh">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a long established fact that a reader will be distracted
        </p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

            <!--MODAL HEALTH-->
  <div class="modal fade" id="tronc">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a long established </p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

            <!--MODAL HEALTH-->
  <div class="modal fade" id="js">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>
          It is a long established fact that a reader will be distracted
          by the readable content of a page when looking at its layout.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>


      <!-- SPORT -->
      <div class="tab-pane" id="sport">

    <div class="box-body">
      <div class="col-md-10">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
            <tr>
              <th>Icon</th>
              <!--<th>Like</th>-->
              <th>Documentation </th>
              <th>Description</th>
            </tr>
            <br>
              <div class="tab-pane">
                    <h4 class="" style="font-weight:bold; font-family:sans-serif;"> SPORT </h4>
                  </div>
            </thead>
            <tbody>
            <tr>
              <td><img class="img-circle img-sm" src="../../dist/img/boxed-bg.jpg" alt="User Image"></td>
              <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
              <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
              <td><a href="" data-toggle="modal" data-target="#doc">Description</a> </td>
              
            </tr>
            <tr>
              <td><img class="img-circle img-sm" src="../../dist/img/default-50x50.gif" alt="User Image"></td>
              <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
              <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
              <td><a href="" data-toggle="modal" data-target="#docum">Description</a> </td>
            </tr>
            <tr>
              <td><img class="img-circle img-sm" src="../../dist/img/icons.png" alt="User Image"></td>
              <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
              <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
              <td><a href="" data-toggle="modal" data-target="#docu">Description</a> </td>
            </tr>
            </tbody>
          </table><!--  ENDS OF SPORT -->
        </div>
      </div><!-- \\ END OF BOX BODY -->
        <div class="post">
          <div class="row margin-bottom">
            <!-- /.col -->
            <div class="col-sm-6">
              <div class="row">
              </div>
              <!-- /.row -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
          </div>
        <!-- /.post -->
      </div>
      </div>  <!--END SPORT-->

            <!--MODAL SPORT-->
      <div class="modal fade" id="doc">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
          </div>
          <div class="modal-body">
            <p>The project was for the stadium location</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>

                <!--MODAL SPORT-->
      <div class="modal fade" id="docum">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
          </div>
          <div class="modal-body">
            <p>the project was builded for the personne who are looking for a school of football</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>

                    <!--MODAL SPORT-->
      <div class="modal fade" id="docu">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
          </div>
          <div class="modal-body">
            <p>the project was builded for team location</p>
          </div>    
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>

            
           <!--E-COMMERCE-->
    <div class="tab-pane" id="e-commerce">

  <div class="box-body">
    <div class="col-md-10">
      <div class="table-responsive">
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>Icon</th>
            <!--<th>Like</th>-->
            <th>Documentation </th>
            <th>Description</th>
          </tr>
          <br>
            <div class="tab-pane">
                    <h4 class="" style="font-weight:bold; font-family:sans-serif;"> E-COMMERCE </h4>
                  </div>
          </thead>
          <tbody>
          <tr>
            <td><img class="img-circle img-sm" src="../../dist/img/visa.png" alt="User Image"></td>
            <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
            <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
            <td><a href="" data-toggle="modal" data-target="#navig">Description</a> </td>
            
          </tr>
          <tr>
            <td><img class="img-circle img-sm" src="../../dist/img/paypal2.png" alt="User Image"></td>
            <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
            <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
            <td><a href="" data-toggle="modal" data-target="#naff">Description</a> </td>
          </tr>
          <tr>
            <td><img class="img-circle img-sm" src="../../dist/img/cirrus.png" alt="User Image"></td>
            <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
            <td align="center"><button type="button" class="ion-archive btn btn-primary"">Docs <span class=" "></span></button></td>
            <td><a href="" data-toggle="modal" data-target="#null">Description</a> </td>
          </tr>
          </tbody>
        </table><!--  ENDS OF E-COMMERCE -->
      </div>
    </div><!-- \\ END OF BOX BODY -->
      <div class="post">
        <div class="row margin-bottom">
          
          <!-- /.col -->
          <div class="col-sm-6">
            <div class="row">
            </div>
            <!-- /.row -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
        </div>
      <!-- /.post -->
    </div>

    </div>
    <!-- END E-COMMERCE -->

                      <!--MODAL E-COMMERCE-->
  <div class="modal fade" id="navig">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>This project will help you to manage your business easily and faster.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                      <!--MODAL E-COMMERCE-->
  <div class="modal fade" id="naff">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>
          The project facilitate the Newspapers and other traditional media adopt online,interactive models.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                      <!--MODAL E-COMMERCE-->
  <div class="modal fade" id="null">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a long established project that a reader will be distracted
          by the readable content of a page when looking at its layout.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

  <!--EDUCATION-->
<div class="tab-pane" id="education">

<div class="box-body">
  <div class="col-md-10">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Icon</th>
          <!--<th>Like</th>-->
          <th>Documentation </th>
          <th>Description</th>
        </tr>
        <br>
          <div class="tab-pane">
                    <h4 class="" style="font-weight:bold; font-family:sans-serif;"> EDUCATION </h4>
                  </div>
        </thead>
        <tbody>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/pic12.jpg" alt="User Image"></td>
         <!-- <td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#roll">Description</a> </td>
          
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/pic12.jpg" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#number">Description</a> </td>
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/pic12.jpg" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=""></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#num">Description</a> </td>
        </tr>
        </tbody>
      </table><!--  ENDS OF EDUCATION -->
    </div>
  </div><!-- \\ END OF BOX BODY -->
    <div class="post">
      <div class="row margin-bottom">
        <!-- /.col -->
        <div class="col-sm-6">
          <div class="row">
          </div>
          <!-- /.row -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </div>
  </div>
  </div>
  <!-- END EDUCATION -->

                        <!--MODAL EDUCATION-->
  <div class="modal fade" id="roll">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>the project show the content of a page when looking at its layout.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                        <!--MODAL EDUCATION-->
  <div class="modal fade" id="number">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>the project perform the task that a reader will be distracted
          by the readable content of a page when looking at its layout.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                        <!--MODAL EDUCATION-->
  <div class="modal fade" id="num">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a project that a reader will be distracted
          by the readable content of a page when looking at its layout.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

  <!--FASHION-->
  <div class="tab-pane" id="fashion">

  <div class="box-body">
  <div class="col-md-10">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Icon</th>
          <!--<th>Like</th>-->
          <th>Documentation</th>
          <th>Description</th>
        </tr>
        <br>
          <div class="tab-pane">
            <h4 class="" style="font-weight:bold; font-family:sans-serif;"> FASHION </h4>
                  </div>
        </thead>
        <tbody>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/index.jpg" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#bon">Description</a> </td>
          
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/index4.png" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs<span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#bn">Description</a> </td>
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/index2.png" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs<span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#bmw">Description</a> </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div><!-- \\ END OF BOX BODY -->
    <div class="post">
      <div class="row margin-bottom">
  <!-- /.col -->
  <div class="col-sm-6">
    <div class="row">
    </div>
    <!-- /.row -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.post -->
</div>

</div>
<!-- END FASHION -->

                        <!--MODAL FASHION-->
  <div class="modal fade" id="bon">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>Project of fashion design.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                       <!--MODAL FASHION-->
  <div class="modal fade" id="bn">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a project that a show the location of the art fashion.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                       <!--MODAL FASHION-->
  <div class="modal fade" id="bmw">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>the project describe the quality of a fashion.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!--END FASHION MODAL-->

  <!--AGRICULTURE-->
  <div class="tab-pane" id="agriculture">

  <div class="box-body">
  <div class="col-md-10">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Icon</th>
          <!--<th>Like</th>-->
          <th>Documentation</th>
          <th>Description</th>
        </tr>
        <br>
          <div class="tab-pane">
            <h4 class="" style="font-weight:bold; font-family:sans-serif;"> AGRICULTURE </h4>
                  </div>
        </thead>
        <tbody>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/images1.jpg" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#bonh">Description</a> </td>
          
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/images.jpg" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#bnh">Description</a> </td>
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/images2.jpg" alt="User Image"></td>
          <!--<td><button type="button"  class="btn btn-primary">Like <span class="glyphicon glyphicon-thumbs-up"></button></td>-->
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#bmwh">Description</a> </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div><!-- \\ END OF BOX BODY -->
    <div class="post">
      <div class="row margin-bottom">
  <!-- /.col -->
  <div class="col-sm-6">
    <div class="row">
    </div>
    <!-- /.row -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.post -->
</div>

</div>
<!-- END AGRICULTURE -->
                        <!--MODAL AGRICULTURE-->
  <div class="modal fade" id="bonh">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>Project of fashion design.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                       <!--MODAL AGRICULTURE-->
  <div class="modal fade" id="bnh">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a project that a show the location of the art fashion.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                       <!--MODAL AGRICULTURE-->
  <div class="modal fade" id="bmwh">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>the project describe the quality of a fashion.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!--END AGRICULTURE MODAL-->

         <!--I.T-->
  <div class="tab-pane" id="information">

  <div class="box-body">
  <div class="col-md-10">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Icon</th>
          <!--<th>Like</th>-->
          <th>Documentation </th>
          <th>Description</th>
        </tr>
        <br>
          <div class="tab-pane">
            <h4 class="" style="font-weight:bold; font-family:sans-serif;"> I.T </h4>
                  </div>
        </thead>
        <tbody>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/wwwww.jpg" alt="User Image"></td>
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=""></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#ht">Description</a> </td>
          
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/www.png" alt="User Image"></td>
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#th">Description</a> </td>
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/image.png" alt="User Image"></td>
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs<span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#thn">Description</a> </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div><!-- \\ END OF BOX BODY -->
    <div class="post">
      <div class="row margin-bottom">
  <!-- /.col -->
  <div class="col-sm-6">
    <div class="row">
    </div>
    <!-- /.row -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.post -->
</div>

</div>
<!-- END I.T -->

                        <!--MODAL I.T-->
  <div class="modal fade" id="ht">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>Project of I.T section.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                       <!--MODAL I.T-->
  <div class="modal fade" id="th">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a project that show the location of all Lab in the city .</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

                       <!--MODAL I.T-->
  <div class="modal fade" id="thn">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>the project describe the quality of an I.T project.</p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!--END I.T MODAL-->


      <!--OTHER CATEGORY-->
  <div class="tab-pane" id="category">

  <div class="box-body">
  <div class="col-md-10">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Icon</th>
          <th>Name</th>
          <th>Documentation </th>
          <th>Description</th>
        </tr>
        <br>
          <div class="tab-pane">
            <h4 class="" style="font-weight:bold; font-family:sans-serif;"> OTHER CATEGORY </h4>
                  </div>
        </thead>
        <tbody>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/wwwww.jpg" alt="User Image"></td>
          <td>REGULUS</td>
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=""></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#cate">Description</a> </td>
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/www.png" alt="User Image"></td>
          <td>MIS</td>
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs <span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#cat">Description</a> </td>
        </tr>
        <tr>
          <td><img class="img-circle img-sm" src="../../dist/img/image.png" alt="User Image"></td>
          <td>E-CLAIM</td>
          <td align="center"><button type="button" class="ion-archive btn btn-primary">Docs<span class=" "></span></button></td>
          <td><a href="" data-toggle="modal" data-target="#categ">Description</a> </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div><!-- \\ END OF BOX BODY -->
    <div class="post">
      <div class="row margin-bottom">
  <!-- /.col -->
  <div class="col-sm-6">
    <div class="row">
    </div>
    <!-- /.row -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.post -->
</div>

</div>
<!-- END OTHER CATEGORY -->

   <!--MODAL ALL CATEGORY-->
  <div class="modal fade" id="cate">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a long established fact that a reader will be distracted
          by the readable content of a page when looking at its layout.
        </p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

            <!--MODAL HEALTH-->
  <div class="modal fade" id="cat">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a long established fact that a reader will be distracted
        </p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

            <!--MODAL ALL CATEGORY-->
  <div class="modal fade" id="categ">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:darkblue ;"> View Description of the project </h4>
      </div>
      <div class="modal-body">
        <p>It is a long established </p>
      </div>    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>



</div>
      <!-- /.tab-content -->
</div>
    <!-- /.nav-tabs-custom -->
</div>
  <!-- /.col -->
</div>
<!-- /.row -->
    </section>
    <!-- /.content -->
  </div>

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

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
<!-- PACE -->
<script src="../../bower_components/PACE/pace.min.js"></script>
<!-- SlimScroll -->
<script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- page script -->
<script type="text/javascript">
  // To make Pace works on Ajax calls
  $(document).ajaxStart(function () {
    Pace.restart()
  })
  $('.ajax').click(function () {
    $.ajax({
      url: '#', success: function (result) {
        $('.ajax-content').html('<hr>Ajax Request Completed !')
      }
    })
  })
</script>
</body>
</html>