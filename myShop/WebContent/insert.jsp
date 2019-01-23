<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품등록페이지</title>
	
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
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			int price = Integer.parseInt(request.getParameter("price"));
			
			ProductDAO dao = new ProductDAO();
			ProductDTO dto = new ProductDTO();
			
			if (dao.selectId(id) != null) {
		%>
			
				<p id="show-message">이미 존재하는 아이디입니다. 다시 입력해주세요.</p>
		
		<%		
			} else {
				//DB에 삽입
				dto.setId(id);
				dto.setName(name);
				dto.setContent(content);
				dto.setPrice(price);
				
				dao.insert(dto);
		%>
		
				<p id="title">등록 상품 정보</p>
				<p class="result-show">아이디 : <%= id %></p>
				<p class="result-show">상품명 : <%= name %></p>
				<p class="result-show">상품설명 : <%= content %></p>
				<p class="result-show">가격 : <%= price %></p>
		
		<%
			}
		%>
		
		<span><button onclick="window.close()">창닫기</button></span>
		<span><button onclick="location.href='insert.html'">돌아가기</button></span>
		<span><button onclick="location.href='selectAll.jsp'">상품 리스트 확인</button></span>
	</div>
</div>
</body>
</html>