<%@page import="ultils.Constant"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.ProductRuleDao"%>
<%@page import="entities.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="entities.Account"%>
<%@page import="entities.SubCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.SubCategoryDao"%>
<%@page import="entities.Category"%>
<%@page import="entities.Cart"%>
<%@page import="dao.CategoryDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Single</title>

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
		<link href="themes/css/main.css" rel="stylesheet"/>
		<link href="themes/css/jquery.fancybox.css" rel="stylesheet"/>
				
		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<script src="themes/js/jquery.fancybox.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	
	<%
		ProductDao productDao = new ProductDao();
		Product product = new Product();
		ProductRuleDao productRuleDao = new ProductRuleDao();
		HashMap<Integer, Product> productMap = productDao.getAllProductMap();
		String product_id = "";
		if (request.getParameter("product_id") != null) {
			product_id = request.getParameter("product_id");
			product = productDao.getProduct(Integer.parseInt(product_id));

		}
	%>
	
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper" class="container">
		<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pagebanner1.jpg" alt="New products" >
				<h4><span>Thông tin chi tiết</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">						
					<div class="span9">
						<div class="row">
							<div class="span4">
								<a href="single.jsp?product_id=<%=product.getId()%>" class="thumbnail" data-fancybox-group="group1" title="Description 1"><img alt="" src="images/<%=product.getImage() %>"></a>												
								
							</div>
							<div class="span5">
								<address>
									<strong>Tên sản phẩm:</strong> <span><%=product.getName()%></span><br>
									<strong>Mã sản phẩm:</strong> <span>Product <%=product.getId()%></span><br>
									<!--  <strong>Reward Points:</strong> <span>0</span><br>-->
									<!--  <strong>Availability:</strong> <span>Out Of Stock</span><br>	-->							
								</address>									
								<h4><strong>Giá: <%=product.getPrice()%></strong></h4>
							</div>
							<div class="span5">
								<form class="form-inline">
								<!--  
									<label class="checkbox">
										<input type="checkbox" value=""> Option one is this and that
									</label>
									<br/>
									<label class="checkbox">
									  <input type="checkbox" value=""> Be sure to include why it's great
									</label>
									<p>&nbsp;</p>
									-->
									<label>Số lượng:</label>
									<input type="text" class="span1" placeholder="1">
									<a href="CartController?command=addToCart&product_id=<%=product.getId() %>" class="btn btn-inverse">
									Thêm vào giỏ hàng</a>
								</form>
							</div>							
						</div>
						<div class="row">
							<div class="span9">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#home">Mô tả</a></li>
									<li class=""><a href="#profile">Thông tin thêm</a></li>
								</ul>							 
								<div class="tab-content">
									<div class="tab-pane active" id="home"><%=product.getDescription()%></div>
									<div class="tab-pane" id="profile">
										<table class="table table-striped shop_attributes">	
											<tbody>
												<tr class="">
													<th>Size</th>
													<td>Large, Medium, Small, X-Large</td>
												</tr>		
												<tr class="alt">
													<th>Colour</th>
													<td>Orange, Yellow</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>							
							</div>						
							<div class="span9">	
								<br>
								<h4 class="title">
									<span class="pull-left"><span class="text"><strong>Sách</strong> Liên quan</span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-1" data-slide="prev"></a><a class="right button" href="#myCarousel-1" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-1" class="carousel slide">
									<div class="carousel-inner">
									<div class="active item">
											<ul class="thumbnails listing-products">
									<%
										for (int productId : productRuleDao.getRule(Integer.parseInt(product_id), Constant.NUMBER_ITEM)) {
											product = productMap.get(productId);
									%>
										
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="single.jsp?product_id=<%=product.getId()%>"><img alt="" src="images/<%=product.getImage() %>"></a><br/>
														<a href="single.jsp?product_id=<%=product.getId() %>" class="title"><%=product.getName() %></a><br/>
														<a href="#" class="category">Suspendisse aliquet</a>
														<p class="price"><%=product.getPrice()%></p>
														<a href="CartController?command=addToCart&product_id=<%=product.getId()%>"
															class = title>Mua</a>
													</div>
													<%
											}
										%>
												</li>
														
											</ul>
										</div>
										
										<div class="item">
											<ul class="thumbnails listing-products">
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="single.jsp?product_id=<%=product.getId() %>"><img alt="" src="images/<%=product.getImage() %>"></a><br/>
														<a href="single.jsp?product_id=<%=product.getId() %>" class="title"><%=product.getName() %></a><br/>
														<a href="#" class="category">Suspendisse aliquet</a>
														<p class="price"><%=product.getPrice()%></p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/1.jpg"></a><br/>
														<a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
														<a href="#" class="category">Phasellus consequat</a>
														<p class="price">$341</p>
													</div>
												</li>       
												<li class="span3">
													<div class="product-box">												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/2.jpg"></a><br/>
														<a href="product_detail.html">Praesent tempor sem</a><br/>
														<a href="#" class="category">Erat gravida</a>
														<p class="price">$28</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/3.jpg"></a><br/>
														<a href="product_detail.html" class="title">Wuam ultrices rutrum</a><br/>
														<a href="#" class="category">Suspendisse aliquet</a>
														<p class="price">$341</p>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">DANH MỤC</li>
						<%
							for (Category category : categoryDao.getListCategory()) {
						%>
							<li><%=category.getName()%> | 			
								<ul>
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
							<br/>
						</div>
						<!--  
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Randomize</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>												
													<a href="product_detail.html"><img alt="" src="themes/images/ladies/7.jpg"></a><br/>
													<a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
													<a href="#" class="category">Suspendisse aliquet</a>
													<p class="price">$261</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<a href="product_detail.html"><img alt="" src="themes/images/ladies/8.jpg"></a><br/>
													<a href="product_detail.html" class="title">Tempor sem sodales</a><br/>
													<a href="#" class="category">Urna nec lectus mollis</a>
													<p class="price">$134</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						-->
					</div>
				</div>
			</section>			
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>