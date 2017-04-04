<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="com.Controller.Util" %>

<%
String userid=request.getParameter("user"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("pwd"); 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/retaildb","root","password"); 
Util obj = new Util();
java.sql.Connection con = obj.db();
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users ");
if(rs.next()) 
{ 

 String str = rs.getString(3); 
 session.setAttribute("password", str);
} 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Retail Application Demo</title>
<script type="text/javascript">  
function login(thisform)  {
	var name = thisform.username.value;
	var pwd = thisform.password.value;
	var flag = false;
	var passwd = '<%= session.getAttribute("password") %>';
	//alert (passwd);
	if(name == "Demo")
	{
		if(pwd == passwd)
		{
			flag = true;
		}
	}

	if(!flag)
		alert ("Please enter valid username/password... Demo user: Demo/password=1");
	
	return flag;
   
}  
      </script> 
      
<style type="text/css">
.diralign
{
	width:400px;
	height:150px;
	border:2px solid blue;
	background-color:#AABBEA;
	text-align:center;
	right:200px;
	left:480px;
	top:80px;
	bottom:500px;
	position:relative;
}
.dirlogo
{
	width:100px;
	height:100px;

	text-align:center;
	right:10px;
	left:900px;
	top:200px;
	bottom:50px;
	position:relative;
}
.dirlogo1
{
	width:100px;
	height:300px;

	text-align:center;
	right:10px;
	left:60px;
	top:10px;
	bottom:1400px;
	position:relative;
}
</style>
</head>
<body bgcolor="#121212">


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/karthik"
     user="root"  password="password"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from users;
</sql:query>

<form name="main" action="search.jsp" method="POST" onsubmit="return login(this);">
<font face="book antiqua">

<div style="width:1400px;height:120px;border:2px solid blue;background-color:#459DEA;position:relative;">
<table><tr>
<td>
</td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<h1 align="center"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
ABC RETAIL STORE
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
</h1>
</td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<img src="acoe.png" style="width:200px;height:50px">
</td>
</tr></table>
</div>


<div class="diralign">
<br>
<table align="center">
<tr><td></td><td>
<label>New User!!! - </label><a href="index.jsp">Register</a></td></tr>

<tr><td>
<label>Username</label></td><td>
<input type="text" size="15" name="username"></input></td></tr>
<tr><td>
<label>Password</label></td><td>
<input type="password" size="15" name="password"></input></td></tr>
<tr><td></td><td>
<input type="submit" value="Login"></input></td></tr>
</table></div>


</font></form>




</body>
</html>
