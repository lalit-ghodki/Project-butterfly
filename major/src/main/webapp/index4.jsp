<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>enterings</title>
<link rel="stylesheet" href="style4.css">

<!-- Compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

Compiled and minified JavaScript
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
 -->
 <style>
.green{
	color: #09bd80;
}

.red{
	color: #bd0909;
}
</style>

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
		<form action="EntryServlet" method="post" id="entryform">
		<div id="containers">
			<h4 style="text-align: center">
				<span id="logo1" class="font1" style="font-size: 17px">STUDENT'S</span>
				<span id="logo2" class="font1" style="font-size: 17px">ENTERY</span>
			</h4>
			<div id="entry-field">
				<div id="field-1" style="display: flex; justify-content: space-between">
					<div class="field">
						<div style="display: flex; align-items: center">
							<div class=icon style="background-color: #CCF1E5"><img src="name.png" alt="dashboard"></div>
							<h4 class="font1" style="color: #00000080; margin-left: 5%; font-size:15px; font-weight: 600 ">Student Name</h4>
						</div>
						<input class="input font2" type="text" placeholder="|" name="std_name">
					</div>
					<div class="field">
						<div style="display: flex; align-items: center">
							<div class=icon style="background-color: #FEEBEB"><img src="id.png" alt="dashboard"></div>
							<h4 class="font1" style="color: #00000080; margin-left: 5%; font-size:15px; font-weight: 600 ">Beneficiary ID</h4>
						</div>
						<input class="input font2" type="text" placeholder="|" name="bnf_id">
					</div>
					<div class="field">
						<div style="display: flex; align-items: center">
							<div class=icon style="background-color: #E1EDFE"><img src="age.png" alt="dashboard"></div>
							<h4 class="font1" style="color: #00000080; margin-left: 5%; font-size:15px; font-weight: 600 ">Student Age</h4>
						</div>
						<input class="input font2" type="text" placeholder="|" name="std_age">
					</div>
				</div>
				<div id="field-2" style="display: flex; justify-content: space-between">
					<div class="field">
						<div style="display: flex; align-items: center">
							<div class=icon style="background-color: #FEF2E1"><img src="syringe.png" alt="dashboard"></div>
							<h4 class="font1" style="color: #00000080; margin-left: 5%; font-size:15px; font-weight: 600 ">Vaccine Name</h4>
						</div>
						<input class="input font2" type="text" placeholder="|" name="vcn_name">
					</div>
					<div class="field">
						<div style="display: flex; align-items: center">
							<div class=icon style="background-color: #E2E3E9"><img src="type.png" alt="dashboard"></div>
							<h4 class="font1" style="color: #00000080; margin-left: 5%; font-size:15px; font-weight: 600 ">Vaccine Type</h4>
						</div>
						<input class="input font2" type="text" placeholder="|" name="vcn_type">
					</div>
					<div class="field">
						<div style="display: flex; align-items: center">
							<div class=icon style="background-color: #F5E1FE"><img src="dose.png" alt="dashboard"></div>
							<h4 class="font1" style="color: #00000080; margin-left: 5%; font-size:15px; font-weight: 600 ">Doses & Gender</h4>
						</div>
						<div style=" display: flex; justify-content: space-between; height: 45%;">
						<input style="width: 77%; height: 100%;" class="input font2" type="text" placeholder="|" name="no_dose">
						<select name="sex_type" style="border: none; background-color: #f3f3f3; border-radius: 5px;">
							<option value="M">M</option>
							<option value="F">F</option>
						</select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="loaders font2" style="font-size: 18px; display: flex;align-items: center;justify-content: space-between;width: 135px;">
				<div class="loader"></div>
				<h5>please wait...</h5>
			</div>
			<!-- <div class="wrapper" >
				<svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
        			<circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
        			<path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
    			</svg>
    			
			</div> -->
			
			<h5 id="msg" class="font2" style="font-weight: 600"></h5>
			
			<%
				String db= (String)request.getAttribute("data_base");
				if(db==null){
					System.out.println(db+" is null in 4.1 but"+request.getParameter("data_base"));
					db = request.getParameter("data_base");
					request.getSession().setAttribute("data", db);
				}else{
					System.out.println(db+"4.12");
					request.getSession().setAttribute("data", db);
				}
				
			%>
			
			<button type="submit" class="btn"><span id="logo1" style="font-weight: bold">Enter</span><span id="logo2" style="font-weight: bold"> Record</span></button>
	
		</div>
		</form>
		<div id="dashboard">			
			<a href="index3.jsp?data_base=<%=db%>"><img src="dash.png" alt="dashboard"></a>	
			<div id="icon-anime"><img src="enter-fill.png" alt="enter" style="position:relative; top:50%; left:50%; transform:translate(-50%,-50%);"></div>
			<a href="index5.jsp?data_base=<%=db%>"><img src="vaccine.png" alt="vaccine" ></a>
			<a href="index6.jsp?data_base=<%=db%>"><img src="user.png" alt="user" ></a>
		</div>
	</div>
	
	<script
		  src="https://code.jquery.com/jquery-3.6.0.min.js"
		  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		  crossorigin="anonymous">
    </script>
    
    <script>
      $(document).ready(function(){
    	  console.log("page is ready...")
    	  
    	  $("#entryform").on('submit',function(event){
    		  event.preventDefault();
    		  
    		  var f = $(this).serialize();
    		  console.log(f);
    		  
    		  
    		  $(".loaders").show();
    		  
    		  $.ajax({
    			  url:"EntryServlet",
    			  data:f,
    			  type:'post',
    			  success: function(data, textStatus, jqXHR){
    				  console.log(data);
    				  console.log("success");
    				  $(".loaders").hide();
    				  
    				  if(data.trim()==='done'){
    					  $("#msg").html("Data enter successfull !!!");
    					  $("#msg").addClass('green');
    				  }else{
    					  $("#msg").html("Something went wrong ???");
    					  $("#msg").addClass('red');
    				  }
    			  },
				  error: function(jqXHR, textStatus, errorThrown){
					  console.log(data);
    				  console.log("error");
    				  $(".loaders").hide();
    				  $("#msg").html("Something wennt wrong with error ???");
    				  $("#msg").addClass('red');
    			  }
    		  })
    	  })
      })
      </script>
</body>
</html>