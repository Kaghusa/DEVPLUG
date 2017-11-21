<%@page import="Operation.dbconnect"%>
<%@page import="Operation.postproposition"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
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
    dbconnect cn= new dbconnect();
  String nam = "";
  String email = "";
  String passwd1 = " ";
  String passwd2 = "";
  String phone = "";
  String photo = "";
  String action = " ";
 
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
                            if(name.equals("profile"))
                            {
                            ImageFile=value;
                            }
                            else if(name.equals("fullname"))
                            {
                                nam=value;
                            }
                            else if (name.equals("email"))
                            {
                                    email=value;
                            }
                            else if (name.equals("passwd1"))
                            {
                                passwd1=value;
                            }
                            else if (name.equals("passwd2"))
                            {
                               passwd2=value; 
                            }
                            else if (name.equals("phone"))
                                {
                                   phone=value; 
                                }
                            
                            }
                            
                            else
                            {
                            try
                            {
                            itemName = item.getName();
                            File savedFile = new File( cn.uploadUrl()+"/profile/"+itemName);
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
                                if (passwd1.equals(passwd2))
                                {
                                     action = "INSERT";
                                      postproposition inse = new postproposition();
                                   inse.registration1(nam, Encrypt(passwd1),email,phone ,itemName, action);
                                   session.setAttribute("Email", email);
                                    response.sendRedirect("register2.jsp");
                                }
                                else out.println("passwords don't match ");
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
    

  
 
         
          


%>
<html>
<head> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>User|Registration</title>
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
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href=""><b>USER REGISTRATION</b></a>
  </div>

  <div class="register-box-body">
    <!--<p class="login-box-msg">Register</p>-->

    <form action="register.jsp" method="post" enctype="multipart/form-data"  >
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="fullname" placeholder="Full name">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="email" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="passwd1" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="passwd2" placeholder="Retype password">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="phone" placeholder="CellPhone     +250...">
        <span class=" form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
          <label> Upload Profile</label>  
          <input name="profile"  type="file">
          </div>

      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <!--<label>
              <input type="checkbox"> I agree to the <a href="#">terms</a>
            </label>-->
          </div>
        </div>
        <div class="col-xs-4">
          
       
        
     <div id="app"></div>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.7/react.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.7/react-dom.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
    <script type="text/babel">
        
        var HelloComponent = React.createClass({
                      
            render: function() {
                return (
               <button type="submit" name="next" class="btn btn-primary btn-block btn-flat"> Next</button>
                )
            }
        })
        
        ReactDOM.render(<HelloComponent />, document.querySelector('#app'))
    </script>
    
      </div>
         </div> 
    </form>
    <%
        //
    %>
    

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
</body>
</html>
