/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Operation;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author boniface
 */
@WebServlet(name = "FileUpload", urlPatterns = {"/FileUpload"})
@MultipartConfig(fileSizeThreshold=1024*1024*2,
maxFileSize=1024*1024*5)
public class FileUpload extends HttpServlet {
	private static final String SAVE_DIR="ressources";
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		 String savePath = "/home/boniface/NetBeansProjects/Devplug/web" + File.separator + SAVE_DIR;
         File fileSaveDir=new File(savePath);
         if(!fileSaveDir.exists()){
             fileSaveDir.mkdir();
         }
         java.util.Date dt= new java.util.Date();
   java.sql.Timestamp time= new java.sql.Timestamp(dt.getTime());
	    String ResourceDescription = request.getParameter("ResourceDescription");
            Part file = request.getPart("ResourcePDF");
	    String ResourceRef1 = request.getParameter("ResourceRef1");
	    String ResourceRef2 = request.getParameter("ResourceRef2");
	    String ResourceRef3 = request.getParameter("ResourceRef3");
	    String ResourceRef4= request.getParameter("ResourceRef4");
            String ResourceRef5= request.getParameter("ResourceRef5");
            int ProgramID=Integer.parseInt(request.getParameter("ProgramID"));
            
	   
	    
	    String fileName=extractfilename(file);
	    file.write(savePath + File.separator + fileName);
	    String filePath= savePath + File.separator + fileName ;
	    
	    
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DevPlug","root",""); 
		    PreparedStatement ps= con.prepareStatement("insert into Resources(ResourceDescription,ResourcePDF, ResourceRef1,ResourceRef2,ResourceRef3,ResourceRef4,ResourceRef5,Datetime,ProgramID,Status) values (?,?,?,?,?,?,?,?,?,?)");
		    ps.setString(1,ResourceDescription);
                    
		    ps.setString(2,filePath);
		    ps.setString(3,ResourceRef1);
		    ps.setString(4,ResourceRef2);
		    ps.setString(5,ResourceRef3);
		    ps.setString(6,ResourceRef4);
		    ps.setString(7,ResourceRef5);
                    ps.setTimestamp(8,time);
                    ps.setInt(9, ProgramID);
                    ps.setString(10, "New");
		    
		    int i=ps.executeUpdate();
		    if(i>0)
		    {
		    	out.print("<h1>file uploaded successfully</h1>");
		    }
		    con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}  
		}
 
	 private String extractfilename(Part file) {
        String cd = file.getHeader("content-disposition");
        String[] items = cd.split(";");
        for (String string : items) {
            if (string.trim().startsWith("filename")) {
                return string.substring(string.indexOf("=") + 2, string.length()-1);
            }
        }
        return "";
    }
		
	}

