<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/HelloWorld","ashutosh","ashu12");
        	statement = conn.prepareStatement("insert into account values (?,?,?,?,?,?);");
    	}catch(SQLException e){
    		System.out.print("SQL exception");
    	}catch(ClassNotFoundException ec){
    		System.out.print("Class not found");
    	}
    }
    
    public void jsDestroy() throws SQLException{
    	statement.close();
		conn.close();
    	
    }
    
    %>
    
    
    <%
    
    int id = Integer.parseInt(request.getParameter("id"));
    String last_name = request.getParameter("lastname");
    String first_name = request.getParameter("firstname");
    int sal = Integer.parseInt(request.getParameter("sal"));
    String designation = request.getParameter("designation");
    String age = request.getParameter("age");
    

    statement.setInt(1,id);
    statement.setString(2,last_name);
    statement.setString(3,first_name);
    statement.setInt(4,sal);
    statement.setString(5,designation);
    statement.setString(6,age);
    
    
    statement.executeUpdate();

    %>
    
    
    <html>
    	<head>
    		<link rel="stylesheet" href="css/style.css" />
    		<link rel="stylesheet" href="css/bootstrap.css"/>

    	</head>
    	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Employee DB</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="http://localhost:8081/EmployeeProject/Home.html">Home <span
						class="sr-only">(current)</span></a></li>
		</div>
		</li>
		</ul>
		</div>
	</nav>
    	<h1>Addedd Successfully!!!</h1>
    
    </html>
    
  