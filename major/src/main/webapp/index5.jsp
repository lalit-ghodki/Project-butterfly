<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>vaccination</title>
<link rel="stylesheet" href="style5.css">
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
				<span id="logo1" class="font1" style="font-size: 17px">STUDENT'S</span>
				<span id="logo2" class="font1" style="font-size: 17px">ENTERY</span>
			</h4>
			<div id="show-field">
				
				<div id="dataset" style=" height:100%; border-radius: 12px">
					
					<!-- <table><thead class="font1">
						<tr>
							<th style="width: 25%; border-radius: 12px 0px 0px 12px">Name</th>
							<th>Baneficiary ID</th>
							<th>Age</th>
							<th>Sex</th>
							<th>Vaccine Type</th>
							<th>Disease</th>
							<th style="border-radius: 0px 12px 12px 0px">Doses</th>
						</tr>
					</thead></table> -->
					<table class="data" >
						<thead class="font1" >
						<tr>
							<th style="width: 25%; border-radius: 12px 0px 0px 12px">Name</th>
							<th>Baneficiary ID</th>
							<th>Age</th>
							<th>Sex</th>
							<th>Vaccine Type</th>
							<th>Disease</th>
							<th style="border-radius: 0px 12px 12px 0px">Doses</th>
						</tr>
						</thead>
						</table>
						<div style="overflow-y: auto; height: 88%; margin-top: 1px">
						<table style="border-collapse: separate; height:0px">
						<!-- <thead class="font1">
						<tr id=scroll>
							
							<th style="width: 25%; border-radius: 12px 0px 0px 12px">Name</th>
							<th>Baneficiary ID</th>
							<th>Age</th>
							<th>Sex</th>
							<th>Vaccine Type</th>
							<th>Disease</th>
							<th style="border-radius: 0px 12px 12px 0px">Doses</th>
						</tr>
						</thead> -->
						 	
						<%
							String db = request.getParameter("data_base");
							System.out.println(db);
							request.getSession().setAttribute("data", db);
						%>
						
						
						<c:set var="a" value="<%=db%>"></c:set>
						<s:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/${a}" user="root" password="MySQL@123" var="ds"></s:setDataSource>
						<s:query dataSource="${ds}" var="rs">select * from std_entry;</s:query>
						
						 <c:forEach items="${rs.rows}" var="row">
						 	
						 	<tr id="space" class="font2">
								<td style="margin-top: 20px; text-align: left; padding-left: 80px; width:27%"><c:out value="${row.std_name}"></c:out></td>
								<td style="width: 20%;"><c:out value="${row.bnf_id}"></c:out></td>
								<td style="width: 7%;"><c:out value="${row.std_age}"></c:out></td>
								<td style="width: 6%;"><c:out value="${row.sex_type}"></c:out></td>
								<td style=""><c:out value="${row.vcn_name}"></c:out></td>
								<td style=""><c:out value="${row.vcn_type}"></c:out></td>
								<td style="width: 6%;"><c:out value="${row.no_dose}"></c:out></td>
							</tr>
							
						 </c:forEach>
						 </table>
						 </div>
						
						
					
				</div>
			</div>
		</div>
		<div id="dashboard">			
			<a href="index3.jsp?data_base=<%=db%>"><img src="dash.png" alt="dashboard"></a>	
			<a href="index4.jsp?data_base=<%=db%>"><img src="enter.png" alt="enter" ></a>
			<div id="icon-anime"><img src="vaccine-fill.png" alt="vaccine" style="position:relative; top:50%; left:50%; transform:translate(-50%,-50%);"></div>
			<a href="index6.jsp?data_base=<%=db%>"><img src="user.png" alt="user" ></a>
		</div>
	</div>
</body>
</html>