<%@page import="dao.SubCategoryRuleDao"%>
<%@page import="ultils.Constant"%>
<%@page import="entities.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="controller.ProductController"%>


<%@page import="dao.CategoryDao"%>
<%@page import="dao.SubCategoryDao"%>
<%@page import="entities.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>

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

	<%
		ProductController productController = new ProductController();
		ProductDao productDao = new ProductDao();
		SubCategoryRuleDao subCategoryRuleDao = new SubCategoryRuleDao();
		int total = 0;
		int pageno = 1;
		String sub_category_id = "";
		String sub_category_name = "";
		if (request.getParameter("sub_category") != null) {
			sub_category_id = request.getParameter("sub_category");

		}
		if (request.getParameter("sub_category_name") != null) {
			sub_category_name = request.getParameter("sub_category_name");

		}
		if (request.getParameter("page") != null) {
			pageno = Integer.parseInt(request.getParameter("page"));
		}
		total = productDao.countTotal(Integer.parseInt(sub_category_id));
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper" class="container">
		<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pagebanner1.jpg" alt="New products" >
				<h4><span><%=sub_category_name%></span></h4>
			</section>
			<section class="main-content">
				
				<div class="row">						
					<div class="span9">								
						<ul class="thumbnails listing-products">
							
							<%
								for (Product product : productDao.getListProduct(Integer.parseInt(sub_category_id),
									(pageno - 1) * Constant.NUMBER_PRODUCT_PER_PAGE, Constant.NUMBER_PRODUCT_PER_PAGE)) {
							%>
								
													<li class="span3">
													<div class="product-box">
														<a href="single.jsp?product_id=<%=product.getId()%>"
														class="compare-in "><img src="images/<%=product.getImage() %>" alt="" /> </a></br>
														<a href="single.jsp?product_id=<%=product.getId()%>" class="title"><%=productController.shortName(product.getName()) %></a></br>
														<p>
															<span><%=product.getPrice()%></span><span class="title">vnd</span>
														</p>
														<a href="CartController?command=addToCart&product_id=<%=product.getId()%>"
															class = title>Mua</a>
										
													</div>
							<%
								}
							%>
						
														
						</ul>
						<div class="pagination pagination-small pagination-centered">
							<ul>
								<%
									if (pageno != 1) {
								%>
									<li><a href="products.jsp?sub_category=<%=sub_category_id%>&sub_category_name=<%=sub_category_name%>&page=<%=pageno - 1%>"><i></i></a></li>
								<%
									}
								%>
								<%
									for (int i = 0; i <= total / (Constant.NUMBER_PRODUCT_PER_PAGE + 1); i++) {
								%>
									<li class=""><a href="products.jsp?sub_category=<%=sub_category_id%>&sub_category_name=<%=sub_category_name%>&page=<%=i + 1%>">
								<%
									if (pageno == (i + 1)) {
								%><span><%=i + 1%></span>
								<%
									} else {
								%>
										<%=i + 1%>
								<%
 									}
								%>
									</a></li>
								<%
									}
								%>
								<%
									if (pageno != (total / Constant.NUMBER_PRODUCT_PER_PAGE +1)) {
								%>
									<li><a href="products.jsp?sub_category=<%=sub_category_id%>&sub_category_name=<%=sub_category_name%>&page=<%=pageno + 1%>"><i
						class="next"> </i></a></li>
								<%
									}
								%>
							</ul>
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
						
						
					</div>
					
					<div class="span9">	
								<br>
								<h4 class="title">
									<span class="pull-left"><span class="text"><strong>Sách</strong> liên quan</span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-1" data-slide="prev"></a><a class="right button" href="#myCarousel-1" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-1" class="carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails listing-products">
												
												<%
										Product product;
										int count = 0;
											for (int subCategoryId : subCategoryRuleDao.getRuleList(Integer.parseInt(sub_category_id))) {
												if((count ++) == 4) break;
												product = productDao.getProductBySubCategoryId(subCategoryId);
									%>
													<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="single.jsp?product_id=<%=product.getId()%>"><img alt="" src="images/<%=product.getImage() %>"></a></br>
														
															<a href="single.jsp?product_id=<%=product.getId() %>" class="title"><%=productController.shortName(product.getName()) %></a></br>
														
														
														<a href="single.jsp?product_id=<%=product.getId() %>" class="category"><%=product.getDescription()%></a></br>
														
														<p class="title"><%=product.getPrice()%> <span>vnđ</span></p>
														
															<a href="CartController?command=addToCart&product_id=<%=product.getId()%>"
														class="title">MUA</a>
													</div>
													<%
											}
										%>
												</li>
																							
											</ul>
										</div>
										
									</div>
								</div>
							</div>
					
					
					
				</div>
			</section>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>