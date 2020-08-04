<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br><br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<section class="category-filter new-release">
							<div class="container">
								<div class="row">
									<div class="col-md-6 col-md-offset-3 text-center">
										<h2 class="section-title">Check Out The Recommended</h2>
										<span class="underline center"></span>
										<p class="lead">Check out our recommended books! Many users already read them!</p>
									</div>
								</div>
							</div>
							<c:forEach var="itm" items="${bbooklist }">
							<div id="category-filter">
								<ul class="category-list" id="newreleaseitems">
									<li class="category-item">
										<figure>
											<img src="${itm.img }" alt="Book Image" style="width:436px; height:237px;"/>
											<figcaption class="bg-orange">
												<div class="info-block">
													<span class="author"><strong><a href="bbookDetail?bid=${itm.bid }"><h4>${itm.title}</h4></a></strong></span>
													<span class="author"><strong>Author:</strong>${itm.author }</span>
													<span class="author"><strong>ISBN:</strong> ${itm.isbn }</span>
												</div>
											</figcaption>
										</figure>
									</li>
									</c:forEach>
								<div class="clearfix"></div>
							</div>
						</section>
						
						