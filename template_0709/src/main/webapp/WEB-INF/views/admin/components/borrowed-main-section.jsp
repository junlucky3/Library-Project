<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
	function confirm_delete(dd) {
		var x = confirm("Are you sure you want to delete?");
		if (x)
			location.href = 'borrowedDelete?rentid=' + dd;
		else
			return false;
	}
</script>
<!--Main container start -->
<main class="ttr-wrapper">
	<div class="container-fluid">
		<div class="db-breadcrumb">
			<h4 class="breadcrumb-title">Borrowed</h4>
			<ul class="db-breadcrumb-list">
				<li><a href="/book/admin/index">
						<!-- <i class="fa fa-home"> -->
						</i>Menu
				</a></li>
				<li>Circulation</li>
				<li>Borrowed</li>
			</ul>
		</div>
		<div class="row">
			<!-- Your Profile Views Chart -->
			<div class="col-lg-12 m-b30">
				<div class="widget-box">
					<div class="wc-title">
						<h4>All Borrowed Books</h4>
					</div>
<!-- 					<div class="widget-inner"></div> -->
					<br />
					<main>
						<div class="container-fluid">
							<div class="card mb-4">
								<!-- <div class="card-header">
									<i class="fas fa-table mr-1"></i> borrowed-main
								</div> -->
								<!-- <div style="text-align:right;padding-right:20px;padding-top:20px;">
												<button type="button" class="btn-secondry m-r5" onclick="location.href='borrowedInsert'">Insert</button>
											</div> -->
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>Transaction ID</th>
													<th>User Email</th>
													<th>Book ID</th>
													<th>Issue Date</th>
													<th>Expiration Date</th>
													<!-- <th>Return Date</th> -->
													<!-- <th>User Block Date</th>Shouldn't this be in User's DB? -->
													<th>Extention
													<th>
														<!-- 	<th>Option</th> -->
												</tr>
											</thead>
											<tfoot>
												<!-- 	<tr>
													<th>BorrowedId</th>
													<th>BorrowedEmail</th>
													<th>BorrowedBid</th>
													<th>Isdate</th>
													<th>Exdate</th>
													<th>BorrowedDate</th>
													<th>Bldate</th>
													<th>IsExpanded</th>
													<th>Option</th>
												</tr> -->
											</tfoot>
											<tbody>
												<c:forEach var="itm" items="${borrowedlist }">
													<tr>
														<td>${itm.rentid }</td>
														<td>${itm.renemail }</td>
														<td>${itm.renbid }</td>
														<td>${itm.isdate }</td>
														<td>${itm.exdate }</td>
														<%-- <td>${itm.retdate }</td> --%>
														<%-- 	<td>${itm.bldate }</td> --%>
														<td>${itm.isExpanded }</td>

														<td>
															<%-- <button type="button" class="btn-secondry m-r5" onclick="location.href='borrowedUpdate?rentid=${itm.rentid}'">Update</button>&nbsp; --%>
															<%-- <button type="button" class="btn-secondry m-r5" onclick="location.href='borrowedDelete?rentid=${itm.rentid }'">Delete</button> --%>
															<button type="button" class="btn-secondry m-r5" id="del"
																onclick="confirm_delete(${itm.rentid})"
																value="${itm.rentid }">Delete</button>
														</td>
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
</main>
<div class="ttr-overlay"></div>