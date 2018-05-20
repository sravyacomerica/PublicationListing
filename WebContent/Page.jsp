/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.demo.test.SimpleServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="shortcut icon" href="images/icon.png" />
<title>Author Listing</title>
<style type="text/css">
body {
	background: url('images/test7.jpg');
	display: block;
	background-size: cover;
	background-repeat: no-repeat;
}

#text {
	color: white;
}

.thumbnail:focus {
	outline: none;
	border-color: #FDD835;
	box-shadow: 0 0 10px #9ecaed;
}

.thumbnail {
	margin-left: 45%;
	border: 2px solid #dadada;
}

.navbar-default .navbar-nav>li>a:hover, .navbar-default .navbar-nav>li>a:focus
	{
	text-color: white;
}

.navbar {
	-webkit-box-shadow: 0 8px 6px -6px #999;
	-moz-box-shadow: 0 8px 6px -6px #999;
	box-shadow: 0 8px 6px -6px black;
	background-color: #FDD835;
	margin-right: -8%;
	border-bottom: 1px solid #FDD835;
}

#ncolor {
	color: black;
}

.thumbnail {
	margin-left: 45%;
}
#ncolor:hover {
	color: white;
}

#top {
	color: white;
	margin-top: 5%;
}

label {
	color: white;
	text-align: left;
	margin-left: 45%;
}

#main {
	margin-top: 10%;
}

#test {
	margin-right: 80%;
}

.material-icons {
	display: inline-flex;
	vertical-align: top;
	color: black;
	margin-right: -30px;
}

.material-icons:hover {
	color: white;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="home.jsp"> <i onClick="home.jsp" class="material-icons">home</i>

			</a>
		</div>
		<div class="navbar-collapse collapse" id="navbar"
			aria-expanded="false">
			<ul class="nav navbar-nav navbar-right">
				<a class="navbar-brand" href="#"><i id="home"
					class="material-icons">person</i></a>
				<li id="home"><a id="ncolor" href="Page.jsp"><b>Author
							Listing</b></a></li>
				<a class="navbar-brand" href="#"><i class="material-icons">library_books</i></a>
				<li><a id="ncolor" href="publicationlist.jsp"><b>Publication
							Listing</b></a></li>
				<a class="navbar-brand" href="#"><i id="home"
					class="material-icons">search</i></a>
				<li><a id="ncolor" href="search.jsp"><b>Author Search</b></a></li>
				<a class="navbar-brand" href="#"><i id="home"
					class="material-icons">search</i></a>
				<li><a id="ncolor" href="publicationsearch.jsp"><b>Publication
							Search</b></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<form action="SimpleServlet" name="pageform"
		onsubmit="return validation()" method="Post">
		<div class="container-fluid back">
			<div class="block">
				<label id="main">Author's Name</label> <input type="text" id="Name"
					name="Name" class="thumbnail" />
			</div>
			<div class="block">
				<label>Institution</label> <input type="text" name="Institution"
					id="Institution" class="thumbnail" />
			</div>
            <div class="block">
				<label>Department</label>
			<select name="Department" id="Department" class="thumbnail"class="selectpicker form-control" data-live-search="true" title="Please select a lunch ...">
                        <option> </option>
                        <option>Computer Science</option>
                        <option>Electrical Engineering</option>
                        <option>Industrial Engineering</option>
                        <option>Data Science</option>
                        <option>Mechanical</option>
                    </select>
              </div>
			<div class="block">
				<label>Email</label> <input type="text" name="Email" id="Email"
					class="thumbnail" />
			</div>
			<div class="block">
				<label>Address</label> <input type="text" id="Address"
					name="Address" class="thumbnail" />
			</div>
			<div class="block">
				<label>Home Page</label> <input type="text" id="Home" name="Home"
					class="thumbnail" />
			</div>
			<center>
				<button id="submit" class="btn btn-success" onclick="validation()"
					type="submit">Submit</button>
			</center>
		</div>
	</form>
</body>

<%
	String message = (String) request.getAttribute("alertMsg");
	String message1 = (String) request.getAttribute("SuccessMsg1");
%>
<script type="text/javascript">
    var msg = "<%=message%>";
    var msg1 = "<%=message1%>";
	if (msg == "null") {

	} else {
		alert(msg);
		message == "null";
	}
	if (msg1 == "null") {

	} else {
		alert(msg1);
		message = "null";
	}
	function validation() {
		var name = document.forms["pageform"]["Name"].value;
		var institution = document.forms["pageform"]["Institution"].value;
		var department = document.forms["pageform"]["Department"].value;
		var address = document.forms["pageform"]["Address"].value;
		var email = document.forms["pageform"]["Email"].value;
		var home = document.forms["pageform"]["Home"].value;

		var emailreg = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
		var emailres = emailreg.test(email);
		var homereg  = /^(http(s?):\/\/)?(www\.)+[a-zA-Z0-9\.\-\_]+(\.[a-zA-Z]{2,3})+(\/[a-zA-Z0-9\_\-\s\.\/\?\%\#\&\=]*)?$/;
        var homeres  = homereg.test(home);
		
		if (name == "") {
			alert("Author's Name must be filled out");
			return false;
		}
		if (institution == "") {
			alert("Institution must be filled out");
			return false;
		}
		if (department == "") {
			alert("Department must be filled out");
			return false;
		}
		if (address == "") {
			alert("Address must be filled out");
			return false;

			if (email == "") {
				alert("Email must be filled out");
				return false;
			}
		}

		if (home == "") {
			alert("Home Page must be filled out");
			return false;
		}
        
		if(homeres == false)
			{
			 alert("Enter a valid Home Page");
			 return false;
			}
		
		if (emailres == false) {
			alert("Please enter a valid Email!");
			return false;
		}
	}
</script>
</html>