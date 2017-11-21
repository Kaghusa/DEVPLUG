<%@page import="com.restfb.Parameter"%>
<%@page import="Operation.postproposition"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Operation.dbconnect"%>
<%@page import="com.restfb.DefaultFacebookClient"%>
<%@page import="com.restfb.FacebookClient"%>
<%@page import="com.restfb.types.User"%>
<%@page import="javax.swing.JOptionPane"%>



<!DOCTYPE html>
<%!
    
        public String Encrypt(String input)
                {
                    String Md5=null;
                    if (null==input) return null;
                    try
                        {
                            MessageDigest digest = MessageDigest.getInstance("MD5");
                            digest.update(input.getBytes(),0,input.length());
                            Md5=new BigInteger (1, digest.digest()).toString(64);
                            
                        }
                    catch (NoSuchAlgorithmException e)
                        {
                            e.getLocalizedMessage();
                        }
                    return Md5;
                }
%>
<%
    String Username ="";
    String Passwd="";
    String Names="";
    String Photo="";
    int Category;
    postproposition fcbkdata=new postproposition();
   
    dbconnect cn= new dbconnect ();
    cn.GetDrive();
    ResultSet st=null;
    if (request.getParameter("login")!=null)
        {
            Username=request.getParameter("email");
            Passwd=request.getParameter("pwd");
            st=cn.getcon().prepareStatement("select  UserID from User where Email='"+Username+"'").executeQuery();
              if (st.next())
                {
                    
                    ResultSet rs= cn.getcon().prepareStatement("select User.UserName,User.Photo,User.UserCategoryID from User where Passwd='"+Encrypt(Passwd)+"' and  UserID="+st.getInt(1)+" ").executeQuery();
                    if (rs.next())
                        {
                            Names=rs.getString(1);
                            Photo= rs.getString(2);
                            Category=rs.getInt(3);
                            int ind=st.getInt(1);
                            if (Category==1)
                                {
                                      session.setAttribute("Mname", Names);
                                    session.setAttribute("Mprofile", Photo);
                                    session.setAttribute("Mid",ind );
                                  
                                    response.sendRedirect("developer.jsp");
                                }
                            else if (Category==2)
                                {
                                    session.setAttribute("Mname", Names);
                                    session.setAttribute("Mprofile", Photo);
                                    session.setAttribute("Mid",ind );
                                    response.sendRedirect("mentor.jsp");
                                }
                              else if (Category==3)
                                {
                                     session.setAttribute("cname", Names);
                                    session.setAttribute("cprofile", Photo);
                                    session.setAttribute("cid",ind );
                                     response.sendRedirect("Admin.jsp");
                                }
                        }
                }
                cn.getcon().close();
                
        }
    
%>
   <!-- FACEBOOK LOGIN CODE -->
 <%
        String UserName = "";         
        String DOB = "";
        String Email="";
        String City = "";
        String Sex = "" ;
        String Action ="";
        String Picture = "";
        String email;
        
        
        
        
         if(request.getParameter("popo")!=null && request.getParameter("popo").equals("5qe"))
         {
             try
             {
        
   String accessToken = "EAAEmlOYikmgBAEby7i4NsHrUaz97W3TZAB2F6AZAjIjspW59fzFUWE1XVPF1pZCVUxxA8ZBqQ3PE27FhFf4Th4VqqTLyFzzFgic1O5SItDZAF8UCkZCDH9Ou1Bpbl1PWyIs02YMW12Vp4zLbABYkYBZAoudU0axhLWJr7ywDm3KZCQZDZD";
    FacebookClient client = new DefaultFacebookClient(accessToken);
    User me = client.fetchObject("me",User.class,Parameter.with("fields", "name,hometown,birthday,picture,email,gender"));
    
    UserName = me.getName();
    DOB =me.getBirthday();
    //Email = me.getName().toString();
    City = me.getHometown().getName();
    Sex = me.getGender();
    Picture=me.getPicture().getUrl();
    //email = me.getEmail();
    
    
    //Picture= me.getPicture().toString();
   
       ResultSet  set = cn.getcon().prepareStatement("select User.UserID, User.Photo,User.UserCategoryID from User where UserName= '"+UserName+"'").executeQuery();
    if (set.next())
        {
            session.setAttribute("cname", UserName);
            session.setAttribute("cprofile", set.getString(2));
            session.setAttribute("cid", set.getInt(1));
            if (set.getInt(3)==1 )
                {
                   response.sendRedirect("developer.jsp");
                }
            else if (set.getInt(3)==2 )
                {
                    response.sendRedirect("mentor.jsp");
                }
            else if (set.getInt(3)==3 ) response.sendRedirect("Admin.jsp");
        }
    else 
        {
            Action = "INSERT";
             session.setAttribute("Name",UserName); //Creating a session
             
            fcbkdata.fbdata(UserName, DOB, Email, Picture, City, Sex, Action);
            session.setAttribute("cname", UserName);
             session.setAttribute("cprofile", Picture);
             st=cn.getcon().prepareStatement("select  UserID from User where UserName ='"+UserName+"'").executeQuery();
             if (st.next())
                {
                    session.setAttribute("cid", set.getInt(1));
                }
             response.sendRedirect("fcbkuser.jsp"); 
        }
    
     
         }
              catch(Exception e)
              {
                  out.print(e.getMessage());
              }
              {
                  
              }
         }
        

  %>
<html>
   <head>
		  <meta charset="utf-8">
		  <meta http-equiv="X-UA-Compatible" content="IE=edge">
		  <title>Devplug|Login</title>
		  <!-- Tell the browser to be responsive to screen width -->
		  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		  <!-- Bootstrap 3.3.6 -->
		  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		  <!-- Font Awesome -->
		  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
		  <!-- Ionicons -->
		  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> 

		  <!-- Theme style -->
		  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
		  <!-- iCheck -->
		  <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">

     </head>
     
<body class="hold-transition login-page">
<!-- FACEBOOK LOGIN -->
 <script>
        // initialize and setup facebook js sdk
        window.fbAsyncInit = function() {
            FB.init({
              appId      : '323895934751336',
              xfbml      : true,
              version    : 'v2.5'
            });
            FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
                        document.getElementById('status').innerHTML = 'We are connected.';
                        document.getElementById('login').style.visibility = 'hidden';
                } else if (response.status === 'not_authorized') {
                        document.getElementById('status').innerHTML = 'We are not logged in.'
                } else {
                        document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
                }
            });
        };
        (function(d, s, id){
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        // login with facebook with extra permissions
        function login() {
                FB.login(function(response) {
                        if (response.status === 'connected') {
                        document.getElementById('status').innerHTML = 'We are connected.';
                        document.getElementById('login').style.visibility = 'hidden';
                } else if (response.status === 'not_authorized') {
                        document.getElementById('status').innerHTML = 'We are not logged in.'
                } else {
                        document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
                }
                }, {scope: 'email'});
        }

        // getting basic user info
        function getInfo() {
                FB.api('/me', 'GET', {fields: 'first_name,last_name,name,id'}, function(response) {
                        document.getElementById('status').innerHTML = response.id;
                });
        }
	</script>

<div>
</div>



<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>DevPlug LOGIN</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

  <div id="login">  
    <form action="login.jsp" method="post">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="email" placeholder="Email">
        <span class="ion-ios-email form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="password" class="form-control" name="pwd" placeholder="Password">
        <span class="ion-key form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">          
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
            <button type="submit" name="login" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  </div>
       <p> -OR-  </p>
    <div>
   
      </div>
       
       <div>     
                  
             <a href="login.jsp?popo=5qe" class="btn btn-block btn-social btn-facebook btn-flat" onclick="login()" id="login" style="margin-bottom:10px;" ><i class="fa fa-facebook"></i> Sign in using
        Facebook </a>  
                </div>
    <a href="register.jsp" class="btn btn-primary btn-block " onclick="#login" scope="public_profile,email" onlogin="checkLoginState();" > REGISTER AS A NEW MEMBER </a> 
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

 

<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
     
     <!--LIBRARIES-->

 <script type="text/javascript"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">  </script>
</body>
</html>

