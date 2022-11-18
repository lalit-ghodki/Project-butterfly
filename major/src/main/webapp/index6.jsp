<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
<link rel="stylesheet" href="style6.css">
</head>
<body>
	<div id="nav">
		<h2 id="logo">
			<span id="logo1" class="font1">Students</span>
			<span id="logo2" class="font1">Vaccination Record</span>
		</h2>
		<div style = "display: flex; align-items: center;">
			<h4 style="font-size: 16px ; font-weight: normal" class="font1" >Sagar Institute of Research & Technology - Excellence</h4>
			<div id="img" ><img style="width:40px; border-radius: 50% " alt="college" src="clg-logo.png"></div>
		</div>
	</div>
	<div id="content">
		<div id="container">
			<h4 style="text-align: center">
				<span id="logo1" class="font1 " style="font-size: 17px">COLLEGE</span>
				<span id="logo2" class="font1" style="font-size: 17px">PROFILE</span>
			</h4>
			
			<%
				String db = request.getParameter("data_base");
				System.out.println(db);
				request.getSession().setAttribute("data", db);
			%>
			<c:set var="a" value="<%=db%>"></c:set>
			<s:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/${a}" user="root" password="MySQL@123" var="ds"></s:setDataSource>
			<s:query dataSource="${ds}" var="rs">select * from clg_login;</s:query>
			<c:forEach items="${rs.rows}" var="row">
			
			<div id=clg-logo>
				<div class="img" ><img style="width:50px; border-radius: 50% " alt="college" src="clg-logo.png"></div>
				<h4 class="font1 txt"><c:out value="${row.clg_name}"></c:out><br><c:out value="${row.location}"></c:out></h4>
			</div>
			<div id=line></div>
			
			
			<div id=clg-info>
				<div style="display: flex">
					<h4 class="font1 txt weight table-form">Course Name</h4>
					<span class="font2 txt">: &nbsp;&nbsp;<c:out value="${row.course_name}"></c:out></span>
				</div>
				<div style="display: flex">
					<h4 class="font1 txt weight table-form">Branch Name</h4>
					<span class="font2 txt">: &nbsp;&nbsp;<c:out value="${row.branch_name}"></c:out></span>
				</div>
				<div style="display: flex">
					<h4 class="font1 txt weight table-form">Gmail ID</h4>
					<span class="font2 txt">: &nbsp;&nbsp;<c:out value="${row.gmail_id}"></c:out></span>
				</div>
				<div style="display: flex">
					<h4 class="font1 txt weight table-form">Total Students</h4>
					<span class="font2 txt">: &nbsp;&nbsp;<c:out value="${row.total_std}"></c:out></span>
				</div>
				<div style="display: flex">
					<h4 class="font1 txt weight table-form">No. of Girls</h4>
					<span class="font2 txt">: &nbsp;&nbsp;<c:out value="${row.no_girls}"></c:out></span>
				</div>
				<div style="display: flex">
					<h4 class="font1 txt weight table-form">No. of Boys</h4>
					<span class="font2 txt">: &nbsp;&nbsp;<c:out value="${row.no_boys}"></c:out></span>
				</div>
				
			</div>
			</c:forEach>
		</div>
		<div id="dashboard">			
			<a href="index3.jsp?data_base=<%=db%>"><img src="dash.png" alt="dashboard"></a>	
			<a href="index4.jsp?data_base=<%=db%>"><img src="enter.png" alt="enter" ></a>
			<a href="index5.jsp?data_base=<%=db%>"><img src="vaccine.png" alt="vaccine" ></a>
			<div id="icon-anime"><img src="user-fill.png" alt="user" style="position:relative; top:50%; left:50%; transform:translate(-50%,-50%);"></div>	
		</div>
	</div>
</body>
</html>