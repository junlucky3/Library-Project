<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    /* function passwordReset(){
        var formData = $("#passwordReset").serialize();

        $.ajax({
            cache : false,
            url : "${pageContext.request.contextPath}/user/passwordReset2", // 요기에
            dataType : "POST",
            data : formData, 
            success : function(data) {
                alert(data);
            }, // success 
    
            error : function() {
            	alert("error");
            }
        }); // $.ajax */
//    }
    function udpateInform(){
        var formData = $("#udpateInform").serialize();

        $.ajax({
            cache : false,
            url : "${pageContext.request.contextPath}/user/udpateInform", // 요기에
            type : "POST", 
            data : formData, 
            success : function(data) {
                alert(data);
                window.location.reload(true);
            }, // success 
    
            error : function() {
            	alert("error");
            }
        }); // $.ajax */
    }
    function passwordReset(){
        var formData = $("#passwordReset").serialize();

        $.ajax({
            cache : false,
            url : "${pageContext.request.contextPath}/user/passwordReset", // 요기에
            type : "POST", 
            data : formData, 
            success : function(data) {
                alert(data);
                window.location.reload(true);
            }, // success 
    
            error : function() {
            	alert("error");
            }
        }); // $.ajax */
    }
</script>
<!-- Start: Mypage Section -->
<div id="content" class="site-content">
	<div id="primary" class="content-area">
		<main id="main" class="site-main">
			<div class="signin-main">
				<div class="container">
					<div class="woocommerce">
						<div class="woocommerce-login">
							<div class="company-info signin-register">
								<div class="col-md-8 col-md-offset-2 border-dark new-user">
									<div class="row">
										<div class="col-md-12">
											<div class="company-detail new-account bg-light margin-right">
												<div class="new-user-head">
													<h2>MyPage</h2>
													<span class="underline left"></span>
													<p></p>
												</div>

												<p class="form-row form-row-first input-required">
													<label> <span>${sessionScope.email}</span>
													</label> <br>
												</p>
												<form id="passwordReset" class="passwordReset">
													<p class="form-row input-required">
														<label> <span class="first-letter">Password</span>
															<span class="second-letter">*</span>
														</label> <input type="password" id="passwd" name="passwd"
															class="input-text">
													</p>
													<p class="form-row input-required">
														<label> <span class="first-letter">Password
																Repeat</span> <span class="second-letter">*</span>
														</label> <input type="password" id="passwdre" name="passwdre"
															class="input-text">
													</p>
													<div class="clear"></div>
													<input type="submit" value="Password reset"
														name="Password reset" class="button btn btn-default"
														onclick="passwordReset(); return false;">
													<div class="clear"></div>
												</form>
												<br><br>
												<form id="udpateInform" class="udpateInform">
													<p class="form-row input-required">
														<label> <span class="first-letter">NAME :
																${ user.NAME }</span> <span class="second-letter">*</span>
														</label> <input type="text" id="name" name="name"
															class="input-text">
													</p>
													<p class="form-row input-required">
														<label> <span class="first-letter">BIRTH :
																${ user.BIRTH }</span> <span class="second-letter">*</span>
														</label> <input type="text" id="birth" name="birth"
															class="input-text">
													</p>
													<p class="form-row input-required">
														<label> <span class="first-letter">PHONE :
																${ user.PHONE }</span> <span class="second-letter">*</span>
														</label> <input type="text" id="phone" name="phone"
															class="input-text">
													</p>
													<p class="form-row input-required">
														<label> <span class="first-letter">ADDRESS
																: ${ user.ADDRESS }</span> <span class="second-letter">*</span>
														</label> <input type="text" id="address" name="address"
															class="input-text">
													</p>
													<div class="clear"></div>
													<input type="submit" value="Update" name="Inform reset"
														class="button btn btn-default"
														onclick="udpateInform(); return false;">
													<div class="clear"></div>
												</form>
												<br><hr><br>
												<h3>Lendded List</h3><br>
												<table class="table table-bordered" id="dataTable3"
													width="100%" cellspacing="0">
													<thead>
														<tr>
															<!-- <th>Notice ID</th> -->
															<th>Title</th>
															<th>Borrowed date</th>
															<th>Expired date</th>
															<!-- <th></th> -->
														</tr>
													</thead>
													<tfoot style="border-color: white;">
														<tr>


														</tr>
													</tfoot>
													<tbody>
														<c:forEach var="itm" items="${rentlist}">
															<c:if test="${sessionScope.email == itm.EMAIL }">
																<tr>
																	<td>${itm.TITLE}</td>
																	<td>${itm.ISDATE}</td>
																	<td>${itm.EXDATE}</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
												<br><br>
												<h3>Reserved List</h3><br>
												<table class="table table-bordered" id="dataTable2"
													width="100%" cellspacing="0">
													<thead>
														<tr>
															<!-- <th>Notice ID</th> -->
															<th>Title</th>
															<th>Date</th>
															<!-- <th></th> -->
														</tr>
													</thead>
													<tfoot style="border-color: white;">
														<tr>


														</tr>
													</tfoot>
													<tbody>
														<c:forEach var="itm" items="${reslist}">
															<c:if test="${sessionScope.email == itm.EMAIL }">
																<tr>
																	<td>${itm.TITLE}</td>
																	<td>${itm.RESDATE}</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>
<!-- End: Mypage Section -->