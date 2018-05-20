<%@page import="entities.Item"%>
<%@page import="java.util.Map"%>
<%@page import="entities.Cart"%>
<%@page import="entities.Account"%>
<%@page import="entities.SubCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.SubCategoryDao"%>
<%@page import="entities.Category"%>
<%@page import="dao.CategoryDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>

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


		<script type="application/x-javascript">
	 		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
		</script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event) {
					event.preventDefault();
					$('html,body').animate({
						scrollTop : $(this.hash).offset().top
					}, 1000);
				});
			});
		</script>
		<!--slider-script-->
		<script src="js/responsiveslides.min.js"></script>
		<script>
			$(function() {
				$("#slider1").responsiveSlides({
					auto : true,
					speed : 500,
					namespace : "callbacks",
					pager : true,
				});
			});
		</script>
		<!--//slider-script-->
		<script>
			$(document).ready(function(c) {
				$('.alert-close').on('click', function(c) {
					$('.message').fadeOut('slow', function(c) {
						$('.message').remove();
					});
				});
			});
		</script>
		<script>
			$(document).ready(function(c) {
				$('.alert-close1').on('click', function(c) {
					$('.message1').fadeOut('slow', function(c) {
						$('.message1').remove();
					});
				});
			});
		</script>
</head>
<body>
	
	<%
		CategoryDao categoryDao = new CategoryDao();
		SubCategoryDao subCategoryDao = new SubCategoryDao();
		HashMap<Integer, ArrayList<SubCategory>> categoryMap = subCategoryDao.getCategoryMap();
		Account account = null;
		if (session.getAttribute("account") != null) {
			account = (Account) session.getAttribute("account");
		}
		Cart cart;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>
	
	<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="Search">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<%
								if (account != null) {
									if (account.getRole() == 1) {
							%>
							<li><a href="admin/algorithm.jsp">Quản lý</a></li>
							<%
								}
							%>
							<li><a href="AccountController?command=logout"><%=account.getUsername()%></a></li>
							<%
								} else {
							%>
							<li><a href="login.jsp">Tài khoản</a></li>
							
							<%
								}
							%>
							<li><a href="cart.jsp">Giỏ Hàng</a></li>
							<li><a href="checkout.jsp">Thanh Toán</a></li>					
							<li><a href="login.jsp">Đăng Nhập / Đăng ký</a></li>	
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.jsp" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul class="sf-js-enabled sf-shadow">
						<%
							for (Category category : categoryDao.getListCategory()) {
						%>
							<li><a class="sf-with-ul"><%=category.getName()%></a> 			
								<ul style="visibility: hiden; display: none">
								<%
									ArrayList<SubCategory> listSubCategory = (ArrayList) categoryMap.get(category.getId());
										if (listSubCategory != null) {

											for (SubCategory subcategory : listSubCategory) {
								%>
								<li><a href="products.jsp?sub_category=<%=subcategory.getId()%>&sub_category_name=<%=subcategory.getName()%>&page=1"><%=subcategory.getName()%></a>
									</li>
								<%
										}
										}
								%>							
								</ul>
							</li>	
						<%
							}
						%>
							
						</ul>
						
					</nav>
				</div>
			</section>
			</div>
			
			<script src="themes/js/common.js"></script>
		<script src="themes/js/jquery.flexslider-min.js"></script>
		<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
		</script>
</body>
</html>