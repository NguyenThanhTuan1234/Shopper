<%@page import="ultils.Constant"%>
<%@page import="entities.Product"%>
<%@page import="dao.ProductDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<body>
	<%
		ProductDao productDao = new ProductDao();
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="banner.jsp"></jsp:include>
	<jsp:include page="content.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>