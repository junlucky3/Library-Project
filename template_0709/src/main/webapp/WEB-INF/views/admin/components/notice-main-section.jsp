<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
	function confirm_delete(dd) {
		var x = confirm("Are you sure you want to delete?");
		if (x)
			location.href = 'noticeDelete?nid=' + dd;
		else
			return false;
	}
</script>
<!--Main container start -->
<main class="ttr-wrapper">
	<div class="container-fluid">
		<div class="db-breadcrumb">
			<h4 class="breadcrumb-title">Notice</h4>
			<ul class="db-breadcrumb-list">
				<li><a href="/book/admin/index">Menu</a></li>
				<li>Notice</li>
				<li>Notices List</li>
			</ul>
		</div>
		<div class="row">
			<!-- Your Profile Views Chart -->
			<div class="col-lg-12 m-b30">
				<div class="widget-box">
					<div class="wc-title">
						<h4>All Notices</h4>
					</div>
		<!-- 			<div class="widget-inner"></div> -->
					<br />
					<main>
						<div class="container-fluid">
							<div class="card mb-4">
								<!-- <div class="card-header">
									<i class="fas fa-table mr-1"></i> notice-Main
								</div> -->
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>Notice ID</th>
													<th>Upload Date</th>
													<th>Title</th>
													<th></th>
												</tr>
											</thead>
											<tfoot style="border-color: white;">
												<tr>
													<!-- <th>Notice ID</th>
													<th>Upload Date</th>
													<th>Title</th>
													<th></th> -->

												</tr>
											</tfoot>
											<tbody>
												<c:forEach var="itm" items="${noticelist }">
													<tr>
														<td><a href="noticeDetail?nid=${itm.nid }">${itm.nid}</a></td>
														<td>${itm.uldate}</td>
														<td>${itm.title}</td>
														<td><button type="button" class="btn-secondry m-r5"
																onclick="location.href='noticeUpdate?nid=${itm.nid}'">Update</button>&nbsp;
															<%-- <button type="button" class="btn-secondry m-r5"
																onclick="location.href='noticeDelete?nid=${itm.nid}'">Delete</button> --%>
															<button type="button" class="btn-secondry m-r5" id="del"
																onclick="confirm_delete('${itm.nid}')" value="${itm.nid}">Delete</button></td>
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
<div class="ttr-overlay"></div>
