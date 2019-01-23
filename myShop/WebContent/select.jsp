<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품검색페이지</title>
	
	<!-- CSS -->
	<link href="css/product.css" rel="stylesheet" type="text/css" media="all">
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
<div class="basics">
	<div id="title">
		검색 결과
	</div>
	
	<%
		String id = request.getParameter("id");
	
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();

		if (dao.selectId(id) == null) {
	%>
		
			<p id="show-message">존재하지 않는 아이디입니다.</p>
			
	<%
		} else {
			dto = dao.select(id);
	%>
			
			<p class="result-show">아이디 : <%= dto.getId() %></p>
			<p class="result-show">상품명 : <%= dto.getName() %></p>
			<p class="result-show">상품설명 : <%= dto.getContent() %></p>
			<p class="result-show">가격 : <%= dto.getPrice() %></p>
			
	<%
		}
	%>
	
		<span><button onclick="window.close()">창닫기</button></span>
		<span><button onclick="location.href = 'select.html'">돌아가기</button></span>
</div>
</body>
</html>