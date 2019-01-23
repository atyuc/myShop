package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DBConnectionMgr;

public class ProductDAO {
	/* 상품목록 DAO */
	DBConnectionMgr pool;
	Connection con;
	
	public ProductDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//상품입력
	public void insert(ProductDTO dto) throws Exception {
		con = pool.getConnection();		//연결코드
	
		//순서 : 제품코드, 제품명, 카테고리, 가격, 제품설명, 이미지
		String sql = "insert into product values (?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getName());
		ps.setString(3, dto.getContent());
		ps.setInt(4, dto.getPrice());
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료");
		
		pool.freeConnection(con, ps); 		//con은 반환, ps는 연결끊기
	}
	
	//아이디 존재 확인
	public String selectId(String input) throws Exception {
		con = pool.getConnection();		//연결코드
		
		//3. SQL문 객체화
		String sql = "select id from product where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, input);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		String id = null;
		
		if(rs.next()) {	//커서를 옮겨서 레코드가 있는지 체크
			id = rs.getString(1);
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return id;
	}
	
	//상품수정
	public void update(ProductDTO dto) throws Exception {
		con = pool.getConnection();		//연결코드
		
		//3. SQL문 객체화
		String sql = null;
		PreparedStatement ps = null;
				
		if (dto.getContent() != "" && dto.getPrice() != 0) {
			sql = "update product set content = ?, price = ? where id = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getContent());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getId());
			
		} else if (dto.getContent() != "") {
			sql = "update product set content = ? where id = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getContent());
			ps.setString(2, dto.getId());
			
		} else if (dto.getPrice() != 0) {
			sql = "update product set price = ? where id = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getPrice());
			ps.setString(2, dto.getId());
		}
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료");
		
		pool.freeConnection(con, ps); 		//con은 반환, ps는 연결끊기
	}
	
	//상품삭제
	public void delete(String id) throws Exception {
		con = pool.getConnection();		//연결코드
		
		//3. SQL문 객체화
		String sql = "delete from product where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료");
		
		pool.freeConnection(con, ps); 		//con은 반환, ps는 연결끊기		
	}
	
	//상품검색
	public ProductDTO select(String input) throws Exception {
		con = pool.getConnection();		//연결코드
	
		//3. SQL문 객체화
		String sql = "select * from product where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, input);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ProductDTO dto = null;	//선언을 while문 밖으로 빼야함
		
		if(rs.next()) {	//커서를 옮겨서 레코드가 있는지 체크
			dto = new ProductDTO();
		
			dto.setId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setPrice(rs.getInt(4));
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return dto;
	}
	
	//상품전체리스트
	public ArrayList<ProductDTO> selectAll() throws Exception {
		con = pool.getConnection();		//연결코드
	
		//3. SQL문 객체화
		String sql = "select * from product";
		PreparedStatement ps = con.prepareStatement(sql);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ProductDTO dto = null;	//선언을 while문 밖으로 빼야함
		
		//불러오는 전체 DTO가 들어갈 수 있는 컬렉션 생성
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		while(rs.next()) {	//커서를 옮겨서 레코드가 있는지 체크 (다음데이터가 있을 때 까지 돌아감)
			dto = new ProductDTO();
			
			dto.setId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setPrice(rs.getInt(4));
			
			list.add(dto);	//ArrayList에 값 추가	
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return list;
	}
}
