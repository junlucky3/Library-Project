<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start: Products Section -->
<div id="content" class="site-content">
	<div id="primary" class="content-area">
		<main id="main" class="site-main">
			<div class="main-news-list">
				<div class="container">
					<br>
					<br>
					<div class="row">

						<div class="col-lg-12 m-b30">
							<div class="widget-box">
								<div class="wc-title text-center">
									<h1 style="color: black">Notice</h1>
									<span class="underline center"></span>
									<p class="lead">Check notices of our library</p>
								</div>

								<div class="widget-inner"></div>

								<br />

								<main>
									<div class="container-fluid">
										<div class="card mb-4">
											
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered" id="dataTable"
														width="100%" cellspacing="0">
														<thead>
															<tr>
																<!-- <th>Notice ID</th> -->
																<th>Date</th>
																<th>Title</th>
																<!-- <th>Contents</th> -->
																<!-- <th></th> -->
															</tr>
														</thead>
														<tfoot style="border-color: white;">
															<tr>
															

															</tr>
														</tfoot>
														<tbody>
															<c:forEach var="itm" items="${usernoticelist}">
																<tr>
																	<%-- <td>${itm.nid}</td> --%>
																	<td><a href="userNoticeDetail?nid=${itm.nid}">${itm.uldate}</a></td>
																	<td><a href="userNoticeDetail?nid=${itm.nid}">${itm.title}</a></td>
																	<%-- <td><a href="userNoticeDetail?nid=${itm.nid}">${itm.ncontents}</a></td> --%>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</main>
							</div>
						</div>
					</div>
					<!-- Your Profile Views Chart END-->
				</div>
			</div>
		</main>		
	</div>
	
</div>
<!-- End: Products Section -->
<br>
<br>
