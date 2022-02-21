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
        	ps = con.prepareStatement("insert into employee value(?,?,?,?,?);");
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
    String lastname = request.getParameter("lastname");
    String firstname = request.getParameter("firstname");
    String designation = request.getParameter("designation");
    int sal = Integer.parseInt(request.getParameter("sal"));
    
	out.print(id);

    ps.setInt(1,id);
    ps.setString(2,lastname);
    ps.setString(3,firstname);
    ps.setString(4,designation);
    ps.setInt(5,sal);
    
    ps.executeUpdate();
	%>
    <h1>Created Successfully!</h1>
   <a href="http://localhost:8085/Employee/HOME.html">HOME</a></br>
  