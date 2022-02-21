<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Connection conn;
	Statement statement;
	ResultSet resultSet;

	public void jspInit() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/HelloWorld", "ashutosh", "ashu12");
			statement = conn.createStatement();
			resultSet = statement.executeQuery("Select * from account;");
		} catch (SQLException e) {
			System.out.print("SQL exception");
		} catch (ClassNotFoundException ec) {
			System.out.print("Class not found");
		}
	}

	public void jsDestroy() throws SQLException {
		statement.close();
		conn.close();

	}%>

<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
</head>

<body>

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

	<div class="container">
	<h1 style="margin-top:30px;">Display Data</h1></br>
		<table>
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>email id</th>
				<th>Designation</th>
				<th>Age</th>
			</tr>
			<%
			while (resultSet.next()) {
			%>

			<tr>
				<td><%=resultSet.getInt(1)%></td>
				<td><%=resultSet.getString(2)%></td>
				<td><%=resultSet.getString(3)%></td>
				<td><%=resultSet.getInt(4)%></td>
				<td><%=resultSet.getString(5)%></td>
				<td><%=resultSet.getString(6)%></td>
			</tr>
			<%
			}
			%>

		</table>




	</div>

</body>
</html>

