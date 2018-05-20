/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Home Page</title>
<style>
body {
	background-color: white;
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
	background-color: #FFEE58;
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
#hello
{
color:black;
margin-top: 10%;
font-size: 100px;
}
.material-icons {
	display: inline-flex;
	vertical-align: top;
	margin-right: -30px;
	color: black;
}
.desc
{
color: #2E4053  ;
font-size:20px;
}
.material-icons:hover {
	color: white;
}
.image
{
 width:70%;
 margin-left:10%;
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
	<div id="hello" class="container-fluid">
	<center><b>Hello.</b></center>	
	</div>
	<div><img class="image" src="images/home1.jpg"></div>
	<div>
	<center><i class="desc">As a Publication-Listing Service,</i></center>
	<center><i class="desc">We store the history of Publications and books to help you can look up to them whenever you want.</i></center>
	</div>
	<div class="container-fluid">
	<b>   </b>
	</div>
</body>
</html>