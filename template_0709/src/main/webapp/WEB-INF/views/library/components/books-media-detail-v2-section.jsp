<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start: Products Section -->
        <div id="content" class="site-content">
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <div class="booksmedia-detail-main">
                        <div class="container">
                            <br><br>
                            <div class="booksmedia-detail-box">
                                <div class="detailed-box">
                                    <div class="col-xs-12 col-sm-5 col-md-3">
                                        <div class="post-thumbnail">
                                            <img src="${booklist.img}" alt="Book Image" style="width:286px; height:auto;" class="post-center-content"> <!-- class 사용하여 내용부분과 크기 고정 -->
                                        </div>
                                    </div>
                                    <div></div>
                                    <div class="col-xs-12 col-sm-7 col-md-6">
                                        <div class="post-center-content" style="width:550px; htight:286px;"> <!-- sytle로 내용부분 크기 고정 -->
                                            <h2>${booklist.title}</h2>
                                            <hr>
                                            <p>&nbsp;</p>
                                            <p><strong>Author:</strong> ${booklist.author}</p>
                                            <p><strong>ISBN:</strong> ${booklist.isbn}</p>
                                            <p><strong>Publisher:</strong> ${booklist.publisher}</p>
                                            <p><strong>Format:</strong>Book</p>
                                            <p><strong>Category :</strong> ${booklist.bcategory}</p>
                                            <p><strong>Location:</strong> ${booklist.blocation}</p>
                                            <p>&nbsp;</p><p>&nbsp;</p>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-3 ">
                                        <%-- <div class="post-right-content">
                                            <h4>Available now</h4>
                                            <p><strong>Total Copies:</strong> ${booklist.bcount}</p>
                                            <p><strong>Available:</strong> 01</p>
                                            <p><strong>Holds:</strong>  01</p>
                                            <p><strong>On the shelves now at:</strong> ${booklist.blocation}</p>
                                            <p><strong>Call #:</strong> 747 STRUTT C</p>
                                            <a href="#." class="available-location">Availability by Location <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                            <a href="#." class="btn btn-dark-gray">Place a Hold</a> 
                                            <!-- <a href="#." class="btn btn-dark-gray">View sample</a>  -->
                                            <a href="#." class="btn btn-dark-gray">Find Similar Titles</a>
                                        </div>
                                    </div> --%>
                                    <div class="post-right-content">
                                            <h4>Available now</h4>
                                            <%-- <p><strong>Total Copies:</strong> ${booklist.bcount}</p> --%>
                                            <p><strong>Available:</strong> 01</p>
                                            <p><strong>Holds:</strong>  01</p>
                                            <p><strong>On the shelves now at:</strong> ${booklist.blocation}</p>
                                            <c:choose>
												<c:when test="${in == 'lending'}">
													<a href="${pageContext.request.contextPath}/user/lendinginsertdo?bid=${booklist.bid }" class="btn btn-dark-gray">Lending</a>
												</c:when>
											
												<c:when test="${in == 'return'}">
													<a href="${pageContext.request.contextPath}/user/returndeletedo?bid=${booklist.bid }" class="btn btn-dark-gray">Return</a>
													<a href="${pageContext.request.contextPath}/user/exdateupdatedo?bid=${booklist.bid }" class="btn btn-dark-gray">Expanded</a>
												</c:when>
												
												<c:when test="${in == 'expanded'}">
													<a href="${pageContext.request.contextPath}/user/returndeletedo?bid=${booklist.bid }" class="btn btn-dark-gray">Return</a>
												</c:when>
																								
												<c:when test="${in == 'reserved'}">
													<a href="${pageContext.request.contextPath}/user/reservedinsertdo?bid=${booklist.bid }" class="btn btn-dark-gray">Reserved</a>
												</c:when>
												
												<c:when test="${in == 'reserved cancel'}">
													<a href="${pageContext.request.contextPath}/user/reserveddeletedo?bid=${booklist.bid }" class="btn btn-dark-gray"></i>Reserved Cancel</a>
												</c:when>
												
												<c:when test="${out == 'lending'}">
													<a href="login" class="btn btn-dark-gray"></i>Lending</a>
												</c:when>
												
												<c:when test="${out == 'reserved'}"><a href="login">
													<a href="login" class="btn btn-dark-gray"></i>Reserved</a>
												</c:when>
												
												
											<%-- 	<c:when test="${}">
													<a href="${pageContext.request.contextPath}/user/resinsertdo?bid=${booklist.bid }" class="btn btn-dark-gray"></i>Reserved</a>
												</c:when>
												
																								
												<c:when test="${}">
													<a href="${pageContext.request.contextPath}/user/login" class="btn btn-dark-gray"></i>Lending</a>
												</c:when>
												
												
												<c:when test="${}">
													<a href="${pageContext.request.contextPath}/user/login" class="btn btn-dark-gray"></i>Reserved</a>
												</c:when>
												 --%>
												
												
											</c:choose>
                                            
                                            <!-- <a href="#." class="btn btn-dark-gray">LENDING</a> --> 
                                           <!--  <a href="#." class="available-location">Availability by Location <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                            <a href="#." class="btn btn-dark-gray">Place a Hold</a> 
                                            <a href="#." class="btn btn-dark-gray">View sample</a> 
                                            <a href="#." class="btn btn-dark-gray">Find Similar Titles</a> -->
                                        </div>
                                    </div>
                                  <!--  <div class="clearfix"></div> --> <!-- clearfix 주석처리하여 이미지 라인부 배경 색깔 제거 -->
                                </div>
                                <div class="clearfix"></div><br>
                                <p><strong>Description :</strong> ${booklist.descrip} </p>

                                <!-- <div class="table-tabs" id="responsiveTabs">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><b class="arrow-up"></b><a data-toggle="tab" href="#sectionA">Copies: 05</a></li>
                                        <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionB">Reviews (12)</a></li>
                                        <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionC">Table of Contents</a></li>
                                        <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionD">Novelist Recommendations</a></li> 
                                    </ul>
                                    <div class="tab-content">
                                        <div id="sectionA" class="tab-pane fade in active">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Library Name</th>
                                                        <th>Shelf Number</th>
                                                        <th>Material Type</th>
                                                        <th>Status </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Oak Park Public Library Main Branch</td>
                                                        <td>B PURMORT</td>
                                                        <td>Book</td>
                                                        <td>In Processing</td>                                                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Bedford Park Public Library District</td>
                                                        <td>616.99 PUR</td>
                                                        <td>Book</td>
                                                        <td>Due 8/24/16</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Blue Island Public Library</td>
                                                        <td>BIO PUR</td>
                                                        <td>eBook</td>
                                                        <td>Due 8/24/16</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Bridgeview Public Library</td>
                                                        <td>B PUR</td>
                                                        <td>DVD</td>
                                                        <td>In Processing</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Eisenhower Public Library District</td>
                                                        <td>616.994 PUR</td>
                                                        <td>Magazine</td>
                                                        <td>Checked In</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Forest Park Public Library</td>
                                                        <td>BIO PURMORT</td>
                                                        <td>Magazine</td>
                                                        <td>Checked In</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Hinsdale Public Library</td>
                                                        <td>B PUR</td>
                                                        <td>Audio</td>
                                                        <td>Checked In</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Oak Park Public Library Maze Branch</td>
                                                        <td>616.99 PUR</td>
                                                        <td>Audio</td>
                                                        <td>Due 9/10/16</td>
                                                    </tr>
                                                    <tr>
                                                        <td>River Grove Public Library District</td>
                                                        <td>616.994 PURMORT</td>
                                                        <td>Book</td>
                                                        <td>Due 9/10/16</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="sectionB" class="tab-pane fade in">
                                            <h5>Lorem Ipsum Dolor</h5>
                                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                        </div>
                                        <div id="sectionC" class="tab-pane fade in">
                                            <h5>Lorem Ipsum Dolor</h5>
                                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                        </div>
                                        <div id="sectionD" class="tab-pane fade in">
                                            <h5>Lorem Ipsum Dolor</h5>
                                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                        </div>                                                    
                                        <div id="sectionE" class="tab-pane fade in">
                                            <h5>Lorem Ipsum Dolor</h5>
                                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                        </div>                                                    
                                        <div id="sectionF" class="tab-pane fade in">
                                            <h5>Lorem Ipsum Dolor</h5>
                                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <br><br><br>