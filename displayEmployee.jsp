<%@page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%!
    
   	Connection con;
    Statement ps;
    ResultSet resultSet;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost/Employee","root","Lavi@265");
        	ps = con.createStatement();
        	resultSet = ps.executeQuery("Select * from employee;");
    	}catch(SQLException e){
    		e.printStackTrace();
    	}catch(ClassNotFoundException ec){
    		ec.printStackTrace();
    	}
    }
    
    public void jsDestroy() throws SQLException{
    	ps.close();
		con.close();
    	
    }
    
    %>
    
 <table>
 	<tr>
 		<th> ID </th>
 		<th> FirstName</th>
 		<th> LastName </th>
 		<th> Designation</th>
  		<th> Salary </th>
 	</tr>
 	 		<% while(resultSet.next()){ %>
 	
 		<tr> 
 			<td><%=resultSet.getInt(1) %></td> 
 			<td><%=resultSet.getString(2) %></td> 
 			<td><%=resultSet.getString(3) %></td> 
 			<td><%=resultSet.getString(4) %></td> 
 			<td><%=resultSet.getInt(5) %></td> 
 		</tr>
 		 	 		<% } %>
 </table>
 <a href="http://localhost:8085/Employee/HOME.html">HOME</a></br>
