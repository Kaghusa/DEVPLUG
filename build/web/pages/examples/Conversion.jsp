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
    int Receiver;
    String Cate="";
    java.util.Date dte = new java.util.Date ();
    java.sql.Timestamp  time=  new  java.sql.Timestamp( dte.getTime());
    if (session.getAttribute("Mname")==null )
        {
            response.sendRedirect("login.jsp");
        } 
   
    String username = session.getAttribute("Mname").toString(); 
    int id= Integer.parseInt(session.getAttribute("Mid").toString());
    String profile= session.getAttribute("Mprofile").toString();
    
    
    // metho to insert the mentor Msg
    if (request.getParameter("send1")!=null)
    {
   
        Cate=request.getParameter("comment");
        Receiver=Integer.parseInt(request.getParameter("rmn"))/500;
    
        String SQL="insert into MentorMMsg (MsgContent,Date,ReceiverID,SenderID) value ('"+Cate+"','"+time+"',"+Receiver+",346)";
        cn.connection();
        cn.Stmt.execute(SQL);
        response.sendRedirect("Conversion.jsp?cte=mte&rmn="+(Receiver*500)+"");
  
    }
    
    if (request.getParameter("send")!=null)
    {
        Cate=request.getParameter("comment");
        Receiver=Integer.parseInt(request.getParameter("rmn"))/500;
    
        String SQL="insert into TeamChat (MsgContent,Date,TeamID,UserID) value ('"+Cate+"','"+time+"',"+Receiver+",346)";
        cn.connection();
        cn.Stmt.execute(SQL);
         response.sendRedirect("Conversion.jsp?cte=prg&rmn="+(Receiver*500)+"");
    
     }
        
    
    
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>DevPlug|Discusion</title>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
         <!-- CHAT CCSS-->

	<style type="text/css"> 
		html,
		body,
		div,
		span {
		  height: 100%;
		  width: 100%;
		  overflow: hidden;
		  padding: 0;
		  margin: 0;
		  box-sizing: border-box;
		}

		body {
		  background: url("http://shurl.esy.es/y") no-repeat fixed center;
		  background-size: cover;
		}

		.fa-2x {
		  font-size: 1.5em;
		}

		.app {
		  position: relative;
		  overflow: hidden;
		  top: 19px;
		  height: calc(100% - 38px);
		  margin: auto;
		  padding: 0;
		  box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .06), 0 2px 5px 0 rgba(0, 0, 0, .2);
		}

		.app-one {
		  background-color: #f7f7f7;
		  height: 100%;
		  overflow: hidden;
		  margin: 0;
		  padding: 0;
		  box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .06), 0 2px 5px 0 rgba(0, 0, 0, .2);
		}

		.side {
		  padding: 0;
		  margin: 0;
		  height: 100%;
		}
		.side-one {
		  padding: 0;
		  margin: 0;
		  height: 100%;
		  width: 100%;
		  z-index: 1;
		  position: relative;
		  display: block;
		  top: 0;
		}

		.side-two {
		  padding: 0;
		  margin: 0;
		  height: 100%;
		  width: 100%;
		  z-index: 2;
		  position: relative;
		  top: -100%;
		  left: -100%;
		  -webkit-transition: left 0.3s ease;
		  transition: left 0.3s ease;

		}


		.heading {
		  padding: 10px 16px 10px 15px;
		  margin: 0;
		  height: 60px;
		  width: 100%;
		  background-color: #eee;
		  z-index: 1000;
		}

		.heading-avatar {
		  padding: 0;
		  cursor: pointer;

		}

		.heading-avatar-icon img {
		  border-radius: 50%;
		  height: 40px;
		  width: 40px;
		}

		.heading-name {
		  padding: 0 !important;
		  cursor: pointer;
		}

		.heading-name-meta {
		  font-weight: 700;
		  font-size: 100%;
		  padding: 5px;
		  padding-bottom: 0;
		  text-align: left;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		  color: #000;
		  display: block;
		}
		.heading-online {
		  display: none;
		  padding: 0 5px;
		  font-size: 12px;
		  color: #93918f;
		}
		.heading-compose {
		  padding: 0;
		}

		.heading-compose i {
		  text-align: center;
		  padding: 5px;
		  color: #93918f;
		  cursor: pointer;
		}

		.heading-dot {
		  padding: 0;
		  margin-left: 10px;
		}

		.heading-dot i {
		  text-align: right;
		  padding: 5px;
		  color: #93918f;
		  cursor: pointer;
		}

		.searchBox {
		  padding: 0 !important;
		  margin: 0 !important;
		  height: 60px;
		  width: 100%;
		}

		.searchBox-inner {
		  height: 100%;
		  width: 100%;
		  padding: 10px !important;
		  background-color: #fbfbfb;
		}


		/*#searchBox-inner input {
		  box-shadow: none;
		}*/

		.searchBox-inner input:focus {
		  outline: none;
		  border: none;
		  box-shadow: none;
		}

		.sideBar {
		  padding: 0 !important;
		  margin: 0 !important;
		  background-color: #fff;
		  overflow-y: auto;
		  border: 1px solid #f7f7f7;
		  height: calc(100% - 120px);
		}

		.sideBar-body {
		  position: relative;
		  padding: 10px !important;
		  border-bottom: 1px solid #f7f7f7;
		  height: 72px;
		  margin: 0 !important;
		  cursor: pointer;
		}

		.sideBar-body:hover {
		  background-color: #f2f2f2;
		}

		.sideBar-avatar {
		  text-align: center;
		  padding: 0 !important;
		}

		.avatar-icon img {
		  border-radius: 50%;
		  height: 49px;
		  width: 49px;
		}

		.sideBar-main {
		  padding: 0 !important;
		}

		.sideBar-main .row {
		  padding: 0 !important;
		  margin: 0 !important;
		}

		.sideBar-name {
		  padding: 10px !important;
		}

		.name-meta {
		  font-size: 100%;
		  padding: 1% !important;
		  text-align: left;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		  color: #000;
		}

		.sideBar-time {
		  padding: 10px !important;
		}

		.time-meta {
		  text-align: right;
		  font-size: 12px;
		  padding: 1% !important;
		  color: rgba(0, 0, 0, .4);
		  vertical-align: baseline;
		}

		/*New Message*/

		.newMessage {
		  padding: 0 !important;
		  margin: 0 !important;
		  height: 100%;
		  position: relative;
		  left: -100%;
		}
		.newMessage-heading {
		  padding: 10px 16px 10px 15px !important;
		  margin: 0 !important;
		  height: 100px;
		  width: 100%;
		  background-color: #00bfa5;
		  z-index: 1001;
		}

		.newMessage-main {
		  padding: 10px 16px 0 15px !important;
		  margin: 0 !important;
		  height: 60px;
		  margin-top: 30px !important;
		  width: 100%;
		  z-index: 1001;
		  color: #fff;
		}

		.newMessage-title {
		  font-size: 18px;
		  font-weight: 700;
		  padding: 10px 5px !important;
		}
		.newMessage-back {
		  text-align: center;
		  vertical-align: baseline;
		  padding: 12px 5px !important;
		  display: block;
		  cursor: pointer;
		}
		.newMessage-back i {
		  margin: auto !important;
		}

		.composeBox {
		  padding: 0 !important;
		  margin: 0 !important;
		  height: 60px;
		  width: 100%;
		}

		.composeBox-inner {
		  height: 100%;
		  width: 100%;
		  padding: 10px !important;
		  background-color: #fbfbfb;
		}

		.composeBox-inner input:focus {
		  outline: none;
		  border: none;
		  box-shadow: none;
		}

		.compose-sideBar {
		  padding: 0 !important;
		  margin: 0 !important;
		  background-color: #fff;
		  overflow-y: auto;
		  border: 1px solid #f7f7f7;
		  height: calc(100% - 160px);
		}

		/*Conversation*/

		.conversation {
		  padding: 0 !important;
		  margin: 0 !important;
		  height: 100%;
		  /*width: 100%;*/
		  border-left: 1px solid rgba(0, 0, 0, .08);
		  /*overflow-y: auto;*/
		}

		.message {
		  padding: 0 !important;
		  margin: 0 !important;
		  background: url("w.jpg") no-repeat fixed center;
		  background-size: cover;
		  overflow-y: auto;
		  border: 1px solid #f7f7f7;
		  height: calc(100% - 120px);
		}
		.message-previous {
		  margin : 0 !important;
		  padding: 0 !important;
		  height: auto;
		  width: 100%;
		}
		.previous {
		  font-size: 15px;
		  text-align: center;
		  padding: 10px !important;
		  cursor: pointer;
		}

		.previous a {
		  text-decoration: none;
		  font-weight: 700;
		}

		.message-body {
		  margin: 0 !important;
		  padding: 0 !important;
		  width: auto;
		  height: auto;
		}

		.message-main-receiver {
		  /*padding: 10px 20px;*/
		  max-width: 60%;
		}

		.message-main-sender {
		  padding: 3px 20px !important;
		  margin-left: 40% !important;
		  max-width: 60%;
		}

		.message-text {
		  margin: 0 !important;
		  padding: 5px !important;
		  word-wrap:break-word;
		  font-weight: 200;
		  font-size: 14px;
		  padding-bottom: 0 !important;
		}

		.message-time {
		  margin: 0 !important;
		  margin-left: 50px !important;
		  font-size: 12px;
		  text-align: right;
		  color: #9a9a9a;

		}

		.receiver {
		  width: auto !important;
		  padding: 4px 10px 7px !important;
		  border-radius: 10px 10px 10px 0;
		  background: #ffffff;
		  font-size: 12px;
		  text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
		  word-wrap: break-word;
		  display: inline-block;
		}

		.sender {
		  float: right;
		  width: auto !important;
		  background: #dcf8c6;
		  border-radius: 10px 10px 0 10px;
		  padding: 4px 10px 7px !important;
		  font-size: 12px;
		  text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
		  display: inline-block;
		  word-wrap: break-word;
		}


		/*Reply*/

		.reply {
		  height: 60px;
		  width: 100%;
		  background-color: #f5f1ee;
		  padding: 10px 5px 10px 5px !important;
		  margin: 0 !important;
		  z-index: 1000;
		}

		.reply-emojis {
		  padding: 5px !important;
		}

		.reply-emojis i {
		  text-align: center;
		  padding: 5px 5px 5px 5px !important;
		  color: #93918f;
		  cursor: pointer;
		}

		.reply-recording {
		  padding: 5px !important;
		}

		.reply-recording i {
		  text-align: center;
		  padding: 5px !important;
		  color: #93918f;
		  cursor: pointer;
		}

		.reply-send {
		  padding: 5px !important;
		}

		.reply-send i {
		  text-align: center;
		  padding: 5px !important;
		  color: #93918f;
		  cursor: pointer;
		}

		.reply-main {
		  padding: 2px 5px !important;
		}

		.reply-main textarea {
		  width: 100%;
		  resize: none;
		  overflow: hidden;
		  padding: 5px !important;
		  outline: none;
		  border: none;
		  text-indent: 5px;
		  box-shadow: none;
		  height: 100%;
		  font-size: 16px;
		}

		.reply-main textarea:focus {
		  outline: none;
		  border: none;
		  text-indent: 5px;
		  box-shadow: none;
		}

		@media screen and (max-width: 700px) {
		  .app {
		    top: 0;
		    height: 100%;
		  }
		  .heading {
		    height: 70px;
		    background-color: #009688;
		  }
		  .fa-2x {
		    font-size: 2.3em !important;
		  }
		  .heading-avatar {
		    padding: 0 !important;
		  }
		  .heading-avatar-icon img {
		    height: 50px;
		    width: 50px;
		  }
		  .heading-compose {
		    padding: 5px !important;
		  }
		  .heading-compose i {
		    color: #fff;
		    cursor: pointer;
		  }
		  .heading-dot {
		    padding: 5px !important;
		    margin-left: 10px !important;
		  }
		  .heading-dot i {
		    color: #fff;
		    cursor: pointer;
		  }
		  .sideBar {
		    height: calc(100% - 130px);
		  }
		  .sideBar-body {
		    height: 80px;
		  }
		  .sideBar-avatar {
		    text-align: left;
		    padding: 0 8px !important;
		  }
		  .avatar-icon img {
		    height: 55px;
		    width: 55px;
		  }
		  .sideBar-main {
		    padding: 0 !important;
		  }
		  .sideBar-main .row {
		    padding: 0 !important;
		    margin: 0 !important;
		  }
		  .sideBar-name {
		    padding: 10px 5px !important;
		  }
		  .name-meta {
		    font-size: 16px;
		    padding: 5% !important;
		  }
		  .sideBar-time {
		    padding: 10px !important;
		  }
		  .time-meta {
		    text-align: right;
		    font-size: 14px;
		    padding: 4% !important;
		    color: rgba(0, 0, 0, .4);
		    vertical-align: baseline;
		  }
		  /*Conversation*/
		  .conversation {
		    padding: 0 !important;
		    margin: 0 !important;
		    height: 100%;
		    /*width: 100%;*/
		    border-left: 1px solid rgba(0, 0, 0, .08);
		    /*overflow-y: auto;*/
		  }
		  .message {
		    height: calc(100% - 140px);
		  }
		  .reply {
		    height: 70px;
		  }
		  .reply-emojis {
		    padding: 5px 0 !important;
		  }
		  .reply-emojis i {
		    padding: 5px 2px !important;
		    font-size: 1.8em !important;
		  }
		  .reply-main {
		    padding: 2px 8px !important;
		  }
		  .reply-main textarea {
		    padding: 8px !important;
		    font-size: 18px;
		  }
		  .reply-recording {
		    padding: 5px 0 !important;
		  }
		  .reply-recording i {
		    padding: 5px 0 !important;
		    font-size: 1.8em !important;
		  }
		  .reply-send {
		    padding: 5px 0 !important;
		  }
		  .reply-send i {
		    padding: 5px 2px 5px 0 !important;
		    font-size: 1.8em !important;
		  }
		}

	</style>  <!-- END CSS CHATS -->
        
        <script type="text/javascript">
			  $(function(){
		    $(".heading-compose").click(function() {
		      $(".side-two").css({
			"left": "0"
		      });
		    });

		    $(".newMessage-back").click(function() {
		      $(".side-two").css({
			"left": "-100%"
		      });
		    });
		})
    
        </script>

<body class="hold-transition skin-blue sidebar-mini" data-spy="scroll" data-target="#scroll" data-offset="80">
<div class="wrapper">

  <header class="main-header">
  
    <nav class="navbar navbar-static-top">
      <span style="font-size: 28px;color:#fff;line-height: 50px;text-align: center;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;font-weight: 300;"> <span class=""> </span> <i class="ion-chatbubbles"></i> Devplug Discussions</span>
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
  
  
   
   <!-- CHAT CODES STARTS HERE-->
   <div data-spy="scroll" data-target="#div2" data-offset="0">
      <div class="container app">
  <div class="row app-one" id="div2" >
    <div class="col-sm-4 side">
      <div class="side-one">
        <div class="row heading">
          <div class="col-sm-3 col-xs-3 heading-avatar">
            <div class="heading-avatar-icon">
              <img src="../../profile/<%=profile%>">
              <a style="font-size:15px;"> <%=username%></a>
            </div>
              
	        
          </div>
          <div class="col-sm-1 col-xs-1  heading-dot  pull-right">
            <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
          </div>
          <div class="col-sm-2 col-xs-2 heading-compose  pull-right">
            <i class="fa fa-comments fa-2x  pull-right" aria-hidden="true"></i>
          </div>
        </div>

        <div class="row searchBox">
          <div class="col-sm-12 searchBox-inner">
            <div class="form-group has-feedback">
              <input id="searchText" type="text" class="form-control" name="searchText" placeholder="Search">
              <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
          </div>
        </div>

        <div class="row sideBar">
            <%
                rs=cn.getcon().prepareStatement("select MentorRequest.MentorID, User.UserName, User.Photo,MentorRequest.DateTime from MentorRequest, User where User.UserID=MentorRequest.MentorID and MentorRequest.UserID= "+id+"  and MentorRequest.Status = 1 ORDER BY MentorRequest.MentorID DESC").executeQuery();
            while (rs.next())
            {
            %>
          <div class="row sideBar-body">
            <div class="col-sm-3 col-xs-3 sideBar-avatar">
              <div class="avatar-icon">
                  <img src="../../profile/<%=rs.getString(3) %>">
              </div>
            </div>
              <a href="Conversion.jsp?cte=mte&rmn=<%=rs.getInt(1)*500%>">
            <div class="col-sm-9 col-xs-9 sideBar-main">
              <div class="row">
                <div class="col-sm-8 col-xs-8 sideBar-name">
                    <span class="name-meta"> <b>Mentor </b><%=rs.getString(2)  %>
                </span>
                </div>
                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                    <span class="time-meta pull-right"><%= rs.getTimestamp(4) %>
                </span>
                </div>
              </div>
            </div>
                  </a>
          </div>
          <%} cn.getcon().close(); %>
           <%
                rs=cn.getcon().prepareStatement("select Team.TeamID, Team.DomainName, Team.DateTime  from Team, TeamMembers where Team.TeamID= TeamMembers.TeamID and  TeamMembers.UserID="+id +"  ORDER BY Team.TeamID DESC ").executeQuery();
            while (rs.next())
            {
            %>
          <div class="row sideBar-body">
            <div class="col-sm-3 col-xs-3 sideBar-avatar">
              <div class="ion-person-stalker">
                
              </div>
            </div>
              <a href="Conversion.jsp?cte=prg&rmn=<%=rs.getInt(1)*500%>">
            <div class="col-sm-9 col-xs-9 sideBar-main">
              <div class="row">
                <div class="col-sm-8 col-xs-8 sideBar-name">
                    <span class="name-meta"> <b>Team </b><%=rs.getString(2)  %>
                </span>
                </div>
                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                    <span class="time-meta pull-right"><%= rs.getTimestamp(3) %>
                </span>
                </div>
              </div>
            </div>
                  </a>
          </div>
          <%} cn.getcon().close(); %>
   
        </div>
      </div>

      
    </div>

    <div class="col-sm-8 conversation">
        
        <%
          if (request.getParameter("cte")!=null && request.getParameter("cte").equals("mte"))
          {
              Receiver=Integer.parseInt(request.getParameter("rmn"))/500;
           
       %>
       <%
        ResultSet Rs=cn.getcon().prepareStatement("select UserName, Photo, UserID from User where UserID ="+Receiver+"   ").executeQuery();
       
        if (Rs.next())
        {
              
       %>
      <div class="row heading">
        <div class="col-sm-2 col-md-1 col-xs-3 heading-avatar">
          <div class="heading-avatar-icon">
            <img src="../../profile/<%=rs.getString(2)%>">
          </div>
        </div>
        <div class="col-sm-8 col-xs-7 heading-name">
            <a class="heading-name-meta"><%=Rs.getString(1)  %>
          </a> <i class="fa fa-circle teext-success"></i> <a>online</a>
        </div>
        <div class="col-sm-1 col-xs-1  heading-dot pull-right">
          <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
        </div>
      </div>
       <%
        }
       %>

      <div class="row message" id="conversation">
        <div class="row message-previous">
          <div class="col-sm-12 previous">
            <a onclick="previous(this)" id="ankitjain28" name="20">
            Show Previous Message!
            </a>
          </div>
        </div>
<%
 rs=cn.getcon().prepareStatement("select MsgID, SenderID, ReceiverID, MsgContent from MentorMMsg  where SenderID ="+id+" or  ReceiverID ="+id+"  and  SenderID = "+Receiver+" or  ReceiverID = "+Receiver+" ").executeQuery();
 while (rs.next())
 { 
     
 if (rs.getInt(2)==Integer.parseInt(request.getParameter("rmn"))/500 && rs.getInt(3)==id) 
 {        
%>
        <div class="row message-body">
          <div class="col-sm-12 message-main-receiver">
            <div class="receiver">
              <div class="message-text">
                  <%=rs.getString(4)%>
              </div>
              <span class="message-time pull-right">
              
              </span>
            </div>
          </div>
        </div>
        <%}   
  if (rs.getInt(2)==id && rs.getInt(3)==Integer.parseInt(request.getParameter("rmn"))/500 ) {
        %>

        <div class="row message-body">
          <div class="col-sm-12 message-main-sender">
            <div class="sender">
              <div class="message-text">
                 <%=rs.getString(4)  %>
              </div>
              <span class="message-time pull-right">
                  
              </span>
            </div>
          </div>
        </div>
        <%}} cn.getcon().close();%>
      </div>
        <form action="Conversion.jsprmn=<%=Receiver*500%>">
      <div style="margin-top:320px;">
      <div class="row reply" >
        <div class="col-sm-1 col-xs-1 reply-emojis">
          <!--<button class=" fa fa-smile-o fa-2x btn" aria-hidden="true"></button>-->
        </div>
        <div class="col-sm-9 col-xs-9 reply-main">
          <textarea name ="send1" name="comment" class="form-control" rows="1" id="comment"></textarea>
        </div>
       
        <div class="col-sm-1 col-xs-1 reply-send">
          <button  class=" btn fa fa-send fa-2x" aria-hidden="true"></button>
        </div>
      </div>
      </div>
        </form>
<%}  %>


<%
       if (request.getParameter("cte")!=null && request.getParameter("cte").equals("prg"))
          {
              Receiver=Integer.parseInt(request.getParameter("rmn"))/500;
           
       %>
       <%
        ResultSet Rs=cn.getcon().prepareStatement("select DomainName  from Team  where TeamID ="+Receiver+"   ").executeQuery();
       
        if (Rs.next())
        {
              
       %>
      <div class="row heading">
        <div class="col-sm-2 col-md-1 col-xs-3 heading-avatar">
          <div class="ion-person-stalker">
           
          </div>
        </div>
        <div class="col-sm-8 col-xs-7 heading-name">
            <a class="heading-name-meta"><%=Rs.getString(1)  %>
          </a> <i class="fa fa-circle teext-success"></i> <a>online</a>
        </div>
        <div class="col-sm-1 col-xs-1  heading-dot pull-right">
          <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
        </div>
      </div>
       <%
        }
       %>

      <div class="row message" id="conversation">
        <div class="row message-previous">
          <div class="col-sm-12 previous">
            <a onclick="previous(this)" id="ankitjain28" name="20">
            Show Previous Message!
            </a>
          </div>
        </div>
<%
 rs=cn.getcon().prepareStatement("select UserID, MsgContent from TeamChat where TeamID="+Receiver+"  ").executeQuery();
 while (rs.next())
 { 
     
 if (rs.getInt(1)!=id) 
 {        
%>
        <div class="row message-body">
          <div class="col-sm-12 message-main-receiver">
            <div class="receiver">
              <div class="message-text">
                  <%=rs.getString(2)%>
              </div>
              <span class="message-time pull-right">
              
              </span>
            </div>
          </div>
        </div>
        <%}   
  if (rs.getInt(1)==id ) {
        %>

        <div class="row message-body">
          <div class="col-sm-12 message-main-sender">
            <div class="sender">
              <div class="message-text">
                 <%=rs.getString(2)  %>
              </div>
              <span class="message-time pull-right">
                  
              </span>
            </div>
          </div>
        </div>
        <%}} cn.getcon().close();%>
      </div>
        <form action="Conversion.jsp?rmn=<%=Receiver*500%>" method="post">
      <div style="margin-top:320px;">
      <div class="row reply" >
        <div class="col-sm-1 col-xs-1 reply-emojis">
          <!--<button class=" fa fa-smile-o fa-2x btn" aria-hidden="true"></button>-->
        </div>
        <div class="col-sm-9 col-xs-9 reply-main">
          <textarea name="comment" class="form-control" rows="1" id="comment"></textarea>
        </div>
       
        <div class="col-sm-1 col-xs-1 reply-send">
            <button name="send"  class=" btn fa fa-send fa-2x" aria-hidden="true"></button>
        </div>
      </div>
      </div>
        </form>
<%}  %>
    </div>
   
  </div>
</div> <!--CHATS ENDS HERE-->
</div>



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
                                              