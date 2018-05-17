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
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pagebanner1.jpg" alt="New products" >
				<h4><span>Đăng nhập * Đăng ký</span></h4>
			</section>			
			<section class="main-content">				
				<div class="row">
					<div class="span5">					
						<h4 class="title"><span class="text"><strong>Đăng nhập</strong> </span></h4>
						<form action="AccountController" method="POST">
							
							<%
								if (request.getAttribute("error") != null) {
							%>
							<div class="error-message">
								<p style="color:red"><%=request.getAttribute("error") %></p>
							</div>
							<%
								}
							%>
							<fieldset>
								<div class="control-group">
									<label class="control-label">Tên đăng nhập</label>
									<div class="controls">
										<input type="text" placeholder="Tên đăng nhập" class="input-xlarge" name="username">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Mật khẩu</label>
									<div class="controls">
										<input type="password" placeholder="Mật khẩu" class="input-xlarge" name="password">
									</div>
								</div>
								<div class="control-group">
									<input tabindex="3" class="btn btn-inverse large" type="submit" value="Đăng nhập">
									<hr>
									<!--  
									<p class="reset">Recover your <a tabindex="4" href="#" title="Recover your username or password">username or password</a></p>
									-->
								</div>
							</fieldset>
							<input type="hidden" name="command" value="login">
						</form>					
					</div>
					
					<div class="span7">
			<h4 class="title"><span class="text"><strong>Đăng ký</strong> </span></h4>
			<form action="AccountController" method="POST">
			<fieldset>
				<%
					if (request.getAttribute("error_register") != null) {
				%>
				<div class="error-message">
					<p style="color:red"><%=request.getAttribute("error_register") %></p>
				</div>
				<%
					}
				%>
				<div class="control-group">
					<label class="control-label">Tên đăng nhập</label> 
					<div class="controls">
						<input type="text" name="username" placeholder="Tên đăng nhập" class="input-xlarge">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Mật khẩu</label> 
					<div class="controls">
						<input type="password" name="password" placeholder="Mật khẩu" class="input-xlarge">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Địa chỉ</label> 
					<div class="controls">
						<input type="text" name="address" placeholder="Địa chỉ" class="input-xlarge">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Số điện thoại</label>
					<div class="controls">
						<input type="text" name="phone" placeholder="Số điện thoại" class="input-xlarge">
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="actions">
					<input type="submit" value="Đăng ký" >
				</div>
				<input type="hidden" name="command" value="register">
				</fieldset>				
			</form>
		</div>
					
					
			</section>
		</div>					
		<jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html>