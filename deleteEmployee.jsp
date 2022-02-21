<%@page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    
   	Connection con;
    PreparedStatement ps;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost/Employee","root","Lavi@265");
        	ps = con.prepareStatement("delete from employee where id=?");
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
    ps.setInt(1,id);
    ps.executeUpdate();

    %>
    
    <h1>Deleted Successfully!</h1>
    <a href="http://localhost:8085/Employee/HOME.html">HOME</a></br>
 