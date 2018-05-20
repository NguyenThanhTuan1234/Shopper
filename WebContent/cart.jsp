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
<title>Cart</title>

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
			<script src="themes/js/respond.min.js"></script>
		<![endif]-->

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
	
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper" class="container">
		<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pagebanner1.jpg" alt="New products" >
				<h4><span>Giỏ hàng</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Giỏ hàng</strong> của bạn</span></h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Xóa</th>
									<th>Ảnh</th>
									<th>Tên sản phẩm</th>
									<th>Số lượng</th>
									<th>Giá</th>
									<th>Tổng</th>
								</tr>
							</thead>
							<tbody>
							<%
								for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
							%>
							<tr>
									<td><a href="CartController?command=remove&product_id=<%=list.getValue().getProduct().getId()%>"
														style="color: red">Xóa</a></td>
									<td><a href="single.jsp?product_id=<%=list.getValue().getProduct().getId()%>"><img alt="" src="images/<%=list.getValue().getProduct().getImage()%>"></a></td>
									<td><a href="single.jsp?product_id=<%=list.getValue().getProduct().getId()%>"><%=list.getValue().getProduct().getName()%></a></td>
									<td><input type="text" placeholder="<%=list.getValue().getQuantity()%>" class="input-mini"></td>
									<td><%=list.getValue().getProduct().getPrice()%>VND</td>
									<td><%=list.getValue().getProduct().getPrice()%>VND</td>
								</tr>	
							<%
								}
							%>
							<!--  
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="themes/images/ladies/9.jpg"></a></td>
									<td>Fusce id molestie massa</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$2,350.00</td>
									<td>$2,350.00</td>
								</tr>			  
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="themes/images/ladies/1.jpg"></a></td>
									<td>Luctus quam ultrices rutrum</td>
									<td><input type="text" placeholder="2" class="input-mini"></td>
									<td>$1,150.00</td>
									<td>$2,450.00</td>
								</tr>
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="themes/images/ladies/3.jpg"></a></td>
									<td>Wuam ultrices rutrum</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$1,210.00</td>
									<td>$1,123.00</td>
								</tr>
							-->
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><strong><%=cart.totalCart()%>VND</strong></td>
								</tr>		  
							</tbody>
						</table>
						<!--  
						<h4>What would you like to do next?</h4>
						<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
							Use Coupon Code
						</label>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
							Estimate Shipping &amp; Taxes
						</label>
						-->
						<hr>
						<p class="cart-total right">
						<!--  
							<strong>Sub-Total</strong>:	$100.00<br>
							<strong>Eco Tax (-2.00)</strong>: $2.00<br>
							<strong>VAT (17.5%)</strong>: $17.50<br>
						-->	
							<strong>Total</strong>: <%=cart.totalCart()%>VND<br>
						</p>
						<hr/>
						<p class="buttons center">				
							<!--  
							<button class="btn" type="button">Update</button>
							<button class="btn" type="button">Continue</button>
							-->
							<a href="checkout.jsp"><button class="btn btn-inverse" type="submit" id="checkout">Thanh Toán</button></a>
						</p>					
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">DANH MỤC</li>
								<%
			
			if (session.getAttribute("account") != null) {
				account = (Account) session.getAttribute("account");
			}
			
			if (session.getAttribute("cart") != null) {
				cart = (Cart) session.getAttribute("cart");
			} else {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
		%>
								
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
				</div>
			</section>		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>