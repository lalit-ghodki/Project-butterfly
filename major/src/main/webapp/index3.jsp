<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dashboard</title>
<link rel="stylesheet" href="style3.css">

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
				<span id="logo1" class="font1" style="font-size: 17px">VACCINATION</span>
				<span id="logo2" class="font1" style="font-size: 17px">STATES</span>
			</h4>
			
			<%
					String db= request.getParameter("data_base");
					System.out.println(db+"4.1");
					request.getSession().setAttribute("data", db);
					%>
					
					<c:set var="a" value="<%=db%>"></c:set>
					<s:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/${a}" user="root" password="MySQL@123" var="ds"></s:setDataSource>
					<s:query dataSource="${ds}" var="rs">select * from clg_login;</s:query>
					<s:query dataSource="${ds}" var="rs1">select count(*) from std_entry where sex_type = "M";</s:query>	 
					<s:query dataSource="${ds}" var="rs2">select count(*) from std_entry where sex_type = "F";</s:query>	 
						 
					<c:forEach items="${rs.rows}" var="row">
						
			<div id="states-data">
				<img src="state-dots.png" alt="state-dot" style="width: 294px">
				
				<div id="bar-data">
					<img src="state-bars.png" alt="state-bars" style="width: 362px">
					<h5 class="total font1" style="right: 55%;" ><c:out value="${row.no_boys}"></c:out></h5>
					<h5 class="contain font1" style="right: 50%;"><c:out value="${rs1.rowsByIndex[0][0]}"></c:out></h5>
					<h5 class="contain font1" style="right: 44%;"><c:out value="${row.no_boys-rs1.rowsByIndex[0][0]}"></c:out></h5>
					<h5 class="total font1" style="right: 39%;"><c:out value="${row.no_girls}"></c:out></h5>
					<h5 class="contain font1" style="right: 33%;"><c:out value="${rs2.rowsByIndex[0][0]}"></c:out></h5>
					<h5 class="contain font1" style="right: 27%;"><c:out value="${row.no_girls-rs2.rowsByIndex[0][0]}"></c:out></h5>
					
					
					<div id="property" class="font1">
						<div class="txt">
							<h4 id="n-boys">No. of Boys</h4><h4>:</h4><c:out value="${row.no_boys}"></c:out>
						</div>
						<div class="txt">
							<h4 id="n-girls">No. of Girls</h4><h4>:</h4><c:out value="${row.no_girls}"></c:out>
						</div>
						<div class="txt">
							<h4 id="v-boys">Vaccinate Boys</h4><h4>:</h4><c:out value="${rs1.rowsByIndex[0][0]}"></c:out>
						</div>
						<div class="txt">
							<h4 id="v-gilrs">Vaccinate Girls</h4><h4>:</h4><c:out value="${rs2.rowsByIndex[0][0]}"></c:out>
						</div>
						<div class="txt">
							<h4 id="r-boys">Remaining Boys</h4><h4>:</h4><c:out value="${row.no_boys-rs1.rowsByIndex[0][0]}"></c:out>
						</div>
						<div class="txt">
							<h4 id="r-girls">Remaining Girls</h4><h4>:</h4><c:out value="${row.no_girls-rs2.rowsByIndex[0][0]}"></c:out>
						</div>
					</div>
					
					
					
				</div>
			</div>	</c:forEach>
		</div>
		
		
		<div id="dashboard">			
			<div id="icon-anime"><img src="dash-fill.png" alt="dashboard" style="position:relative; top:50%; left:50%; transform:translate(-50%,-50%);"></div>	
			<a href="index4.jsp?data_base=<%=db%>"><img src="enter.png" alt="enter" ></a>
			<a href="index5.jsp?data_base=<%=db%>"><img src="vaccine.png" alt="vaccine" ></a>
			<a href="index6.jsp?data_base=<%=db%>"><img src="user.png" alt="user" ></a>
		</div>
	</div>
</body>
</html>