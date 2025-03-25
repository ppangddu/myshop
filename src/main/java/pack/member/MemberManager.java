package pack.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MemberManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("MemberManager Driver 로딩 실패 : " + e.getMessage());
		}
	}
	
	// 동 이름으로 우편자료 검색
	public ArrayList<ZipcodeDto> zipcodeRead(String dongName) {
		ArrayList<ZipcodeDto> list = new ArrayList<ZipcodeDto>();
		try {
			conn = ds.getConnection();
			String sql = "select * from ziptab where area3 like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dongName + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {//여러개니까 while로 돌린다.
				ZipcodeDto zipcodeDto = new ZipcodeDto();
				zipcodeDto.setZipcode(rs.getString("zipcode"));
				zipcodeDto.setArea1(rs.getString("area1"));
				zipcodeDto.setArea2(rs.getString("area2"));
				zipcodeDto.setArea3(rs.getString("area3"));
				zipcodeDto.setArea4(rs.getString("area4"));
				list.add(zipcodeDto);
			}
		} catch (Exception e) {
			System.out.println("zipcoderead Error 로딩 실패 : " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				
			}
		}
		return list;
	}
	
	public boolean idCheckProcess(String id) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select id from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			b = rs.next();
			
		} catch (Exception e) {
			System.out.println("idCheckProcess: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				
			}
		}
		return b;
	}
	
	public boolean memberInsert(MemberBean mbean) { // id는 자동 증가 X
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPasswd());
			pstmt.setString(3, mbean.getName());
			pstmt.setString(4, mbean.getEmail());
			pstmt.setString(5, mbean.getPhone());
			pstmt.setString(6, mbean.getZipcode());
			pstmt.setString(7, mbean.getAddress());
			pstmt.setString(8, mbean.getJob());
			
			if (pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("memberInsert Err: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				
			}
		}
		return b;
	}
	
	public boolean loginCheck(String id, String passwd) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select * from member where id=? and passwd=?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			b = rs.next(); // 자료가 있으면 true 없으면 false
			
		} catch (Exception e) {
			System.out.println("loginCheck Err: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				
			}
		}
		return b;
	}
	
	public MemberDto getMember(String id) {
		MemberDto memberDto = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberDto = new MemberDto();
				memberDto.setId(rs.getString("id"));
				memberDto.setPasswd(rs.getString("passwd"));
				memberDto.setName(rs.getString("name"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setPhone(rs.getString("phone"));
				memberDto.setZipcode(rs.getString("zipcode"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			System.out.println("getMember err: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				
			}
		}
		return memberDto;
	}
	
	public boolean memberUpdate(MemberBean bean, String id) {
	    boolean b = false;
	    try {
	        conn = ds.getConnection();
	        String sql = "update member set passwd=?, name=?, email=?, phone=?, zipcode=?, address=?, job=? where id=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, bean.getPasswd());
	        pstmt.setString(2, bean.getName());
	        pstmt.setString(3, bean.getEmail());
	        pstmt.setString(4, bean.getPhone());
	        pstmt.setString(5, bean.getZipcode());
	        pstmt.setString(6, bean.getAddress());
	        pstmt.setString(7, bean.getJob());
	        pstmt.setString(8, id);

	        if (pstmt.executeUpdate() > 0) b = true;
	    } catch (Exception e) {
	        System.out.println("memberUpdate err: " + e.getMessage());
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {}
	    }
	    return b;
	}
	
	public boolean adminLoginCheck(String adminid, String adminpasswd) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select * from admin where admin_id=? and admin_passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminid);
			pstmt.setString(2, adminpasswd);
			rs = pstmt.executeQuery();
			b = rs.next(); // 자료가 있으면 true 없으면 false
		} catch (Exception e) {
	        System.out.println("memberUpdate err: " + e.getMessage());
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {}
	    }
	    return b;
	}
	
	//관리자 : 전체 회원 읽기
	public ArrayList<MemberDto> getMemberAll() {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from member order by id";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { // 복수개
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	        	
	        }
	    }
		return list;
	}
}
