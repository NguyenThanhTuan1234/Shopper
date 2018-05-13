<%@page import="entities.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Algorithm</title>
</head>
<body>
	<%
		Account account = null;
		if (session.getAttribute("account") != null) {
			account = (Account) session.getAttribute("account");
			if (account.getRole() != 1) {
				response.sendRedirect("/ElectronicsStore/index.jsp");
			}
		} else {
			response.sendRedirect("/ElectronicsStore/login.jsp");
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container col-md-offset-5 col-md-3 algo">
		<%
			if (request.getAttribute("msg") != null) {
		%>
		<div>
			<p style="color: blue"><%=request.getAttribute("msg")%></p>
		</div>
		<%
			}
		%>
		<form action="../AlgorithmController" method="POST">

			<select class="selectpicker" name="level">
				<option value="product">Sản phẩm</option>
				<option value="category">Danh Mục</option>
			</select> 
			<br>
			<br> 
			<span>Minimum support(%)</span>
			<div class="input-group spinner">
				<input type="text" class="form-control" name="min_sup" value="1"
					min="1" max="100">
				<div class="input-group-btn-vertical">
					<button class="btn btn-default" type="button">
						<i class="fa fa-caret-up"></i>
					</button>
					<button class="btn btn-default" type="button">
						<i class="fa fa-caret-down"></i>
					</button>
				</div>
			</div>
			<br> <span>Minimum confidence(%)</span>
			<div class="input-group spinner">
				<input type="text" class="form-control" name="min_conf" value="1"
					min="1" max="100">
				<div class="input-group-btn-vertical">
					<button class="btn btn-default" type="button">
						<i class="fa fa-caret-up"></i>
					</button>
					<button class="btn btn-default" type="button">
						<i class="fa fa-caret-down"></i>
					</button>
				</div>
			</div>
			<div class="col-md-offset-4 algo">
				<input type="submit" class="btn btn-primary" value="Chạy thuật toán">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {

			$('.spinner .btn:first-of-type').on(
					'click',
					function() {
						var btn = $(this);
						var input = btn.closest('.spinner').find('input');
						if (input.attr('max') == undefined
								|| parseInt(input.val()) < parseInt(input
										.attr('max'))) {
							input.val(parseInt(input.val(), 10) + 1);
						} else {
							btn.next("disabled", true);
						}
					});
			$('.spinner .btn:last-of-type').on(
					'click',
					function() {
						var btn = $(this);
						var input = btn.closest('.spinner').find('input');
						if (input.attr('min') == undefined
								|| parseInt(input.val()) > parseInt(input
										.attr('min'))) {
							input.val(parseInt(input.val(), 10) - 1);
						} else {
							btn.prev("disabled", true);
						}
					});

		})
	</script>
</body>
</html>