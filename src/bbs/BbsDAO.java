package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;//데이터 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs;//어떠한 정보를 담을 수 있는 객체
	
	//생성자 mysql 접속 부분
	public BbsDAO(){
		try{
			String dbURl = "jdbc:mysql://localhost:3306/BBS";
			String dbID ="root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");//접속 라이브러리
			conn = DriverManager.getConnection(dbURl, dbID, dbPassword); //conn 객체 안에 mysql Dㅠ가 담김
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public String getDate(){ //현재 등록 시간, date 함수
		String SQL = "SELECT NOW()";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()){
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";// 데이터베이스 오류
	}
	
	public int getNext(){ //게시글 번호
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID desc";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()){
				return rs.getInt(1)+ 1;//게시글 번호 1씩 늘어남
			}
			return 1;//첫 번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent){ //게시글 작성
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	//게시판 리스트
	public ArrayList<Bbs> getList(int pageNumber, String userID){ 
		String SQL = "SELECT * from BBS WHERE bbsID < ? AND userID = ? AND bbsAvailable = 1  ORDER BY bbsID DESC Limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10); //페이지 설정
			pstmt.setString(2, userID);
			rs = pstmt.executeQuery();
			while (rs.next()){ //게시글 목록을 담기
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);//게시글 번호 1씩 늘어남
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;// 게시판 리스트 글
	}
	public boolean nextPage(int pageNumber){ //페이징 처리
		String SQL = "SELECT * from BBS WHERE bbsID < ? AND bbsAvailable = 1";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10); //페이지 설정
			rs = pstmt.executeQuery();
			if(rs.next()){
				return true; //다음페이지로 넘어갈 수 있다.
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;//다음페이지 넘어가기 실패		
	}
	
	public Bbs getBbs(int bbsID){
		String SQL = "SELECT * from BBS WHERE bbsID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int update(int bbsID, String bbsTitle, String bbsContent){ //수정하기
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,bbsTitle);
			pstmt.setString(2,bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	public int delete(int bbsId){
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bbsId);
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	
	//페이징 처리
		public int getCount(String userID) {
			String SQL = "select count(*) from bbs where userID =?";
			try {
				PreparedStatement pstmt=conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1);
				}			
			} catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}

}
