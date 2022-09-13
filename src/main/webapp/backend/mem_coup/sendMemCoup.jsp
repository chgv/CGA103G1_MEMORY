<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coup.model.*"%>
<%@ page import="com.mem_coup.model.*"%>
<%@ page import="java.time.LocalDate"%>
<jsp:useBean id="coupSvc" class="com.coup.model.CoupService" />

 <%
 MemCoupService memCoupSrv = new MemCoupService();
 List<MemCoupVO> list = memCoupSrv.getAll();
 pageContext.setAttribute("list", list);
 
 CoupService coupSrv = new CoupService();
 List<CoupVO> coupList = coupSrv.getAll();
 pageContext.setAttribute("coupList", coupList);
 
%> 

<!DOCTYPE html>
<html>
<head>
<title>發放優惠券 - Memory</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.dataTables.min.css" />
	
<!-- jquery-ui -->	
<!-- <link rel="stylesheet" type="text/css"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" /> -->
	

<!-- bootstrap cdn 用了會跑版先註解 -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> -->

<%@ include file="/backend/commonCSS.file"%>


<style>
table.fold-table tbody tr.view {
	cursor: pointer;
}

table.fold-table tbody tr.view:hover {
	box-shadow: 0 0.125rem 1rem rgb(0 0 0/ 19%);
}

table.fold-table tbody tr.view.open {
	background: #8FC2C2;
}

table.fold-table tbody tr.view.open td {
	color: white;
}

table.fold-table tbody tr.fold {
	display: none;
}

table.fold-table tbody tr.fold.open {
	display: table-row;
}

table {
	width: 90%;
}

table.fold-table>thead>tr>th {
	align: center;
	font-size: 1.125rem;
	text-transform: capitalize;
	font-weight: 600;
	padding: 1.25rem 0.9375rem;
}

thead {
	background: #F7F6F2;
}

td, div {
	font-size: 1rem;
	letter-spacing: 0.5px;
}

/* coup css */
.coup-list-h1 {
	margin-right: 2rem;
}

.input-mr {
	margin-right: 1rem;
}

.input-mb {
	margin-bottom: 1rem;
}

.error-list-mb{
	margin-bottom: 0.6rem;
}
 
</style>

</head>
<body>

	<%@ include file="/backend/loading.file"%>
	<!-- Header -->
	<%@ include file="/backend/header.file"%>
	<!-- sidebar -->
	<%@ include file="/backend/sidebar.file"%>
	
	
	

	<!-- main -->
	<div class="content-body">
		<div class="container-fluid">
			<div class="col-12 d-flex justify-content-between mb-5">
				<h1 class="coup-list-h1">發放優惠券</h1>
			</div>
			
			<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<%-- <font style="color:red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red" class="error-list-mb">${message}</li>
					</c:forEach>
				</ul> --%>
				
				<div class="alert alert-danger alert-dismissible fade show">
					<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>
					<strong>Error!</strong> 請修正以下錯誤: <br>
					<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red" class="error-list-mb">${message}</li>
					</c:forEach>
					</ul>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close"></button>
				</div>
		</c:if>


			<div class="col-12">
				<form action="<%=request.getContextPath()%>/mem_coup/sendCoup.do" method="post" class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">發放優惠券</h3>
					</div>
					<div class="modal-body">
						<div class="form-row input-mb d-flex">
							<div class="form-group col-md-3 input-mr">
							<!-- 改針對會員帳號發送 -->
								<label for="coupName">輸入會員帳號</label> 
								<%-- <input type="text" class="form-control" id="mem_no" name="mem_acc" value="${memCoupVO.memVO.mem_acc}"> --%>
								<input type="number" class="form-control" id="mem_no" name="mem_no" value="${memCoupVO.mem_no}">
							</div>
							<div class="form-group col-md-4 input-mr">
							<!-- 優惠券改用下拉式 -->
								<label for="discount">選擇要發放的優惠券</label> 
								
								<select id="locate" class="default-select form-control wide" name=coup_no>
									<c:forEach var="coupVO" items="${coupList}">
									<c:if  test="${coupVO.status == 1}">
									<option value="${coupVO.coup_no}">${coupVO.coup_name}</option>
									</c:if>
									</c:forEach>
								</select>
							</div>
							
						</div>
					</div>
					<div class="modal-footer">
						<a href="<%=request.getContextPath()%>/backend/mem_coup/listSendMemCoup.jsp" class="btn btn-secondary" data-dismiss="modal">取消</a>
						<input type="submit" class="btn btn-primary" value="儲存">
					</div>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="/backend/commonJS.file"%>
	

</body>
</html>