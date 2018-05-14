<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

	<meta charset="utf-8">
		<title>Bootstrap E-commerce Templates</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">		
		<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="themes/css/flexslider.css" rel="stylesheet"/>
		<link href="themes/css/main.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->

</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div id="wrapper" class="container">				
			
	<div class="container">
		<div class="account">
			<h2 class="account-in">Đăng Ký</h2>
			<form action="AccountController" method="POST">
				<%
					if (request.getAttribute("error_register") != null) {
				%>
				<div class="error-message">
					<p style="color:red"><%=request.getAttribute("error_register") %></p>
				</div>
				<%
					}
				%>
				<div>
					<span class="col-md-2">Tên Tài Khoản *</span> <input type="text" name="username">
				</div>
				<div>
					<span class="word col-md-2">Mật Khẩu *</span> <input
						type="password" name="password">
				</div>
				<div>
					<span class="col-md-2">Địa chỉ </span> <input type="text" name="address">
				</div>
				<div>
					<span class="col-md-2">Số Điện Thoại </span> <input type="text" name="phone">
				</div>
				<div class="clearfix"></div>
				<div class="col-md-offset-3">
					<input type="submit" value="Đăng ký" >
				</div>
				<input type="hidden" name="command" value="register">				
			</form>
		</div>
	</div>
		</div>				
		<jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html>