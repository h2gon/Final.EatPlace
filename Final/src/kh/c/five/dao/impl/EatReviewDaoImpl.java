package kh.c.five.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatReviewDao;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
import kh.c.five.model.fileDto;


@Repository
public class EatReviewDaoImpl implements EatReviewDao {
	
	private static EatReviewDaoImpl singles = new EatReviewDaoImpl();
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace ="EatReview.";
		
	
	public EatReviewDaoImpl() {}

	public static EatReviewDaoImpl getInstance() {
		
		return singles;
	}
	
	
	@Override
	public List<fileDto> getImage(int rv_seq) {
		List<fileDto> list = new ArrayList<>();
		list = sqlSession.selectList(namespace+"getImage", rv_seq);
		
		return list;
	}
	
	

	@Override
	public List<String> getImageDT(int rs_seq) {
		List<String> list = new ArrayList<>();
		list = sqlSession.selectList(namespace+"getImageDT", rs_seq);
		
		return list;
	}

	@Override
	public Integer addReview(ReviewDto rdto) {
		int n = sqlSession.insert(namespace+"addReview", rdto);
		return rdto.getSeq();
	}

	@Override
	public void addFile(fileDto fdto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+"addFile", fdto);
	}

	
	@Override
	public int getRvCount(ReviewParam param) {		
		
		return sqlSession.selectOne(namespace + "getRvCount", param);
	}

	@Override
	public int getLikeCount(ReviewParam param) {
		return sqlSession.selectOne(namespace + "getLikeCount", param);
	}
	
	@Override
	public List<fileDto> getRv_Image(int rv_seq) {
		System.out.println("DB Enter List<fileDto> rv_seq:"+rv_seq);
		
		String sql = "SELECT * FROM RS_FILE WHERE RV_SEQ=?";
						
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<fileDto> f_list = new ArrayList<fileDto>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.30.34:1521:xe", "hr", "hr");
			System.out.println("DBConnection Success!!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rv_seq);
			System.out.println("PSMT set Success!!");
			
			rs = psmt.executeQuery();
			System.out.println("Query Execute!!");
		
			while(rs.next()) {
				fileDto dto = new fileDto(rs.getInt(1),
						rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
				f_list.add(dto);
			}System.out.println("f_list set Success!!");
			System.out.println("f_list.size: "+f_list.size());
			
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			try {
				if(psmt != null) {
					psmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				if(rs != null) {
					rs.close();
				}	
				System.out.println("DB close Success!!");
			} catch (Exception e) {
				System.err.println(e);
			}
		}
		return f_list;		
	}
	
	

	@Override
	public ReviewDto getReviewWPic(fileDto fdto) {
		return sqlSession.selectOne(namespace+"getReviewWPic", fdto);
		 
	}

	@Override
	public String getNickName(String id) {
System.out.println("DB getNickName id:"+id);
		
		String sql = "SELECT * FROM EATMEMBER WHERE ID=?";
						
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String nickName = "";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.30.34:1521:xe", "hr", "hr");
			System.out.println("DBConnection Success!!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("PSMT set Success!!");
			
			rs = psmt.executeQuery();
			System.out.println("Query Execute!!");
		
			if(rs.next()) {
				nickName = rs.getString(6);
			}System.out.println("nickName:"+nickName);
			
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			try {
				if(psmt != null) {
					psmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				if(rs != null) {
					rs.close();
				}	
				System.out.println("DB close Success!!");
			} catch (Exception e) {
				System.err.println(e);
			}
		}
		return nickName;	
	}
	@Override
	public ReviewDto getReviewDetail(int rv_seq) {
		
		return sqlSession.selectOne(namespace+"getReviewDetail", rv_seq);
	}

	@Override
	public int getreviewcount(String id) {
		
		return sqlSession.selectOne(namespace+"getreviewcount", id);
	}

	@Override
	public int getLikeCountPid(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getLikeCountPid", id);
	}



	

}
