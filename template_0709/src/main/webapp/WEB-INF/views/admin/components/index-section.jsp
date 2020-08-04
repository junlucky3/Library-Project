<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Main container start -->
<main class="ttr-wrapper">
	<div class="container-fluid">
		<div class="db-breadcrumb">
			<h4 class="breadcrumb-title">Dashboard</h4>
			<!-- <ul class="db-breadcrumb-list">
					<li><a href="#"><i class="fa fa-home"></i>Home</a></li>
					<li>Dashboard</li>
				</ul> -->
		</div>
		<!-- Card -->
		<div class="row">
			<div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
				<div class="widget-card widget-bg1">
					<div class="wc-item">
						<h4 class="wc-title">Monthly Balance</h4>
						<span class="wc-des">Summary of incomes/orders</span> <span
							class="wc-stats"> $<span class="counter">${balance }</span>
						</span>
						<%-- <div class="progress wc-progress">
							<div class="progress-bar" role="progressbar" style="width: ${icm*100/(icm+odr)}%;"
								aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="wc-progress-bx"> <span class="wc-change">
								Incomes </span> <span class="wc-number ml-auto"> Orders </span>
						</span> --%>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
				<div class="widget-card widget-bg2">
					<div class="wc-item">
						<h4 class="wc-title">Monthly Incomes</h4>
						<span class="wc-des"> Monthly Incomes </span> <span
							class="wc-stats"> $<span class="counter"> ${icm } </span></span>
						<!-- <div class="progress wc-progress">
							<div class="progress-bar" role="progressbar" style="width: 88%;"
								aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="wc-progress-bx"> <span class="wc-change">
								Change </span> <span class="wc-number ml-auto"> 88% </span>
						</span> -->
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
				<div class="widget-card widget-bg3">
					<div class="wc-item">
						<h4 class="wc-title">Monthly Orders</h4>
						<span class="wc-des"> Monthly Orders </span> <span
							class="wc-stats"> $<span class="counter"> ${odr } </span></span>
						<!-- <div class="progress wc-progress">
							<div class="progress-bar" role="progressbar" style="width: 65%;"
								aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="wc-progress-bx"> <span class="wc-change">
								Change </span> <span class="wc-number ml-auto"> 65% </span>
						</span> -->
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
				<div class="widget-card widget-bg4">
					<div class="wc-item">
						<h4 class="wc-title">Users</h4>
						<span class="wc-des"> Joined User </span> <span
							class="wc-stats counter"> ${usrs } </span>
						<!-- <div class="progress wc-progress">
							<div class="progress-bar" role="progressbar" style="width: 90%;"
								aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="wc-progress-bx"> <span class="wc-change">
								Change </span> <span class="wc-number ml-auto"> 90% </span>
						</span> -->
					</div>
				</div>
			</div>
		</div>
		<!-- Card END -->
		
		<div class="row">
			<!-- Your Profile Views Chart -->
			<div class="col-lg-8 m-b30">
				<div class="widget-box">
					<div class="wc-title">
						<h4>Book Count</h4>
					</div>
					<div class="widget-inner">
						<canvas id="myChart" width="1000" height="400"></canvas>

					</div>
				</div>
			</div>
		</div>
<!-- Your Profile Views Chart END -->

	 
	 
	 
	 
</main>
<div class="ttr-overlay"></div>
<script>
	var labelList = new Array();
	var list = new Array();

	<c:forEach var="itm" items="${indexList }">
		labelList.push('<c:out value="${itm.currentDate}"/>');
		list.push('<c:out value="${itm.bookNum}"/>');
	</c:forEach>
	
	console.log(labelList);
	console.log(list);
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx,
			{
				type : 'line',
				data : {
					labels : labelList,
					datasets : [ {
						label : 'Book number',
						data : list,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					responsive : false,
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					},
				}
			});
</script>