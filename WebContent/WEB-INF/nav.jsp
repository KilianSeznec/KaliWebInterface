<%@page import="webproject.commun.Language"%>
<%@page import="webproject.commun.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Shiva 0.1</title>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/nav.css" rel="stylesheet">
<!-- Adding CSS import to perform help tip -->
<link href="css/help_tip.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

</head>

<!-- http://bootsnipp.com/snippets/featured/responsive-navigation-menu -->

<div class="nav-side-menu">
	<a id="title_link" href="<c:url value="/"></c:url>">
		<div class="brand">
			<img src="img/kali_logo.png"> SHIVA
		</div>
	</a> <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
		data-target="#menu-content"></i>

	<div class="menu-list">
		<% 
			Language language = new Language(); //class must be instancied each time we want to use the language parser
			Constants langSelected = new Constants();
		%>

		<ul id="menu-content" class="menu-content collapse out">
			<a href="<c:url value="/"></c:url>">
				<li><i class="fa fa-dashboard fa-lg"></i><strong> <%= language.getLanguageValue("/site/nav/accueil") %></li>
			</a>

			<li role="separator" class="separator"></li>

			<a href="<c:url value="/nikto.html"></c:url>">
				<li><img src="img/nikto.png"><%= language.getLanguageValue("/site/nav/nikto") %>
			</li>
			</a>

			<a href="<c:url value="/zenmap.html"></c:url>">
				<li><i class="fa fa-eye fa-lg"></i><%= language.getLanguageValue("/site/nav/zenmap") %>
			</li>
			</a>

			<a href="<c:url value="/theharvester.html"></c:url>">
				<li><img src="img/harvester.png"><%= language.getLanguageValue("/site/nav/the-harvester") %>
			</li>
			</a>

			<a href="<c:url value="/tlssled.html"></c:url>">
				<li><i class="fa fa-lock fa-lg"></i><%= language.getLanguageValue("/site/nav/tls-sled") %>
			</li>
			</a>

			<a href="<c:url value="/hydra.html"></c:url>">
				<li><img src="img/hydra.png"><%= language.getLanguageValue("/site/nav/hydra") %>
			</li>
			</a>

			<a href="<c:url value="/dnsrecon.html"></c:url>">
				<li><img src="img/dnsrecon.png"><%= language.getLanguageValue("/site/nav/dns-recon") %>
			</li>
			</a>

			<a href="<c:url value="/dnsrecon.html"></c:url>">
				<li><i class="fa fa-terminal fa-lg"></i><%= language.getLanguageValue("/site/nav/terminal") %>
			</li>
			</a>
		</ul>
	</div>
</div>


<!-- 

<style>
.horizontal-nav {
	background-color: #23282e;
	color: #c3c3c3;
}

.language-box {
	float: right;
}

.dropdown-menu {
  min-width: 0px;
}
</style>

<script type="text/javascript">

 
</script>

<section>
	<div class="horizontal-nav col-md-12 col-lg-12">
		<div class="language-box">
			<button class="btn btn-default btn-xs dropdown-toggle" type="button"
				data-toggle="dropdown">
				<%= langSelected.getLang() %><span class="caret"></span>
			</button>
			<ul class="dropdown-menu dropdown-menu-right">
				<li><a href="#">FR</a></li>
				<li><a href="#">EN</a></li>
			</ul>
		</div>
	</div>
</section>

 -->