/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.demo.test.SearchServlet"
	import="org.demo.dto.Details"%>
<%@	page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/icon.png" />
<title>Author Search Page</title>
<style type="text/css">

/*** Table Styles **/
.table-fill {
	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	margin-top: 5%;
	margin-left: 20%;
	height: 20px;
	max-width: 600px;
	padding: 5px;
	width: 100%;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	animation: float 5s infinite;
}

th {
	color: #D5DDE5;;
	background: #1b1e24;
	border-bottom: 1px solid #9ea7af;
	border-right: 1px solid #343a45;
	border-left: 1px solid #343a45;
	border-top: 1px solid #343a45;
	font-size: 18px;
	font-weight: 100;
	padding: 4px;
	text-align: left;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	vertical-align: middle;
}

th:first-child {
	border-top-left-radius: 3px;
}

th:last-child {
	border-top-right-radius: 3px;
	border-right: none;
}

tr {
	border-top: 1px solid #C1C3D1;
	border-bottom-: 1px solid #C1C3D1;
	color: #666B85;
	font-size: 14px;
	font-weight: normal;
	text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

tr:hover td {
	background: #4E5066;
	color: #FFFFFF;
	border-top: 1px solid #22262e;
}

tr:first-child {
	border-top: none;
}

tr:last-child {
	border-bottom: none;
}

tr:nth-child(odd) td {
	background: #EBEBEB;
}

tr:nth-child(odd):hover td {
	background: #4E5066;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

td {
	background: #FFFFFF;
	padding: 20px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 14px;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	border-right: 1px solid #C1C3D1;
	border-top: 1px solid #C1C3D1;
	border-left: 1px solid #C1C3D1;
	border-bottom: 1px solid #C1C3D1;
}

td:last-child {
	border-right: 0px;
}

th.text-left {
	text-align: left;
}

th.text-center {
	text-align: center;
}

th.text-right {
	text-align: right;
}

td.text-left {
	text-align: left;
}

td.text-center {
	text-align: center;
}

td.text-right {
	text-align: right;
}

body {
	background: url('images/test.jpg');
	display: block;
	background-size: cover;
	background-repeat: no-repeat;
}

#text {
	color: white;
}

#fields {
	color: white;
	margin-left: 4%;
	margin-top: 15%;
	font-size: 15px;
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

#table {
	display: inline-block;
	border-collapse: collapse;
	width: 30%;
	font-family: helvetica;
	align: center;
	margin-top: 30px;
	margin-left: 25%;
}

#header {
	text-align: left;
	padding: 8px;
	border-left: 1px solid white;
	border-right: 1px solid white;
	background-color: #FDD835;
	text-align: left;
	padding: 8px;
	border-bottom: 1px solid white;
	border-top: 1px solid white;
	color: white;
}

#attri {
	text-align: left;
	padding: 8px;
	border-left: 1px solid white;
	border-right: 1px solid white;
	color: white;
	background-color: Black;
	border-bottom: 1px solid white;
}

#header1 {
	background-color: white;
	color: black;
}

.table {
	align: center;
	width: 80%;
	margin-left: 10%;
}

#test {
	color: white;
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
	<form action="SearchServlet" onsubmit="return validate()"
		name="searchform" method="Post">
		<div class="container-fluid back">
			<div class="block">
				<label id="main">Enter a keyword</label> <input id="Key" type="text"
					name="key" class="thumbnail" />
				<center>
					<button id="submit" class="btn btn-success" onclick="Check()"
						type="submit">Search</button>
				</center>
				<div id="text"></div>
			</div>
		</div>


		<%
			if (request.getAttribute("Values") != null) {

				@SuppressWarnings("unchecked")
				List<Details> values = (List<Details>) request.getAttribute("Values");
		%>

		<table class="table-fill">
			<thead>
				<tr>
					<th class="text-left">Name</th>
					<th class="text-left">Institution</th>
					<th class="text-left">Department</th>
					<th class="text-left">Email</th>
					<th class="text-left">Address</th>
					<th class="text-left">Home_Page</th>
				</tr>
			</thead>
			<%
				for (Details element : values) {
			%>

			<tbody class="table-hover">
				<tr>
					<td class="text-left">
						<%
							out.println(element.getName());
						%>
					</td>
					<td class="text-left">
						<%
							out.println(element.getInstitution());
						%>
					</td>
					<td class="text-left">
						<%
							out.println(element.getDepartment());
						%>
					</td>
					<td class="text-left">
						<%
							out.println(element.getEmail());
						%>
					</td>
					<td class="text-left">
						<%
							out.println(element.getAddress());
						%>
					</td>
					<td class="text-left">
						<%
							out.println(element.getHome());
								}
							}
						%>
					</td>
				</tr>

			</tbody>
		</table>

	</form>
</body>
<%
	String message = (String) request.getAttribute("Msg");
%>
<script type="text/javascript">
var msg = "<%=message%>";
	if (msg == "null") {

	} else {
		alert(msg);
		message = "null";
	}
	function validate() {
		var key = document.forms["searchform"]["Key"].value;
		if (key == "") {
			alert("Key feild must be filled out!");
			return false;
		} else {
			return true;
		}
	}
</script>
</html>