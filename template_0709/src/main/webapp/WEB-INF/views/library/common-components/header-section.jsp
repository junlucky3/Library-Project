<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start: Header Section -->
<header id="header-v1" class="navbar-wrapper inner-navbar-wrapper">
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-default">
				<div class="row">
					<div class="col-md-3">
						<div class="navbar-header">
							<div class="navbar-brand">
								<h1>
									<a href="index"> <img
										src="${pageContext.request.contextPath}/images/libraria-logo-v1.png" alt="LIBRARIA" />
									</a>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<!-- Header Topbar -->
						<div class="header-topbar hidden-sm hidden-xs">
							<div class="row">
								<div class="col-sm-6">
									<div class="topbar-info">
										<a href="tel:+61-3-8376-6284"><i class="fa fa-phone"></i>+82-8376-6284</a>
										<span>/</span> <a href="mailto:libraria@libraria.com"><i
											class="fa fa-envelope"></i>libraria@libraria.com</a>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="topbar-links">
									<c:if test="${role =='admin'}">
										<a href="../admin/index">Admin Page</a>
										<span>|</span>
									</c:if>
										<c:choose>
											<c:when test="${sessionScope.email != null }">
											<a href="logout"><i class="fa fa-lock"></i>${email }(Logout)</a>
											<c:if test="${role !='admin'}">
											<span>|</span>
												<a href="mypage"><i class="fa fa-lock"></i>mypage</a>
											</c:if>
											
											</c:when>
											<c:when test="${sessionScope.email == null }">
											<a href="login"><i class="fa fa-lock"></i>Login / Register</a>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
						<div class="navbar-collapse hidden-sm hidden-xs">
							<ul class="nav navbar-nav">
								<li class="dropdown active"><a data-toggle="dropdown"
									class="dropdown-toggle disabled" href="index">Home</a></li>
								<li class="dropdown"><a data-toggle="dropdown"
									class="dropdown-toggle disabled"
									href="BbooklistMain">Books</a></li>
								<li class="dropdown"><a data-toggle="dropdown"
									class="dropdown-toggle disabled"
									href="userNoticeMain">Notice</a></li>
								<li><a href="about">About us</a></li>
								<li><a href="contact">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 모바일 -->
				<div class="mobile-menu hidden-lg hidden-md">
					<a href="#mobile-menu"><i class="fa fa-navicon"></i></a>
					<div id="mobile-menu">
						<ul>
							<li class="mobile-title">
								<h4>Navigation</h4> <a href="#" class="close"></a>
							</li>
							<li><a href="index">Home</a></li>
							<li><a href="BbooklistMain">Books</a></li>
							<li><a href="userNoticeMain">Notice</a></li>
							<li><a href="about">About us</a></li>
							<li><a href="contact">Contact</a></li>
							<c:choose>
								<c:when test="${sessionScope.email != null }">
								<li><a href="logout">${email }(Logout)</a></li>
								<c:if test="${role !='admin'}">
									<li><a href="mypage">mypage</a></li>
								</c:if>
								</c:when>
								<c:when test="${sessionScope.email == null }">
								<li><a href="login">Login / Register</a></li>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
</header>
<!-- End: Header Section -->
