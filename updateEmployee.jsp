<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%!
    
   	Connection con;
    PreparedStatement ps;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost/Employee","root","Lavi@265");
        	ps= con.prepareStatement("update employee set sal=? where id=?;");
    	}catch(SQLException e){
    		e.printStackTrace();
    	}catch(ClassNotFoundException ec){
    		ec.printStackTrace();
    	}
    }
    
    public void jspDestroy(){
		try{
			ps.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
    
    %>
    <%
    
    int id = Integer.parseInt(request.getParameter("id"));
    int sal = Integer.parseInt(request.getParameter("sal"));
	out.print(id);
    ps.setInt(1, sal);
    ps.setInt(2,id);
    ps.executeUpdate();
    %>
<h1>Updated Successfully!</h1> 
<a href="http://localhost:8085/Employee/HOME.html">HOME</a></br>
    