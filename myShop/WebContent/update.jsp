<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품수정페이지</title>
	
	<!-- CSS -->
	<link href="css/product.css" rel="stylesheet" type="text/css" media="all">
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
<div class="basics">
	<div id="result-body">
	<%
		request.setCharacterEncoding("UTF-8");	//인코딩 변경
	
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String getPrice = request.getParameter("price");
		int price = 0;
		
		if (getPrice != "") {
			price = Integer.parseInt(getPrice);
		}
		
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		
		if (dao.selectId(id) == null) {
	%>
	
			<p id="show-message">존재하지 않는 아이디입니다.</p>
			
	<% 		
		} else {
			dto.setId(id);
			dto.setContent(content);
			dto.setPrice(price);
			
			dao.update(dto);
	%>
	
			<p id="show-message">수정이 완료되었습니다.</p>

	<%
		}
	%>

		<span><button onclick="window.close()">창닫기</button></span>
		<span><button onclick="location.href = 'update.html'">돌아가기</button></span>		
	</div>
</div>
</body>
</html>