// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});
$(document).ready(function() {
	  $('#dataTable2').DataTable({
		  	// 표시 건수기능 숨기기
			lengthChange: false,
			// 검색 기능 숨기기
			searching: false,
	  });
});
$(document).ready(function() {
	  $('#dataTable3').DataTable({
		  	// 표시 건수기능 숨기기
			lengthChange: false,
			// 검색 기능 숨기기
			searching: false,
	  });
});


