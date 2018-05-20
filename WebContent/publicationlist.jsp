/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.demo.test.PublicationServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/icon.png" />
<title>Publication Listing</title>
<style type="text/css">
body {
	background: url('images/test4.jpg');
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

.navbar {
	-webkit-box-shadow: 0 8px 6px -6px #999;
	-moz-box-shadow: 0 8px 6px -6px #999;
	box-shadow: 0 8px 6px -6px black;
	background-color: #FDD835;
	border-bottom: 1px solid #FDD835;
	margin-right: -8%;
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
	margin-right: -30px;
	color: black;
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
			<a class="navbar-brand" href="home.jsp"> <i onClick="home.jsp"
				class="material-icons">home</i>

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
	<form action="PublicationServlet" name="publicationform"
		onsubmit="return validate()" method="Post">
		<div class="container-fluid back">
			<div class="block">
				<label id="main">Title</label> <input type="text" id="Title" name="Title"
					class="thumbnail" />
			</div>
			<div class="block">
				<label>Author</label> <input type="text" id="Author" name="Author"
					class="thumbnail" />
			</div>

			<div class="block">
				<label>Year</label> <input type="text" id="Year" name="Year"
					class="thumbnail" />
			</div>
			<div class="block">
				<label>Newspaper</label> <input type="text" id="Newspaper"
					name="Newspaper" class="thumbnail" />
			</div>
			<div class="block">
				<label>Pages</label> <input type="text" id="Pages" name="Pages"
					class="thumbnail" />
			</div>
			<center>
				<button id="submit" class="btn btn-success" onclick="validate()"
					type="submit">Submit</button>
			</center>
		</div>
	</form>
</body>
<%
	String message = (String) request.getAttribute("alertMsg");
	String message1 = (String) request.getAttribute("SuccessMsg");
%>
<script type="text/javascript">
var msg = "<%=message%>";
var msg1 = "<%=message1%>";
	if (msg1 == "null") {

	} else {
		alert(msg1);
		message = "null";
	}
	if (msg == "null") {

	} else {
		alert(msg);
		message = "null";
	}
	function validate() {
		var title = document.forms["publicationform"]["Title"].value;
		var author = document.forms["publicationform"]["Author"].value;
		var year = document.forms["publicationform"]["Year"].value;
		var newspaper = document.forms["publicationform"]["Newspaper"].value;
		var pages = document.forms["publicationform"]["Pages"].value;


		var yearres = publicationreg.test(year);
		var pagesres = publicationreg.test(pages);

		if (title == "") {
			alert("Title must be filled out!");
			return false;
		}
		if (author == "") {
			alert("Author must be filled out!");
			return false;
		}
		if (year == "") {
			alert("Year must be filled out!");
			return false;
		}
		if (newspaper == "") {
			alert("Newspaper must be filled out!");
			return false;
		}
		if (pages == "") {
			alert(" Pages must be filled out!");
			return false;
		}
		if (yearres == false) {
			alert("Please Enter a valid year");
			return false;
		}
		if (pagesres == false) {
			alert("Please enter valid pages");
			return false;
		}
		return true;
	}
</script>
</html>