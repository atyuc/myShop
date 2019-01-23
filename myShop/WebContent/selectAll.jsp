<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품리스트페이지</title>

	<!-- CSS -->
	<link href="css/product.css" rel="stylesheet" type="text/css" media="all">
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
<div class="basics">
	<div id="title">
		상품 목록
	</div>
	
	<div class="table-body">
	<%
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		list = dao.selectAll();
	%>
		
		<!-- 상품 목록 테이블 -->
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>상품명</th>
					<th>상세설명</th>
					<th>가격</th>
				</tr>
			</thead>
			
			<tbody>
			
		<%
			//상품 리스트 출력
			for (int i = 0; i < list.size(); i++) {
				dto = list.get(i);
		%>
				<tr>
					<td><%= dto.getId() %></td>
					<td><%= dto.getName() %></td>
					<td><%= dto.getContent() %></td>
					<td><%= dto.getPrice() %></td>
				</tr>	
		<%
			}
		%>
		
			</tbody>
		</table>
		
		<span><button onclick="window.close()">창닫기</button></span>
	</div>
</div>
</body>
</html>