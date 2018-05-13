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
					
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Login or Regsiter</span></h4>
			</section>			
			<section class="main-content">				
				<div class="row">
					<div class="span5">					
						<h4 class="title"><span class="text"><strong>Login</strong> Form</span></h4>
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
									<label class="control-label">Username</label>
									<div class="controls">
										<input type="text" class="input-xlarge" name="username">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Username</label>
									<div class="controls">
										<input type="password" class="input-xlarge" name="password">
									</div>
								</div>
								<div class="control-group">
									<input tabindex="3" class="btn btn-inverse large" type="submit" value="Sign into your account">
									<hr>
									<p class="reset">Recover your <a tabindex="4" href="#" title="Recover your username or password">username or password</a></p>
								</div>
							</fieldset>
							<input type="hidden" name="command" value="login">
						</form>					
					</div>
					
					<div class="span7">					
						<h4 class="title"><span class="text"><strong>Register</strong> Form</span></h4>
						<form action="AccountController" method="POST" class="form-stacked">
						<%
							if (request.getAttribute("error_register") != null) {
						%>
							<div class="error-message">
								<p style="color:red"><%=request.getAttribute("error_register") %></p>
							</div>
						<%
							}
						%>
							<fieldset>
								<div class="control-group">
									<label class="control-label">Username</label>
									<div class="controls">
										<input type="text" placeholder="Enter your username" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Password:</label>
									<div class="controls">
										<input type="password" placeholder="Enter your password" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Address:</label>
									<div class="controls">
										<input type="text" placeholder="Enter your Address" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Phone:</label>
									<div class="controls">
										<input type="text" placeholder="Enter your Phone" class="input-xlarge">
									</div>
								</div>							                            
								<div class="control-group">
									<p>Now that we know who you are. I'm not a mistake! In a comic, you know how you can tell who the arch-villain's going to be?</p>
								</div>
								<hr>
								<div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="register"></div>
							</fieldset>
						</form>					
					</div>		
					
			</section>
						
		<jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html>