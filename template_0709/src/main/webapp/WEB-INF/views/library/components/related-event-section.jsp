<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="related-event text-center">
		<a href="userNoticeMain"><h2 class="section-title">NOTICE</h2></a>
		<span class="underline center"></span>
		<p class="lead">There is a lot of new stuff going on! Don't miss out!</p>
		<div class="owl-carousel-event">
		<c:forEach var="bno" items="${ bnotice }">
			<div class="single-related-event">
				<figure>
					<a>
					<img src="${pageContext.request.contextPath}/images/news-event/related-event-01.jpg"
					alt="Related event"></a>
					<figcaption>
						<header>
							<ul class="news-event-info">
								<li><i class="fa fa-calendar"></i>${bno.uldate}</li>
							</ul>
							<h4>
								<a href="userNoticeDetail?nid=${bno.nid }">${bno.title}</a>
							</h4>
							<br>
						</header>
						<p>${bno.ncontents}</p>
					</figcaption>
				</figure>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<br><br>
