<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Start: Book & Media Section -->
<div id="content" class="site-content">
	<div id="primary" class="content-area">
		<main id="main" class="site-main">
			<div class="books-media-list">
				<div class="container">
					<div class="row">
						<jsp:include page="search-section.jsp" flush="false" />
					</div>
					<div class="row">
						<!-- <div class="col-md-9 col-md-push-3"> -->
							<c:forEach var="itm" items="${bbooklist }">
								<div class="books-list" style="padding-right:100px;padding-left:100px;">
									<article>
										<div class="single-book-box">
											<div class="post-thumbnail">
												<div class=""></div>
												<a href="bbookDetail?bid=${itm.bid }"><img alt="Book" src="${itm.img }"
													style="width: 233px; height: auto;" /></a>
											</div>
											<div class="post-detail">
												<header class="entry-header">
													<div class="row">
														<div class="col-sm-6">
															<h3 class="entry-title">
																<a href="bbookDetail?bid=${itm.bid }">${itm.title } </a>
															</h3>
															<ul>
																<li><strong>Author:</strong> ${itm.author }</li>
																<li><strong>ISBN:</strong> ${itm.isbn }</li>
															</ul>
														</div>
														<div class="col-sm-6">
															<ul>
																<li><strong>Publisher:</strong> ${itm.publisher }</li>
																<li><strong>Category:</strong> ${itm.bcategory }</li>
															</ul>
														</div>
													</div>
												</header>
												<div class="entry-content">
													<p>${itm.descrip }</p>
												</div>
												<footer class="entry-footer">
													<a class="btn btn-dark-gray" href="bbookDetail?bid=${itm.bid }">Read
														More</a>
												</footer>
											</div>
											<div class="clear"></div>
										</div>
									</article>
								</div>
							</c:forEach>

							<div style="display: block; text-align: center;">
								<c:if test="${paging.startPage > 1 }">
									<a
										href="${pageContext.request.contextPath}/user/BbooklistMain?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:if test="${paging.startPage>=1 }">
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
										var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a
													href="${pageContext.request.contextPath}/user/BbooklistMain?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a
										href="${pageContext.request.contextPath}/user/BbooklistMain?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							<!-- </div> -->
						</div>
						<%-- <div class="col-md-3 col-md-pull-9">
							<aside id="secondary" class="sidebar widget-area"
								data-accordion-group>
								<div class="widget widget_recent_entries">
									<h4 class="widget-title">Browsing History</h4>
									<ul>
										<li>
											<figure>
												<img
													src="${pageContext.request.contextPath}/images/order-item-01.jpg"
													alt="product" />
											</figure> <a href="#">The Sonic Boom</a> <span class="price"><strong>Author:</strong>
												F. Scott Fitzgerald</span> <span><strong>ISBN:</strong>
												978158157</span>
											<div class="rating">
												<span>☆</span> <span>☆</span> <span>☆</span> <span>☆</span>
												<span>☆</span>
											</div>
											<div class="clearfix"></div>
										</li>
										<li>
											<figure>
												<img
													src="${pageContext.request.contextPath}/images/order-item-02.jpg"
													alt="product" />
											</figure> <a href="#">The Sonic Boom</a> <span class="price"><strong>Author:</strong>
												F. Scott Fitzgerald</span> <span><strong>ISBN:</strong>
												978158157</span>
											<div class="rating">
												<span>☆</span> <span>☆</span> <span>☆</span> <span>☆</span>
												<span>☆</span>
											</div>
											<div class="clearfix"></div>
										</li>
										<li>
											<figure>
												<img
													src="${pageContext.request.contextPath}/images/order-item-03.jpg"
													alt="product" />
											</figure> <a href="#">The Sonic Boom</a> <span class="price"><strong>Author:</strong>
												F. Scott Fitzgerald</span> <span><strong>ISBN:</strong>
												978158157</span>
											<div class="rating">
												<span>☆</span> <span>☆</span> <span>☆</span> <span>☆</span>
												<span>☆</span>
											</div>
											<div class="clearfix"></div>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
							</aside>
						</div> --%>
					</div>
				</div>
				<br> <br>
				<div style="text-align: right">
					<a class="btn btn-dark-gray" href="bookhopeInsert">Request a
						book</a>
				</div>
			</div>
		</main>
	</div>
</div>
<!-- End: Books & Media Section -->